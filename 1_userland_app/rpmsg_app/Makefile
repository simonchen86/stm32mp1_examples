# This Makefile is provided as an example of how to build a process that can
# communicate with a Storyboard application.  It may require modifications in
# order to build on your host system.  Please see ReadMe.html for a complete
# explanation

# Linux users add this
CFLAGS2 = -Wall 
LDFLAGS2 = -lpthread -lm -lc

all: rpmsg_app

rpmsg_app: rpmsg_app.c
	$(CC) $(CFLAGS) $(CFLAGS2) -o $@ $^ $(LDFLAGS) $(LDFLAGS2)

