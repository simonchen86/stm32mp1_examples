/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under Ultimate Liberty license
  * SLA0044, the "License"; You may not use this file except in compliance with
  * the License. You may obtain a copy of the License at:
  *                             www.st.com/SLA0044
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "openamp.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "virt_uart.h"
#include "rpmsg_hdr.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

typedef struct __HDR_DdrBuffTypeDef
{
  uint32_t physAddr;
  uint32_t physSize;
}HDR_DdrBuffTypeDef;

typedef enum
{
  HDRSTATUS_INIT,
  HDRSTATUS_IDLE,
  HDRSTATUS_START,
  HDRSTATUS_WAIT,
  HDRSTATUS_DONE,
  HDRSTATUS_ABORT
} HDR_StatusTypeDef;

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define SAMP_SRAM_PACKET_SIZE (4096)
#define SAMP_DDR_BUFFER_SIZE (4096)
#define SAMP_DDR_BUFFER_CNT (1)

#define COPRO_SYNC_SHUTDOWN_CHANNEL  IPCC_CHANNEL_3
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
IPCC_HandleTypeDef hipcc;

DMA_HandleTypeDef hdma_memtomem_dma2_stream1;
/* USER CODE BEGIN PV */
static struct rpmsg_virtio_device rvdev;
RPMSG_HDR_HandleTypeDef hsdb0;
VIRT_UART_HandleTypeDef huart0;

__IO FlagStatus VirtUart0RxMsg = RESET;
__IO FlagStatus SDB0RxMsg = RESET;

volatile HDR_StatusTypeDef fHDRStatus = HDRSTATUS_INIT;

char mUartBuffTx[512];
uint8_t VirtUart0ChannelBuffRx[100];
uint16_t VirtUart0ChannelRxSize = 0;
uint8_t SDB0ChannelBuffRx[100];
uint16_t SDB0ChannelRxSize = 0;
char mSdbBuffTx[512];

volatile static HDR_DdrBuffTypeDef mArrayDdrBuff[SAMP_DDR_BUFFER_CNT];
volatile uint8_t mArrayDdrBuffIndex = 0;
volatile uint8_t mArrayDdrBuffCount = 0;

volatile uint8_t mArraySramBuff[SAMP_SRAM_PACKET_SIZE];
volatile uint8_t mArraySramVal = 0;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_IPCC_Init(void);
int MX_OPENAMP_Init(int RPMsgRole, rpmsg_ns_bind_cb ns_bind_cb);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

void VIRT_UART0_RxCpltCallback(VIRT_UART_HandleTypeDef *huart)
{
    // copy received msg in a buffer
    VirtUart0ChannelRxSize = huart->RxXferSize < 100? huart->RxXferSize : 99;
    memcpy(VirtUart0ChannelBuffRx, huart->pRxBuffPtr, VirtUart0ChannelRxSize);
    VirtUart0ChannelBuffRx[VirtUart0ChannelRxSize] = 0;   // insure end of String
    sprintf(mUartBuffTx, "CM4 : VIRT_UART0_RxCpltCallback: %s\n", VirtUart0ChannelBuffRx);
    VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
    VirtUart0RxMsg = SET;
}

void SDB0_RxCpltCallback(RPMSG_HDR_HandleTypeDef *huart)
{
    // copy received msg in a buffer
    SDB0ChannelRxSize = huart->RxXferSize < 100? huart->RxXferSize : 99;
    memcpy(SDB0ChannelBuffRx, huart->pRxBuffPtr, SDB0ChannelRxSize);
    SDB0ChannelBuffRx[SDB0ChannelRxSize] = 0;   // insure end of String
    sprintf(mUartBuffTx, "CM4 : SDB0_RxCpltCallback: %s\n", SDB0ChannelBuffRx);
    VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
    SDB0RxMsg = SET;
}

static void TransferCompleteDDR(DMA_HandleTypeDef *DmaHandle)
{
	fHDRStatus = HDRSTATUS_DONE;
}

static void TransferErrorDDR(DMA_HandleTypeDef *DmaHandle)
{
    sprintf(mUartBuffTx, "CM4 : DMA DDR TransferError CB !!!\n");
    VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
}

