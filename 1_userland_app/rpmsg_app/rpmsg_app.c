/*
 * logic_analyser_backend.c
 * Implements the logic analyser backend to intereact with the GUI.
 *
 * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
 * Author: Michel Catrouillet <michel.catrouillet@st.com> for STMicroelectronics.
 *
 * License type: GPLv2
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 as published by
 * the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program. If not, see
 * <http://www.gnu.org/licenses/>.
 */

#define _GNU_SOURCE             /* To get DN_* constants from <fcntl.h> */
#include <signal.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <termios.h>
#include <fcntl.h>
#include <inttypes.h>
#include <time.h>
#include <pthread.h>
#include <unistd.h> // for usleep
#include <math.h>
#include <sys/ioctl.h>
#include <sys/time.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/eventfd.h>
#include <sys/poll.h>
#include <regex.h>
#include <sched.h>
#include <assert.h>
#include <errno.h>
#include <error.h>

#define DATA_BUF_POOL_SIZE 1024*1024 /* 1MB */
#define MAX_BUF 80

#define PORT 8888
#define GET             0
#define POST            1
#define POSTBUFFERSIZE  512

#define DMA_DDR_BUFF 1
#define PHYS_RESERVED_REGION_ADDR 0xdb000000
#define PHYS_RESERVED_REGION_SIZE 0x1000000

#define RPMSG_SDB_IOCTL_SET_EFD _IOW('R', 0x00, struct rpmsg_sdb_ioctl_set_efd *)
#define RPMSG_SDB_IOCTL_GET_DATA_SIZE _IOWR('R', 0x01, struct rpmsg_sdb_ioctl_get_data_size *)

#define TIMEOUT 60
#define NB_BUF 1

typedef struct
{
    int bufferId, eventfd;
} rpmsg_sdb_ioctl_set_efd;

typedef struct
{
    int bufferId;
    uint32_t size;
} rpmsg_sdb_ioctl_get_data_size;

struct connection_info_struct
{
  int connectiontype;
  char *answerstring;
  struct MHD_PostProcessor *postprocessor;
};

//pthread_mutex_t ttyMutex;

struct MHD_Daemon *mHttpDaemon;

char FIRM_NAME[50];
struct timeval tval_before, tval_after, tval_result;

/* The file descriptor used to manage our TTY over RPMSG */
static int mFdRpmsg = -1;


static int virtual_tty_send_command(int len, char* commandStr);

static char mByteBuffer[1024];

static pthread_t thread_tty;

static uint8_t mExitRequested = 0, mErrorDetected = 0;
static uint8_t mThreadCancel = 0;
//static    char tmpStr[80];

FILE *pOutFile;
static char mFileNameStr[150];
static pthread_t thread, thread2;

static int efd[NB_BUF];
static struct pollfd fds[NB_BUF];
    
/********************************************************************************
Copro functions allowing to manage a virtual TTY over RPMSG
*********************************************************************************/
int copro_isFwRunning(void)
{
    int fd;
    size_t byte_read;
    int result = 0;
    unsigned char bufRead[MAX_BUF];
    fd = open("/sys/class/remoteproc/remoteproc0/state", O_RDWR);
    if (fd < 0) {
        printf("Error opening remoteproc0/state, err=-%d\n", errno);
        return (errno * -1);
    }
    byte_read = (size_t) read (fd, bufRead, MAX_BUF);
    if (byte_read >= strlen("running")) {
        char* pos = strstr((char*)bufRead, "running");
        if(pos) {
            result = 1;
        }
    }
    close(fd);
    return result;
}

int copro_stopFw(void)
{
    int fd;
    fd = open("/sys/class/remoteproc/remoteproc0/state", O_RDWR);
    if (fd < 0) {
        printf("Error opening remoteproc0/state, err=-%d\n", errno);
        return (errno * -1);
    }
    write(fd, "stop", strlen("stop"));
    close(fd);
    return 0;
}

int copro_startFw(void)
{
    int fd;
    fd = open("/sys/class/remoteproc/remoteproc0/state", O_RDWR);
    if (fd < 0) {
        printf("Error opening remoteproc0/state, err=-%d\n", errno);
        return (errno * -1);
    }
    write(fd, "start", strlen("start"));
    close(fd);
    return 0;
}

int copro_getFwPath(char* pathStr)
{
    int fd;
    int byte_read;
    fd = open("/sys/module/firmware_class/parameters/path", O_RDWR);
    if (fd < 0) {
        printf("Error opening firmware_class/parameters/path, err=-%d\n", errno);
        return (errno * -1);
    }
    byte_read = read (fd, pathStr, MAX_BUF);
    close(fd);
    return byte_read;
}