void treatRxCommand() {
	switch(VirtUart0ChannelBuffRx[0]) {
		case 'S':
			if (fHDRStatus == HDRSTATUS_IDLE) {
				fHDRStatus = HDRSTATUS_START;

				sprintf(mUartBuffTx, "CM4 : START command !!!\n");
				VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
			}
			else {
				sprintf(mUartBuffTx, "CM4 : START with error status:%d !!!\n", fHDRStatus);
				VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
			}
			break;
		case 'E':
			fHDRStatus = HDRSTATUS_ABORT;
			sprintf(mUartBuffTx, "CM4 : EXIT command !!!\n");
			VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
			break;
		case 'R':
			sprintf(mUartBuffTx, "CM4 : boot successful with STM32Cube FW version: v%ld.%ld.%ld \n",
					((HAL_GetHalVersion() >> 24) & 0x000000FF),
					((HAL_GetHalVersion() >> 16) & 0x000000FF),
					((HAL_GetHalVersion() >> 8) & 0x000000FF));
			VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
			break;
		default:
			sprintf(mUartBuffTx, "CM4 : Error command:%c instead of: S\n",
					VirtUart0ChannelBuffRx[0]);
			VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
			break;
	}
}

void treatSDBEvent() {
    // example command: B0AxxxxxxxxLyyyyyyyy => Buff0 @:xx..x Length:yy..y
    if (SDB0ChannelBuffRx[0] != 'B') {
        sprintf(mUartBuffTx, "CM4 : treatSDBEvent ERROR wrong buffer command:%c\n", SDB0ChannelBuffRx[0]);
        VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
    }
    if (!((SDB0ChannelBuffRx[1] >= '0' && SDB0ChannelBuffRx[1] <= '3'))) {
        sprintf(mUartBuffTx, "CM4 : treatSDBEvent ERROR wrong buffer index:%c\n", SDB0ChannelBuffRx[1]);
        VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
        return;
    }
    if (mArrayDdrBuffCount != (SDB0ChannelBuffRx[1] - '0')) {
        sprintf(mUartBuffTx, "CM4 : treatSDBEvent ERROR wrong buffer received index:%c awaited index:%d\n",
                SDB0ChannelBuffRx[1], mArrayDdrBuffCount);
        VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
        return;
    }
    if (SDB0ChannelBuffRx[2] != 'A') {
        sprintf(mUartBuffTx, "CM4 : treatSDBEvent ERROR wrong buffer address tag:%c instead of:A\n", SDB0ChannelBuffRx[1]);
        VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
        return ;
    }
    if (SDB0ChannelBuffRx[11] != 'L') {
        sprintf(mUartBuffTx, "CM4 : treatSDBEvent ERROR wrong buffer length tag:%c instead of:L\n", SDB0ChannelBuffRx[11]);
        VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
        return ;
    }
    for (int i=0; i<8; i++) {
        if (!((SDB0ChannelBuffRx[3+i] >= '0' && SDB0ChannelBuffRx[3+i] <= '9') || (SDB0ChannelBuffRx[3+i] >= 'a' && SDB0ChannelBuffRx[3+i] <= 'f'))) {
            sprintf(mUartBuffTx, "CM4 : treatSDBEvent ERROR wrong address digit:%c at offset:%d\n", SDB0ChannelBuffRx[3+i], 3+i);
            VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
            return ;
        }
        if (!((SDB0ChannelBuffRx[12+i] >= '0' && SDB0ChannelBuffRx[12+i] <= '9') || (SDB0ChannelBuffRx[12+i] >= 'a' && SDB0ChannelBuffRx[12+i] <= 'f'))) {
            sprintf(mUartBuffTx, "CM4 : treatSDBEvent ERROR wrong length digit:%c at offset:%d\n", SDB0ChannelBuffRx[12+i], 12+i);
            VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));
            return ;
        }
    }
    // save DDR buff @ and size
    mArrayDdrBuff[mArrayDdrBuffCount].physAddr = (uint32_t)strtoll((char*)&SDB0ChannelBuffRx[3], NULL, 16);
    mArrayDdrBuff[mArrayDdrBuffCount].physSize = (uint32_t)strtoll((char*)&SDB0ChannelBuffRx[12], NULL, 16);
    sprintf(mUartBuffTx, "CM4 : treatSDBEvent OK physAddr=0x%lx physSize=%ld mArrayDdrBuffCount=%d\n",
            mArrayDdrBuff[mArrayDdrBuffCount].physAddr,
            mArrayDdrBuff[mArrayDdrBuffCount].physSize,
            mArrayDdrBuffCount);
    VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));

    mArrayDdrBuffCount++;
    if (mArrayDdrBuffCount == SAMP_DDR_BUFFER_CNT) {
    	fHDRStatus = HDRSTATUS_IDLE;
    }
}

void LAStateMachine(void) {
    OPENAMP_check_for_message();
    if (VirtUart0RxMsg) {
      VirtUart0RxMsg = RESET;
      treatRxCommand();
    }

    if (SDB0RxMsg) {
        SDB0RxMsg = RESET;
        treatSDBEvent();
    }

    switch(fHDRStatus) {
		case HDRSTATUS_INIT:
			break;
		case HDRSTATUS_IDLE:
			break;
		case HDRSTATUS_START:
			fHDRStatus = HDRSTATUS_WAIT;

			HAL_Delay(1000);

			__ISB();
			__DSB();

			//debug only
			{
				int i;
				for (i = 0; i < SAMP_SRAM_PACKET_SIZE; i++)
					mArraySramBuff[i] = mArraySramVal;
				mArraySramVal++; //Change Sram value for echo buffer, uint8_t, range:0~255
			}

			if (HAL_DMA_Start_IT(&hdma_memtomem_dma2_stream1,
					(uint32_t)&mArraySramBuff[0],
					mArrayDdrBuff[mArrayDdrBuffIndex].physAddr,
					SAMP_DDR_BUFFER_SIZE) != HAL_OK) {
				/* Transfer Error */
				sprintf(mUartBuffTx, "CM4 : HAL_DMA_Start_IT() error !!!\n");
				VIRT_UART_Transmit(&huart0, (uint8_t*)mUartBuffTx, strlen(mUartBuffTx));

				fHDRStatus = HDRSTATUS_ABORT;
			}
			break;
		case HDRSTATUS_WAIT:
			break;
		case HDRSTATUS_DONE:
			fHDRStatus = HDRSTATUS_IDLE;

			// time to change DDR buffer and send MSG to Linux
			sprintf(mSdbBuffTx, "B%dL%08x", mArrayDdrBuffIndex, SAMP_DDR_BUFFER_SIZE);
			RPMSG_HDR_Transmit(&hsdb0, (uint8_t*)mSdbBuffTx, strlen(mSdbBuffTx));

			mArrayDdrBuffIndex++;
			if (mArrayDdrBuffIndex == mArrayDdrBuffCount) {
				mArrayDdrBuffIndex = 0;
			}
			break;
		case HDRSTATUS_ABORT:
			HAL_DMA_Abort_IT(&hdma_memtomem_dma2_stream1);

			fHDRStatus = HDRSTATUS_IDLE;
			break;
		default:
			break;
    }
}

void CoproSync_ShutdownCb(IPCC_HandleTypeDef * hipcc, uint32_t ChannelIndex, IPCC_CHANNELDirTypeDef ChannelDir)
{
  /* Deinit the peripherals */
    HAL_NVIC_DisableIRQ(DMA2_Stream1_IRQn);

	/* When ready, notify the remote processor that we can be shut down */
	HAL_IPCC_NotifyCPU(hipcc, ChannelIndex, IPCC_CHANNEL_DIR_RX);
}