int copro_setFwPath(char* pathStr)
{
    int fd;
    int result = 0;
    fd = open("/sys/module/firmware_class/parameters/path", O_RDWR);
    if (fd < 0) {
        printf("Error opening firmware_class/parameters/path, err=-%d\n", errno);
        return (errno * -1);
    }
    result = write(fd, pathStr, strlen(pathStr));
    close(fd);
    return result;
}

int copro_getFwName(char* pathStr)
{
    int fd;
    int byte_read;
    fd = open("/sys/class/remoteproc/remoteproc0/firmware", O_RDWR);
    if (fd < 0) {
        printf("Error opening remoteproc0/firmware, err=-%d\n", errno);
        return (errno * -1);
    }
    byte_read = read (fd, pathStr, MAX_BUF);
    close(fd);
    return byte_read;
}

int copro_setFwName(char* nameStr)
{
    int fd;
    int result = 0;
    fd = open("/sys/class/remoteproc/remoteproc0/firmware", O_RDWR);
    if (fd < 0) {
        printf("Error opening remoteproc0/firmware, err=-%d\n", errno);
        return (errno * -1);
    }
    result = write(fd, nameStr, strlen(nameStr));
    close(fd);
    return result;
}

int copro_openTtyRpmsg(int modeRaw)
{
    struct termios tiorpmsg;
    mFdRpmsg = open("/dev/ttyRPMSG0", O_RDWR |  O_NOCTTY | O_NONBLOCK);
    if (mFdRpmsg < 0) {
        printf("Error opening ttyRPMSG0, err=-%d\n", errno);
        return (errno * -1);
    }
    /* get current port settings */
    tcgetattr(mFdRpmsg,&tiorpmsg);
    if (modeRaw) {
        tiorpmsg.c_iflag &= ~(IGNBRK | BRKINT | PARMRK | ISTRIP
                      | INLCR | IGNCR | ICRNL | IXON);
        tiorpmsg.c_oflag &= ~OPOST;
        tiorpmsg.c_lflag &= ~(ECHO | ECHONL | ICANON | ISIG | IEXTEN);
        tiorpmsg.c_cflag &= ~(CSIZE | PARENB);
        tiorpmsg.c_cflag |= CS8;
    } else {
        /* ECHO off, other bits unchanged */
        tiorpmsg.c_lflag &= ~ECHO;
        /*do not convert LF to CR LF */
        tiorpmsg.c_oflag &= ~ONLCR;
    }
    tcsetattr(mFdRpmsg, TCSANOW, &tiorpmsg);
    return 0;
}

int copro_closeTtyRpmsg(void)
{
    close(mFdRpmsg);
    mFdRpmsg = -1;
    return 0;
}

int copro_writeTtyRpmsg(int len, char* pData)
{
    int result = 0;
    if (mFdRpmsg < 0) {
        printf("Error writing ttyRPMSG0, fileDescriptor is not set\n");
        return mFdRpmsg;
    }

    result = write(mFdRpmsg, pData, len);
    return result;
}

int copro_readTtyRpmsg(int len, char* pData)
{
    int byte_rd, byte_avail;
    int result = 0;
    if (mFdRpmsg < 0) {
        printf("Error reading ttyRPMSG0, fileDescriptor is not set\n");
        return mFdRpmsg;
    }
    ioctl(mFdRpmsg, FIONREAD, &byte_avail);
    if (byte_avail > 0) {
        if (byte_avail >= len) {
            byte_rd = read (mFdRpmsg, pData, len);
        } else {
            byte_rd = read (mFdRpmsg, pData, byte_avail);
        }
        //printf("read successfully %d bytes to %p, [0]=0x%x\n", byte_rd, pData, pData[0]);
        result = byte_rd;
    } else {
        result = 0;
    }
    return result;
}
/********************************************************************************
End of Copro functions
*********************************************************************************/