void DMA2_Stream1_IRQHandler(void)
{
  HAL_DMA_IRQHandler(&hdma_memtomem_dma2_stream1);
}
/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  if(IS_ENGINEERING_BOOT_MODE())
  {
    /* Configure the system clock */
    SystemClock_Config();
  }
  else
  {
    /* IPCC initialisation */
     MX_IPCC_Init();
    /* OpenAmp initialisation ---------------------------------*/
    MX_OPENAMP_Init(RPMSG_REMOTE, NULL);
  }

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  /* USER CODE BEGIN 2 */
  HAL_DMA_RegisterCallback(&hdma_memtomem_dma2_stream1, HAL_DMA_XFER_CPLT_CB_ID, TransferCompleteDDR);
  HAL_DMA_RegisterCallback(&hdma_memtomem_dma2_stream1, HAL_DMA_XFER_ERROR_CB_ID, TransferErrorDDR);

  HAL_IPCC_ActivateNotification(&hipcc, COPRO_SYNC_SHUTDOWN_CHANNEL, IPCC_CHANNEL_DIR_RX,
            CoproSync_ShutdownCb);
  /*
  * Create HDR device
  * defined by a rpmsg channel attached to the remote device
  */
  hsdb0.rvdev =  &rvdev;
  log_info("SDB OpenAMP-rpmsg channel creation\n");
  if (RPMSG_HDR_Init(&hsdb0) != RPMSG_HDR_OK) {
    log_err("RPMSG_HDR_Init HDR failed.\n");
    Error_Handler();
  }

  /*Need to register callback for message reception by channels*/
  if(RPMSG_HDR_RegisterCallback(&hsdb0, RPMSG_HDR_RXCPLT_CB_ID, SDB0_RxCpltCallback) != RPMSG_HDR_OK)
  {
    Error_Handler();
  }

  /*
   * Create Virtual UART device
   * defined by a rpmsg channel attached to the remote device
   */
  huart0.rvdev =  &rvdev;
  log_info("Virtual UART0 OpenAMP-rpmsg channel creation\r\n");
  if (VIRT_UART_Init(&huart0) != VIRT_UART_OK) {
    log_err("VIRT_UART_Init UART0 failed.\r\n");
    //_Error_Handler(__FILE__, __LINE__);
    Error_Handler();
  }

  /*Need to register callback for message reception by channels*/
  if(VIRT_UART_RegisterCallback(&huart0, VIRT_UART_RXCPLT_CB_ID, VIRT_UART0_RxCpltCallback) != VIRT_UART_OK)
  {
    Error_Handler();
  }

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */

  while (1)
  {
    LAStateMachine();
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure LSE Drive Capability
  */
  HAL_PWR_EnableBkUpAccess();
  __HAL_RCC_LSEDRIVE_CONFIG(RCC_LSEDRIVE_MEDIUMHIGH);
  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI|RCC_OSCILLATORTYPE_HSE
                              |RCC_OSCILLATORTYPE_LSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_BYPASS_DIG;
  RCC_OscInitStruct.LSEState = RCC_LSE_ON;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = 16;
  RCC_OscInitStruct.HSIDivValue = RCC_HSI_DIV1;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  RCC_OscInitStruct.PLL2.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL2.PLLSource = RCC_PLL12SOURCE_HSE;
  RCC_OscInitStruct.PLL2.PLLM = 3;
  RCC_OscInitStruct.PLL2.PLLN = 66;
  RCC_OscInitStruct.PLL2.PLLP = 2;
  RCC_OscInitStruct.PLL2.PLLQ = 2;
  RCC_OscInitStruct.PLL2.PLLR = 1;
  RCC_OscInitStruct.PLL2.PLLFRACV = 5120;
  RCC_OscInitStruct.PLL2.PLLMODE = RCC_PLL_FRACTIONAL;
  RCC_OscInitStruct.PLL3.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL3.PLLSource = RCC_PLL3SOURCE_HSE;
  RCC_OscInitStruct.PLL3.PLLM = 2;
  RCC_OscInitStruct.PLL3.PLLN = 52;
  RCC_OscInitStruct.PLL3.PLLP = 3;
  RCC_OscInitStruct.PLL3.PLLQ = 2;
  RCC_OscInitStruct.PLL3.PLLR = 2;
  RCC_OscInitStruct.PLL3.PLLRGE = RCC_PLL3IFRANGE_1;
  RCC_OscInitStruct.PLL3.PLLFRACV = 2048;
  RCC_OscInitStruct.PLL3.PLLMODE = RCC_PLL_FRACTIONAL;
  RCC_OscInitStruct.PLL4.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL4.PLLSource = RCC_PLL4SOURCE_HSE;
  RCC_OscInitStruct.PLL4.PLLM = 4;
  RCC_OscInitStruct.PLL4.PLLN = 99;
  RCC_OscInitStruct.PLL4.PLLP = 6;
  RCC_OscInitStruct.PLL4.PLLQ = 8;
  RCC_OscInitStruct.PLL4.PLLR = 2;
  RCC_OscInitStruct.PLL4.PLLRGE = RCC_PLL4IFRANGE_0;
  RCC_OscInitStruct.PLL4.PLLFRACV = 0;
  RCC_OscInitStruct.PLL4.PLLMODE = RCC_PLL_INTEGER;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** RCC Clock Config
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_ACLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2
                              |RCC_CLOCKTYPE_PCLK3|RCC_CLOCKTYPE_PCLK4
                              |RCC_CLOCKTYPE_PCLK5;
  RCC_ClkInitStruct.AXISSInit.AXI_Clock = RCC_AXISSOURCE_PLL2;
  RCC_ClkInitStruct.AXISSInit.AXI_Div = RCC_AXI_DIV1;
  RCC_ClkInitStruct.MCUInit.MCU_Clock = RCC_MCUSSOURCE_PLL3;
  RCC_ClkInitStruct.MCUInit.MCU_Div = RCC_MCU_DIV1;
  RCC_ClkInitStruct.APB4_Div = RCC_APB4_DIV2;
  RCC_ClkInitStruct.APB5_Div = RCC_APB5_DIV4;
  RCC_ClkInitStruct.APB1_Div = RCC_APB1_DIV2;
  RCC_ClkInitStruct.APB2_Div = RCC_APB2_DIV2;
  RCC_ClkInitStruct.APB3_Div = RCC_APB3_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Set the HSE division factor for RTC clock
  */
  __HAL_RCC_RTC_HSEDIV(1);
}

/**
  * @brief IPCC Initialization Function
  * @param None
  * @retval None
  */
static void MX_IPCC_Init(void)
{

  /* USER CODE BEGIN IPCC_Init 0 */

  /* USER CODE END IPCC_Init 0 */

  /* USER CODE BEGIN IPCC_Init 1 */

  /* USER CODE END IPCC_Init 1 */
  hipcc.Instance = IPCC;
  if (HAL_IPCC_Init(&hipcc) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN IPCC_Init 2 */

  /* USER CODE END IPCC_Init 2 */

}

/**
  * Enable DMA controller clock
  * Configure DMA for memory to memory transfers
  *   hdma_memtomem_dma2_stream1
  */
static void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMAMUX_CLK_ENABLE();
  __HAL_RCC_DMA2_CLK_ENABLE();

  /* Configure DMA request hdma_memtomem_dma2_stream1 on DMA2_Stream1 */
  hdma_memtomem_dma2_stream1.Instance = DMA2_Stream1;
  hdma_memtomem_dma2_stream1.Init.Request = DMA_REQUEST_MEM2MEM;
  hdma_memtomem_dma2_stream1.Init.Direction = DMA_MEMORY_TO_MEMORY;
  hdma_memtomem_dma2_stream1.Init.PeriphInc = DMA_PINC_ENABLE;
  hdma_memtomem_dma2_stream1.Init.MemInc = DMA_MINC_ENABLE;
  hdma_memtomem_dma2_stream1.Init.PeriphDataAlignment = DMA_PDATAALIGN_WORD;
  hdma_memtomem_dma2_stream1.Init.MemDataAlignment = DMA_MDATAALIGN_WORD;
  hdma_memtomem_dma2_stream1.Init.Mode = DMA_NORMAL;
  hdma_memtomem_dma2_stream1.Init.Priority = DMA_PRIORITY_LOW;
  hdma_memtomem_dma2_stream1.Init.FIFOMode = DMA_FIFOMODE_ENABLE;
  hdma_memtomem_dma2_stream1.Init.FIFOThreshold = DMA_FIFO_THRESHOLD_FULL;
  hdma_memtomem_dma2_stream1.Init.MemBurst = DMA_MBURST_INC4;
  hdma_memtomem_dma2_stream1.Init.PeriphBurst = DMA_PBURST_INC4;
  if (HAL_DMA_Init(&hdma_memtomem_dma2_stream1) != HAL_OK)
  {
    Error_Handler( );
  }

  HAL_NVIC_SetPriority(DMA2_Stream1_IRQn, 1, 0);
  HAL_NVIC_EnableIRQ(DMA2_Stream1_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();

}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