static void
open_raw_file(void) {
    time_t t = time(NULL);
    struct tm tm = *localtime(&t);
    sprintf(mFileNameStr, "./sdb_demo_%04d%02d%02d-%02d%02d%02d.dat",
        tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
    pOutFile = fopen(mFileNameStr,"wb");
}

static int32_t
write_raw_file(unsigned char* pData, unsigned int size) {
    // perform the write by packets of 4kB
    int rest2write = size;
    int index = 0;
    int size2write = 4096;
    int writtenSize = 0;
    do {
        if (rest2write < 4096) {
            size2write = rest2write;
        }
        writtenSize += fwrite(pData+index, 1, size2write, pOutFile);
        rest2write -= size2write;
        index += size2write;
    } while (rest2write > 0);
    return writtenSize;
}

static void
close_raw_file(void) {
    fclose(pOutFile);
}

int64_t
print_time() {
    struct timespec ts;
    clock_gettime(1, &ts);
    printf("Time: %lld\n", (ts.tv_sec * 1000LL) + (ts.tv_nsec / 1000000LL));
}

static void sleep_ms(int milliseconds)
{
    usleep(milliseconds * 1000);
}

static int virtual_tty_send_command(int len, char* commandStr) {

    struct timespec ts;
    clock_gettime(1, &ts);
    printf("[%lld] virtual_tty_send_command len=%d => %s\n",
        (ts.tv_sec * 1000LL) + (ts.tv_nsec / 1000000LL), len, commandStr);
    return copro_writeTtyRpmsg(len, commandStr);
}

size_t getFilesize(const char* filename) {
    struct stat st;
    stat(filename, &st);
    return st.st_size;
}

void incatchr(int signum){
      printf("%s!\n",__func__);
}

void exit_fct(int signum)
{
    mThreadCancel = 1;
    sleep_ms(100);
    
    if (copro_isFwRunning()) {
        mExitRequested = 1;
        copro_closeTtyRpmsg();
        copro_stopFw();
        printf("stop the firmware before exit\n");
    }
    exit(signum);
}

void *vitural_tty_thread(void *arg)
{
    int read;

    while (1) {
        if (mThreadCancel) break;    // kill thread requested
        read = copro_readTtyRpmsg(1024, mByteBuffer);
        if (read > 0) {
            mByteBuffer[read] = 0;
            gettimeofday(&tval_after, NULL);
            timersub(&tval_after, &tval_before, &tval_result);
            printf("[%ld.%06ld] virtTTY_RX %d bytes: %s\n", (long int)tval_result.tv_sec, (long int)tval_result.tv_usec, read, mByteBuffer);
            
        }
        else
        {        
            //Keep trigger the sampling
            printf("A7: RE-trigger sampling\n");
            virtual_tty_send_command(strlen("ST"), "ST");
        }
        sleep_ms(5);      // give time to UI
    }
}


int main(int argc, char **argv)
{
    int ret = 0, i, cmd;
    char FwName[30];
    
    strcpy(FIRM_NAME, "exchange_buf_CM4.elf");
    /* check if copro is already running */
    ret = copro_isFwRunning();
    if (ret) {
        // check FW name
        int nameLn = copro_getFwName(FwName);
        if (FwName[nameLn-1] == 0x0a) {
            FwName[nameLn-1] = 0x00;   // replace \n by \0
        }
        if (strcmp(FwName, FIRM_NAME) == 0) {
            printf("%s is already running.\n", FIRM_NAME);
            goto fwrunning;
        }else {
            printf("wrong FW running. Try to stop it... \n");
            if (copro_stopFw()) {
                printf("fails to stop firmware\n");
                goto end;
            }
        }
    }

setname:
    /* set the firmware name to load */
    ret = copro_setFwName(FIRM_NAME);
    if (ret <= 0) {
        printf("fails to change the firmware name\n");
        goto end;
    }

    /* start the firmware */
    if (copro_startFw()) {
        printf("fails to start firmware\n");
        goto end;
    }
    /* wait for 1 seconds the creation of the virtual ttyRPMSGx */
    sleep_ms(1000);

fwrunning:
    signal(SIGINT, exit_fct); /* Ctrl-C signal */
    signal(SIGTERM, exit_fct); /* kill command */
    gettimeofday(&tval_before, NULL);    // get current time
    // open the ttyRPMSG in raw mode
    if (copro_openTtyRpmsg(1)) {
        printf("fails to open the tty RPMESG\n");
        return (errno * -1);
    }
    
    if (pthread_create( &thread_tty, NULL, vitural_tty_thread, NULL) != 0) {
        printf("vitural_tty_thread creation fails\n");
        goto end;
    }
    
    virtual_tty_send_command(strlen("ST"), "ST");    // start sampling
            
    printf("Entering in Main loop\n");

    while (1) {
        if (mExitRequested) break;
        
        sleep_ms(1);      // give time to UI
    }

end:
    mThreadCancel = 1;
    sleep_ms(100);
    /* check if copro is already running */
    if (copro_isFwRunning()) {
        printf("stop the firmware before exit\n");
        copro_closeTtyRpmsg();
        copro_stopFw();
    }
    return ret;
}
