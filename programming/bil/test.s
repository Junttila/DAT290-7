   1              		.syntax unified
   2              		.cpu cortex-m4
   3              		.eabi_attribute 27, 1
   4              		.eabi_attribute 28, 1
   5              		.fpu fpv4-sp-d16
   6              		.eabi_attribute 20, 1
   7              		.eabi_attribute 21, 1
   8              		.eabi_attribute 23, 3
   9              		.eabi_attribute 24, 1
  10              		.eabi_attribute 25, 1
  11              		.eabi_attribute 26, 1
  12              		.eabi_attribute 30, 6
  13              		.eabi_attribute 34, 1
  14              		.eabi_attribute 18, 4
  15              		.thumb
  16              		.file	"system_stm32f4xx.c"
  17              		.text
  18              	.Ltext0:
  19              		.cfi_sections	.debug_frame
  20              		.global	SystemCoreClock
  21              		.data
  22              		.align	2
  25              	SystemCoreClock:
  26 0000 007A030A 		.word	168000000
  27              		.global	AHBPrescTable
  28              		.align	2
  31              	AHBPrescTable:
  32 0004 00       		.byte	0
  33 0005 00       		.byte	0
  34 0006 00       		.byte	0
  35 0007 00       		.byte	0
  36 0008 00       		.byte	0
  37 0009 00       		.byte	0
  38 000a 00       		.byte	0
  39 000b 00       		.byte	0
  40 000c 01       		.byte	1
  41 000d 02       		.byte	2
  42 000e 03       		.byte	3
  43 000f 04       		.byte	4
  44 0010 06       		.byte	6
  45 0011 07       		.byte	7
  46 0012 08       		.byte	8
  47 0013 09       		.byte	9
  48              		.text
  49              		.align	2
  50              		.global	SystemInit
  51              		.thumb
  52              		.thumb_func
  54              	SystemInit:
  55              	.LFB123:
  56              		.file 1 "C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil/system_stm32f4xx.c"
   1:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /**
   2:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   ******************************************************************************
   3:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @file    system_stm32f4xx.c
   4:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @author  MCD Application Team
   5:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @version V1.7.0
   6:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @date    22-April-2016
   7:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @brief   CMSIS Cortex-M4 Device Peripheral Access Layer System Source File.
   8:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *          This file contains the system clock configuration for STM32F4xx devices.
   9:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *             
  10:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * 1.  This file provides two functions and one global variable to be called from 
  11:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *     user application:
  12:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *      - SystemInit(): Setups the system clock (System clock source, PLL Multiplier
  13:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                      and Divider factors, AHB/APBx prescalers and Flash settings),
  14:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                      depending on the configuration made in the clock xls tool. 
  15:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                      This function is called at startup just after reset and 
  16:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                      before branch to main program. This call is made inside
  17:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                      the "startup_stm32f4xx.s" file.
  18:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *
  19:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *      - SystemCoreClock variable: Contains the core clock (HCLK), it can be used
  20:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                                  by the user application to setup the SysTick 
  21:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                                  timer or configure other parameters.
  22:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                                     
  23:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *      - SystemCoreClockUpdate(): Updates the variable SystemCoreClock and must
  24:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                                 be called whenever the core clock is changed
  25:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                                 during program execution.
  26:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *
  27:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * 2. After each device reset the HSI (16 MHz) is used as system clock source.
  28:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *    Then SystemInit() function is called, in "startup_stm32f4xx.s" file, to
  29:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *    configure the system clock before to branch to main program.
  30:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *
  31:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * 3. If the system clock source selected by user fails to startup, the SystemInit()
  32:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *    function will do nothing and HSI still used as system clock source. User can 
  33:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *    add some code to deal with this issue inside the SetSysClock() function.
  34:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *
  35:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * 4. The default value of HSE crystal is set to 25MHz, refer to "HSE_VALUE" define
  36:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *    in "stm32f4xx.h" file. When HSE is used as system clock source, directly or
  37:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *    through PLL, and you are using different crystal you have to adapt the HSE
  38:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *    value to your own configuration.
  39:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *
  40:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * 5. This file configures the system clock as follows:
  41:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *=============================================================================
  42:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *=============================================================================
  43:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                    Supported STM32F40xxx/41xxx devices
  44:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  45:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        System Clock source                    | PLL (HSE)
  46:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  47:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        SYSCLK(Hz)                             | 168000000
  48:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  49:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        HCLK(Hz)                               | 168000000
  50:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  51:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        AHB Prescaler                          | 1
  52:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  53:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        APB1 Prescaler                         | 4
  54:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  55:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        APB2 Prescaler                         | 2
  56:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  57:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        HSE Frequency(Hz)                      | 25000000
  58:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  59:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_M                                  | 25
  60:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  61:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_N                                  | 336
  62:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  63:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_P                                  | 2
  64:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  65:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_Q                                  | 7
  66:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  67:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLLI2S_N                               | NA
  68:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  69:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLLI2S_R                               | NA
  70:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  71:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        I2S input clock                        | NA
  72:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  73:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        VDD(V)                                 | 3.3
  74:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  75:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Main regulator output voltage          | Scale1 mode
  76:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  77:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Flash Latency(WS)                      | 5
  78:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  79:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Prefetch Buffer                        | ON
  80:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  81:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Instruction cache                      | ON
  82:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  83:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Data cache                             | ON
  84:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  85:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Require 48MHz for USB OTG FS,          | Disabled
  86:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        SDIO and RNG clock                     |
  87:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  88:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *=============================================================================
  89:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *=============================================================================
  90:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                    Supported STM32F42xxx/43xxx devices
  91:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  92:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        System Clock source                    | PLL (HSE)
  93:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  94:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        SYSCLK(Hz)                             | 180000000
  95:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  96:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        HCLK(Hz)                               | 180000000
  97:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
  98:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        AHB Prescaler                          | 1
  99:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 100:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        APB1 Prescaler                         | 4
 101:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 102:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        APB2 Prescaler                         | 2
 103:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 104:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        HSE Frequency(Hz)                      | 25000000
 105:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 106:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_M                                  | 25
 107:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 108:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_N                                  | 360
 109:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 110:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_P                                  | 2
 111:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 112:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_Q                                  | 7
 113:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 114:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLLI2S_N                               | NA
 115:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 116:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLLI2S_R                               | NA
 117:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 118:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        I2S input clock                        | NA
 119:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 120:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        VDD(V)                                 | 3.3
 121:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 122:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Main regulator output voltage          | Scale1 mode
 123:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 124:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Flash Latency(WS)                      | 5
 125:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 126:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Prefetch Buffer                        | ON
 127:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 128:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Instruction cache                      | ON
 129:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 130:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Data cache                             | ON
 131:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 132:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Require 48MHz for USB OTG FS,          | Disabled
 133:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        SDIO and RNG clock                     |
 134:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 135:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *=============================================================================
 136:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *=============================================================================
 137:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                         Supported STM32F401xx devices
 138:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 139:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        System Clock source                    | PLL (HSE)
 140:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 141:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        SYSCLK(Hz)                             | 84000000
 142:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 143:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        HCLK(Hz)                               | 84000000
 144:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 145:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        AHB Prescaler                          | 1
 146:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 147:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        APB1 Prescaler                         | 2
 148:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 149:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        APB2 Prescaler                         | 1
 150:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 151:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        HSE Frequency(Hz)                      | 25000000
 152:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 153:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_M                                  | 25
 154:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 155:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_N                                  | 336
 156:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 157:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_P                                  | 4
 158:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 159:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_Q                                  | 7
 160:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 161:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLLI2S_N                               | NA
 162:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 163:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLLI2S_R                               | NA
 164:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 165:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        I2S input clock                        | NA
 166:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 167:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        VDD(V)                                 | 3.3
 168:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 169:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Main regulator output voltage          | Scale1 mode
 170:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 171:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Flash Latency(WS)                      | 2
 172:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 173:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Prefetch Buffer                        | ON
 174:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 175:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Instruction cache                      | ON
 176:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 177:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Data cache                             | ON
 178:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 179:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Require 48MHz for USB OTG FS,          | Disabled
 180:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        SDIO and RNG clock                     |
 181:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 182:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *=============================================================================
 183:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *=============================================================================
 184:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                Supported STM32F411xx/STM32F410xx devices
 185:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 186:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        System Clock source                    | PLL (HSI)
 187:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 188:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        SYSCLK(Hz)                             | 100000000
 189:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 190:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        HCLK(Hz)                               | 100000000
 191:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 192:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        AHB Prescaler                          | 1
 193:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 194:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        APB1 Prescaler                         | 2
 195:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 196:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        APB2 Prescaler                         | 1
 197:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 198:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        HSI Frequency(Hz)                      | 16000000
 199:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 200:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_M                                  | 16
 201:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 202:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_N                                  | 400
 203:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 204:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_P                                  | 4
 205:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 206:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_Q                                  | 7
 207:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 208:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLLI2S_N                               | NA
 209:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 210:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLLI2S_R                               | NA
 211:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 212:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        I2S input clock                        | NA
 213:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 214:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        VDD(V)                                 | 3.3
 215:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 216:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Main regulator output voltage          | Scale1 mode
 217:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 218:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Flash Latency(WS)                      | 3
 219:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 220:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Prefetch Buffer                        | ON
 221:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 222:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Instruction cache                      | ON
 223:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 224:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Data cache                             | ON
 225:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 226:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Require 48MHz for USB OTG FS,          | Disabled
 227:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        SDIO and RNG clock                     |
 228:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 229:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *=============================================================================
 230:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *=============================================================================
 231:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                         Supported STM32F446xx devices
 232:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 233:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        System Clock source                    | PLL (HSE)
 234:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 235:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        SYSCLK(Hz)                             | 180000000
 236:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 237:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        HCLK(Hz)                               | 180000000
 238:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 239:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        AHB Prescaler                          | 1
 240:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 241:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        APB1 Prescaler                         | 4
 242:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 243:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        APB2 Prescaler                         | 2
 244:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 245:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        HSE Frequency(Hz)                      | 8000000
 246:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 247:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_M                                  | 8
 248:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 249:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_N                                  | 360
 250:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 251:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_P                                  | 2
 252:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 253:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_Q                                  | 7
 254:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 255:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLL_R                                  | NA
 256:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 257:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLLI2S_M                               | NA
 258:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 259:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLLI2S_N                               | NA
 260:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 261:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLLI2S_P                               | NA
 262:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 263:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLLI2S_Q                               | NA
 264:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 265:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        PLLI2S_R                               | NA
 266:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 267:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        I2S input clock                        | NA
 268:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 269:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        VDD(V)                                 | 3.3
 270:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 271:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Main regulator output voltage          | Scale1 mode
 272:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 273:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Flash Latency(WS)                      | 5
 274:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 275:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Prefetch Buffer                        | ON
 276:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 277:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Instruction cache                      | ON
 278:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 279:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Data cache                             | ON
 280:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 281:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        Require 48MHz for USB OTG FS,          | Disabled
 282:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        SDIO and RNG clock                     |
 283:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *-----------------------------------------------------------------------------
 284:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *=============================================================================
 285:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   ******************************************************************************
 286:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @attention
 287:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *
 288:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * <h2><center>&copy; COPYRIGHT 2015 STMicroelectronics</center></h2>
 289:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *
 290:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
 291:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * You may not use this file except in compliance with the License.
 292:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * You may obtain a copy of the License at:
 293:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *
 294:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *        http://www.st.com/software_license_agreement_liberty_v2
 295:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *
 296:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * Unless required by applicable law or agreed to in writing, software 
 297:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * distributed under the License is distributed on an "AS IS" BASIS, 
 298:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 299:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * See the License for the specific language governing permissions and
 300:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * limitations under the License.
 301:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *
 302:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   ******************************************************************************
 303:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 304:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 305:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /** @addtogroup CMSIS
 306:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @{
 307:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 308:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 309:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /** @addtogroup stm32f4xx_system
 310:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @{
 311:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */  
 312:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   
 313:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /** @addtogroup STM32F4xx_System_Private_Includes
 314:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @{
 315:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 316:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 317:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #include "stm32f4xx.h"
 318:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 319:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /**
 320:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @}
 321:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 322:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 323:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /** @addtogroup STM32F4xx_System_Private_TypesDefinitions
 324:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @{
 325:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 326:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 327:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /**
 328:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @}
 329:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 330:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 331:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /** @addtogroup STM32F4xx_System_Private_Defines
 332:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @{
 333:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 334:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 335:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /************************* Miscellaneous Configuration ************************/
 336:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /*!< Uncomment the following line if you need to use external SRAM or SDRAM mounted
 337:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****      on STM324xG_EVAL/STM324x7I_EVAL/STM324x9I_EVAL boards as data memory  */     
 338:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F40_41xxx) || defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM3
 339:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /* #define DATA_IN_ExtSRAM */
 340:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F40_41xxx || STM32F427_437x || STM32F429_439xx || STM32F469_479xx */
 341:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 342:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM32F446xx) || defined(STM32F4
 343:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /* #define DATA_IN_ExtSDRAM */
 344:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F427_437x || STM32F429_439xx || STM32F446xx || STM32F469_479xx */ 
 345:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 346:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F410xx) || defined(STM32F411xE)
 347:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /*!< Uncomment the following line if you need to clock the STM32F410xx/STM32F411xE by HSE Bypass
 348:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****      through STLINK MCO pin of STM32F103 microcontroller. The frequency cannot be changed
 349:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****      and is fixed at 8 MHz. 
 350:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****      Hardware configuration needed for Nucleo Board:
 351:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****      – SB54, SB55 OFF
 352:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****      – R35 removed
 353:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****      – SB16, SB50 ON */
 354:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /* #define USE_HSE_BYPASS */
 355:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 356:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(USE_HSE_BYPASS)     
 357:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #define HSE_BYPASS_INPUT_FREQUENCY   8000000
 358:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* USE_HSE_BYPASS */    
 359:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F410xx || STM32F411xE */
 360:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     
 361:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /*!< Uncomment the following line if you need to relocate your vector Table in
 362:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****      Internal SRAM. */
 363:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /* #define VECT_TAB_SRAM */
 364:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #define VECT_TAB_OFFSET  0x00 /*!< Vector Table base offset field. 
 365:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****                                    This value must be a multiple of 0x200. */
 366:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /******************************************************************************/
 367:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 368:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /************************* PLL Parameters *************************************/
 369:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F40_41xxx) || defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM3
 370:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****  /* PLL_VCO = (HSE_VALUE or HSI_VALUE / PLL_M) * PLL_N */
 371:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****  #define PLL_M      25
 372:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #elif defined(STM32F412xG) || defined (STM32F446xx)
 373:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****  #define PLL_M      8
 374:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #elif defined (STM32F410xx) || defined (STM32F411xE)
 375:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****  #if defined(USE_HSE_BYPASS)
 376:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   #define PLL_M      8    
 377:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****  #else /* !USE_HSE_BYPASS */
 378:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   #define PLL_M      16
 379:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****  #endif /* USE_HSE_BYPASS */
 380:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #else
 381:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F40_41xxx || STM32F427_437xx || STM32F429_439xx || STM32F401xx || STM32F469_479xx */
 382:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 383:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /* USB OTG FS, SDIO and RNG Clock =  PLL_VCO / PLLQ */
 384:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #define PLL_Q      7
 385:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 386:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F446xx)
 387:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /* PLL division factor for I2S, SAI, SYSTEM and SPDIF: Clock =  PLL_VCO / PLLR */
 388:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #define PLL_R      7
 389:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #elif defined(STM32F412xG)
 390:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #define PLL_R      2
 391:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #else
 392:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F446xx */ 
 393:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 394:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM32F446xx) || defined(STM32F4
 395:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #define PLL_N      360
 396:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /* SYSCLK = PLL_VCO / PLL_P */
 397:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #define PLL_P      2
 398:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F427_437x || STM32F429_439xx || STM32F446xx || STM32F469_479xx */
 399:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 400:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined (STM32F40_41xxx)
 401:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #define PLL_N      336
 402:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /* SYSCLK = PLL_VCO / PLL_P */
 403:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #define PLL_P      2
 404:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F40_41xxx */
 405:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 406:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F401xx)
 407:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #define PLL_N      336
 408:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /* SYSCLK = PLL_VCO / PLL_P */
 409:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #define PLL_P      4
 410:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F401xx */
 411:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 412:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F410xx) || defined(STM32F411xE) || defined(STM32F412xG)
 413:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #define PLL_N      400
 414:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /* SYSCLK = PLL_VCO / PLL_P */
 415:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #define PLL_P      4   
 416:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F410xx || STM32F411xE */
 417:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 418:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /******************************************************************************/
 419:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 420:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /**
 421:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @}
 422:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 423:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 424:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /** @addtogroup STM32F4xx_System_Private_Macros
 425:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @{
 426:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 427:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 428:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /**
 429:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @}
 430:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 431:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 432:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /** @addtogroup STM32F4xx_System_Private_Variables
 433:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @{
 434:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 435:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 436:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F40_41xxx)
 437:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   uint32_t SystemCoreClock = 168000000;
 438:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F40_41xxx */
 439:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 440:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM32F446xx) || defined(STM32F4
 441:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   uint32_t SystemCoreClock = 180000000;
 442:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F427_437x || STM32F429_439xx || STM32F446xx || STM32F469_479xx */
 443:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 444:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F401xx)
 445:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   uint32_t SystemCoreClock = 84000000;
 446:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F401xx */
 447:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 448:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F410xx) || defined(STM32F411xE) || defined(STM32F412xG)
 449:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   uint32_t SystemCoreClock = 100000000;
 450:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F410xx || STM32F401xE || STM32F412xG */
 451:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 452:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** __I uint8_t AHBPrescTable[16] = {0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 6, 7, 8, 9};
 453:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 454:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /**
 455:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @}
 456:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 457:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 458:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /** @addtogroup STM32F4xx_System_Private_FunctionPrototypes
 459:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @{
 460:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 461:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 462:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** static void SetSysClock(void);
 463:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 464:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(DATA_IN_ExtSRAM) || defined(DATA_IN_ExtSDRAM)
 465:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** static void SystemInit_ExtMemCtl(void); 
 466:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* DATA_IN_ExtSRAM || DATA_IN_ExtSDRAM */
 467:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 468:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /**
 469:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @}
 470:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 471:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 472:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /** @addtogroup STM32F4xx_System_Private_Functions
 473:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @{
 474:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 475:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 476:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /**
 477:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @brief  Setup the microcontroller system
 478:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *         Initialize the Embedded Flash Interface, the PLL and update the 
 479:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *         SystemFrequency variable.
 480:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @param  None
 481:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @retval None
 482:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 483:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** void SystemInit(void)
 484:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** {
  57              		.loc 1 484 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
 485:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* FPU settings ------------------------------------------------------------*/
 486:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   #if (__FPU_PRESENT == 1) && (__FPU_USED == 1)
 487:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     SCB->CPACR |= ((3UL << 10*2)|(3UL << 11*2));  /* set CP10 and CP11 Full Access */
  67              		.loc 1 487 0
  68 0004 154A     		ldr	r2, .L2
  69 0006 154B     		ldr	r3, .L2
  70 0008 D3F88830 		ldr	r3, [r3, #136]
  71 000c 43F47003 		orr	r3, r3, #15728640
  72 0010 C2F88830 		str	r3, [r2, #136]
 488:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   #endif
 489:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Reset the RCC clock configuration to the default reset state ------------*/
 490:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Set HSION bit */
 491:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->CR |= (uint32_t)0x00000001;
  73              		.loc 1 491 0
  74 0014 124A     		ldr	r2, .L2+4
  75 0016 124B     		ldr	r3, .L2+4
  76 0018 1B68     		ldr	r3, [r3]
  77 001a 43F00103 		orr	r3, r3, #1
  78 001e 1360     		str	r3, [r2]
 492:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 493:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Reset CFGR register */
 494:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->CFGR = 0x00000000;
  79              		.loc 1 494 0
  80 0020 0F4B     		ldr	r3, .L2+4
  81 0022 0022     		movs	r2, #0
  82 0024 9A60     		str	r2, [r3, #8]
 495:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 496:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Reset HSEON, CSSON and PLLON bits */
 497:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->CR &= (uint32_t)0xFEF6FFFF;
  83              		.loc 1 497 0
  84 0026 0E4A     		ldr	r2, .L2+4
  85 0028 0D4B     		ldr	r3, .L2+4
  86 002a 1B68     		ldr	r3, [r3]
  87 002c 23F08473 		bic	r3, r3, #17301504
  88 0030 23F48033 		bic	r3, r3, #65536
  89 0034 1360     		str	r3, [r2]
 498:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 499:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Reset PLLCFGR register */
 500:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->PLLCFGR = 0x24003010;
  90              		.loc 1 500 0
  91 0036 0A4B     		ldr	r3, .L2+4
  92 0038 0A4A     		ldr	r2, .L2+8
  93 003a 5A60     		str	r2, [r3, #4]
 501:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 502:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Reset HSEBYP bit */
 503:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->CR &= (uint32_t)0xFFFBFFFF;
  94              		.loc 1 503 0
  95 003c 084A     		ldr	r2, .L2+4
  96 003e 084B     		ldr	r3, .L2+4
  97 0040 1B68     		ldr	r3, [r3]
  98 0042 23F48023 		bic	r3, r3, #262144
  99 0046 1360     		str	r3, [r2]
 504:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 505:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Disable all interrupts */
 506:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->CIR = 0x00000000;
 100              		.loc 1 506 0
 101 0048 054B     		ldr	r3, .L2+4
 102 004a 0022     		movs	r2, #0
 103 004c DA60     		str	r2, [r3, #12]
 507:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 508:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(DATA_IN_ExtSRAM) || defined(DATA_IN_ExtSDRAM)
 509:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   SystemInit_ExtMemCtl(); 
 510:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* DATA_IN_ExtSRAM || DATA_IN_ExtSDRAM */
 511:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****          
 512:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Configure the System clock source, PLL Multiplier and Divider factors, 
 513:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****      AHB/APBx prescalers and Flash settings ----------------------------------*/
 514:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   SetSysClock();
 104              		.loc 1 514 0
 105 004e 00F087F8 		bl	SetSysClock
 515:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 516:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Configure the Vector Table location add offset address ------------------*/
 517:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #ifdef VECT_TAB_SRAM
 518:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   SCB->VTOR = SRAM_BASE | VECT_TAB_OFFSET; /* Vector Table Relocation in Internal SRAM */
 519:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #else
 520:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   SCB->VTOR = FLASH_BASE | VECT_TAB_OFFSET; /* Vector Table Relocation in Internal FLASH */
 106              		.loc 1 520 0
 107 0052 024B     		ldr	r3, .L2
 108 0054 4FF00062 		mov	r2, #134217728
 109 0058 9A60     		str	r2, [r3, #8]
 521:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif
 522:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** }
 110              		.loc 1 522 0
 111 005a 80BD     		pop	{r7, pc}
 112              	.L3:
 113              		.align	2
 114              	.L2:
 115 005c 00ED00E0 		.word	-536810240
 116 0060 00380240 		.word	1073887232
 117 0064 10300024 		.word	603992080
 118              		.cfi_endproc
 119              	.LFE123:
 121              		.align	2
 122              		.global	SystemCoreClockUpdate
 123              		.thumb
 124              		.thumb_func
 126              	SystemCoreClockUpdate:
 127              	.LFB124:
 523:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 524:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /**
 525:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****    * @brief  Update SystemCoreClock variable according to Clock Register Values.
 526:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *         The SystemCoreClock variable contains the core clock (HCLK), it can
 527:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *         be used by the user application to setup the SysTick timer or configure
 528:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *         other parameters.
 529:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *           
 530:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @note   Each time the core clock (HCLK) changes, this function must be called
 531:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *         to update SystemCoreClock variable value. Otherwise, any configuration
 532:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *         based on this variable will be incorrect.         
 533:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *     
 534:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @note   - The system frequency computed by this function is not the real 
 535:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *           frequency in the chip. It is calculated based on the predefined 
 536:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *           constant and the selected clock source:
 537:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *             
 538:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *           - If SYSCLK source is HSI, SystemCoreClock will contain the HSI_VALUE(*)
 539:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                                              
 540:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *           - If SYSCLK source is HSE, SystemCoreClock will contain the HSE_VALUE(**)
 541:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                          
 542:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *           - If SYSCLK source is PLL, SystemCoreClock will contain the HSE_VALUE(**) 
 543:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *             or HSI_VALUE(*) multiplied/divided by the PLL factors.
 544:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *         
 545:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *         (*) HSI_VALUE is a constant defined in stm32f4xx.h file (default value
 546:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *             16 MHz) but the real value may vary depending on the variations
 547:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *             in voltage and temperature.   
 548:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *    
 549:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *         (**) HSE_VALUE is a constant defined in stm32f4xx.h file (default value
 550:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *              25 MHz), user has to ensure that HSE_VALUE is same as the real
 551:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *              frequency of the crystal used. Otherwise, this function may
 552:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *              have wrong result.
 553:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *                
 554:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *         - The result of this function could be not correct when using fractional
 555:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *           value for HSE crystal.
 556:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *     
 557:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @param  None
 558:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @retval None
 559:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 560:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** void SystemCoreClockUpdate(void)
 561:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** {
 128              		.loc 1 561 0
 129              		.cfi_startproc
 130              		@ args = 0, pretend = 0, frame = 24
 131              		@ frame_needed = 1, uses_anonymous_args = 0
 132              		@ link register save eliminated.
 133 0068 80B4     		push	{r7}
 134              		.cfi_def_cfa_offset 4
 135              		.cfi_offset 7, -4
 136 006a 87B0     		sub	sp, sp, #28
 137              		.cfi_def_cfa_offset 32
 138 006c 00AF     		add	r7, sp, #0
 139              		.cfi_def_cfa_register 7
 562:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   uint32_t tmp = 0, pllvco = 0, pllp = 2, pllsource = 0, pllm = 2;
 140              		.loc 1 562 0
 141 006e 0023     		movs	r3, #0
 142 0070 3B61     		str	r3, [r7, #16]
 143 0072 0023     		movs	r3, #0
 144 0074 7B61     		str	r3, [r7, #20]
 145 0076 0223     		movs	r3, #2
 146 0078 FB60     		str	r3, [r7, #12]
 147 007a 0023     		movs	r3, #0
 148 007c BB60     		str	r3, [r7, #8]
 149 007e 0223     		movs	r3, #2
 150 0080 7B60     		str	r3, [r7, #4]
 563:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F412xG) || defined(STM32F446xx)  
 564:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   uint32_t pllr = 2;
 565:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F412xG || STM32F446xx */
 566:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Get SYSCLK source -------------------------------------------------------*/
 567:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   tmp = RCC->CFGR & RCC_CFGR_SWS;
 151              		.loc 1 567 0
 152 0082 324B     		ldr	r3, .L13
 153 0084 9B68     		ldr	r3, [r3, #8]
 154 0086 03F00C03 		and	r3, r3, #12
 155 008a 3B61     		str	r3, [r7, #16]
 568:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 569:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   switch (tmp)
 156              		.loc 1 569 0
 157 008c 3B69     		ldr	r3, [r7, #16]
 158 008e 042B     		cmp	r3, #4
 159 0090 07D0     		beq	.L6
 160 0092 082B     		cmp	r3, #8
 161 0094 09D0     		beq	.L7
 162 0096 002B     		cmp	r3, #0
 163 0098 3FD1     		bne	.L12
 570:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   {
 571:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     case 0x00:  /* HSI used as system clock source */
 572:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       SystemCoreClock = HSI_VALUE;
 164              		.loc 1 572 0
 165 009a 2D4B     		ldr	r3, .L13+4
 166 009c 2D4A     		ldr	r2, .L13+8
 167 009e 1A60     		str	r2, [r3]
 573:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       break;
 168              		.loc 1 573 0
 169 00a0 3FE0     		b	.L9
 170              	.L6:
 574:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     case 0x04:  /* HSE used as system clock source */
 575:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       SystemCoreClock = HSE_VALUE;
 171              		.loc 1 575 0
 172 00a2 2B4B     		ldr	r3, .L13+4
 173 00a4 2C4A     		ldr	r2, .L13+12
 174 00a6 1A60     		str	r2, [r3]
 576:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       break;
 175              		.loc 1 576 0
 176 00a8 3BE0     		b	.L9
 177              	.L7:
 577:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     case 0x08:  /* PLL P used as system clock source */
 578:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****        /* PLL_VCO = (HSE_VALUE or HSI_VALUE / PLL_M) * PLL_N
 579:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****          SYSCLK = PLL_VCO / PLL_P
 580:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****          */    
 581:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       pllsource = (RCC->PLLCFGR & RCC_PLLCFGR_PLLSRC) >> 22;
 178              		.loc 1 581 0
 179 00aa 284B     		ldr	r3, .L13
 180 00ac 5B68     		ldr	r3, [r3, #4]
 181 00ae 03F48003 		and	r3, r3, #4194304
 182 00b2 9B0D     		lsrs	r3, r3, #22
 183 00b4 BB60     		str	r3, [r7, #8]
 582:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       pllm = RCC->PLLCFGR & RCC_PLLCFGR_PLLM;
 184              		.loc 1 582 0
 185 00b6 254B     		ldr	r3, .L13
 186 00b8 5B68     		ldr	r3, [r3, #4]
 187 00ba 03F03F03 		and	r3, r3, #63
 188 00be 7B60     		str	r3, [r7, #4]
 583:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       
 584:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F40_41xxx) || defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM3
 585:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       if (pllsource != 0)
 189              		.loc 1 585 0
 190 00c0 BB68     		ldr	r3, [r7, #8]
 191 00c2 002B     		cmp	r3, #0
 192 00c4 0DD0     		beq	.L10
 586:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       {
 587:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****         /* HSE used as PLL clock source */
 588:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****         pllvco = (HSE_VALUE / pllm) * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 6);
 193              		.loc 1 588 0
 194 00c6 244A     		ldr	r2, .L13+12
 195 00c8 7B68     		ldr	r3, [r7, #4]
 196 00ca B2FBF3F2 		udiv	r2, r2, r3
 197 00ce 1F4B     		ldr	r3, .L13
 198 00d0 5968     		ldr	r1, [r3, #4]
 199 00d2 47F6C073 		movw	r3, #32704
 200 00d6 0B40     		ands	r3, r3, r1
 201 00d8 9B09     		lsrs	r3, r3, #6
 202 00da 03FB02F3 		mul	r3, r3, r2
 203 00de 7B61     		str	r3, [r7, #20]
 204 00e0 0CE0     		b	.L11
 205              	.L10:
 589:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       }
 590:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       else
 591:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       {
 592:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****         /* HSI used as PLL clock source */
 593:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****         pllvco = (HSI_VALUE / pllm) * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 6);
 206              		.loc 1 593 0
 207 00e2 1C4A     		ldr	r2, .L13+8
 208 00e4 7B68     		ldr	r3, [r7, #4]
 209 00e6 B2FBF3F2 		udiv	r2, r2, r3
 210 00ea 184B     		ldr	r3, .L13
 211 00ec 5968     		ldr	r1, [r3, #4]
 212 00ee 47F6C073 		movw	r3, #32704
 213 00f2 0B40     		ands	r3, r3, r1
 214 00f4 9B09     		lsrs	r3, r3, #6
 215 00f6 03FB02F3 		mul	r3, r3, r2
 216 00fa 7B61     		str	r3, [r7, #20]
 217              	.L11:
 594:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       }
 595:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #elif defined(STM32F410xx) || defined(STM32F411xE)
 596:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(USE_HSE_BYPASS)
 597:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       if (pllsource != 0)
 598:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       {
 599:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****         /* HSE used as PLL clock source */
 600:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****         pllvco = (HSE_BYPASS_INPUT_FREQUENCY / pllm) * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 6);
 601:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       }  
 602:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #else  
 603:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       if (pllsource == 0)
 604:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       {
 605:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****         /* HSI used as PLL clock source */
 606:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****         pllvco = (HSI_VALUE / pllm) * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 6);
 607:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       }  
 608:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* USE_HSE_BYPASS */  
 609:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F40_41xxx || STM32F427_437xx || STM32F429_439xx || STM32F401xx || STM32F412xG ||  ST
 610:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       pllp = (((RCC->PLLCFGR & RCC_PLLCFGR_PLLP) >>16) + 1 ) *2;
 218              		.loc 1 610 0
 219 00fc 134B     		ldr	r3, .L13
 220 00fe 5B68     		ldr	r3, [r3, #4]
 221 0100 03F44033 		and	r3, r3, #196608
 222 0104 1B0C     		lsrs	r3, r3, #16
 223 0106 0133     		adds	r3, r3, #1
 224 0108 5B00     		lsls	r3, r3, #1
 225 010a FB60     		str	r3, [r7, #12]
 611:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       SystemCoreClock = pllvco/pllp;      
 226              		.loc 1 611 0
 227 010c 7A69     		ldr	r2, [r7, #20]
 228 010e FB68     		ldr	r3, [r7, #12]
 229 0110 B2FBF3F3 		udiv	r3, r2, r3
 230 0114 0E4A     		ldr	r2, .L13+4
 231 0116 1360     		str	r3, [r2]
 612:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       break;
 232              		.loc 1 612 0
 233 0118 03E0     		b	.L9
 234              	.L12:
 613:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F412xG) || defined(STM32F446xx)      
 614:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       case 0x0C:  /* PLL R used as system clock source */
 615:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****        /* PLL_VCO = (HSE_VALUE or HSI_VALUE / PLL_M) * PLL_N
 616:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****          SYSCLK = PLL_VCO / PLL_R
 617:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****          */    
 618:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       pllsource = (RCC->PLLCFGR & RCC_PLLCFGR_PLLSRC) >> 22;
 619:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       pllm = RCC->PLLCFGR & RCC_PLLCFGR_PLLM;
 620:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       if (pllsource != 0)
 621:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       {
 622:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****         /* HSE used as PLL clock source */
 623:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****         pllvco = (HSE_VALUE / pllm) * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 6);
 624:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       }
 625:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       else
 626:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       {
 627:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****         /* HSI used as PLL clock source */
 628:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****         pllvco = (HSI_VALUE / pllm) * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 6);      
 629:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       }
 630:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****  
 631:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       pllr = (((RCC->PLLCFGR & RCC_PLLCFGR_PLLR) >>28) + 1 ) *2;
 632:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       SystemCoreClock = pllvco/pllr;      
 633:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       break;
 634:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F412xG || STM32F446xx */
 635:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     default:
 636:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       SystemCoreClock = HSI_VALUE;
 235              		.loc 1 636 0
 236 011a 0D4B     		ldr	r3, .L13+4
 237 011c 0D4A     		ldr	r2, .L13+8
 238 011e 1A60     		str	r2, [r3]
 637:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****       break;
 239              		.loc 1 637 0
 240 0120 00BF     		nop
 241              	.L9:
 638:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   }
 639:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Compute HCLK frequency --------------------------------------------------*/
 640:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Get HCLK prescaler */
 641:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   tmp = AHBPrescTable[((RCC->CFGR & RCC_CFGR_HPRE) >> 4)];
 242              		.loc 1 641 0
 243 0122 0A4B     		ldr	r3, .L13
 244 0124 9B68     		ldr	r3, [r3, #8]
 245 0126 03F0F003 		and	r3, r3, #240
 246 012a 1B09     		lsrs	r3, r3, #4
 247 012c 0B4A     		ldr	r2, .L13+16
 248 012e D35C     		ldrb	r3, [r2, r3]
 249 0130 DBB2     		uxtb	r3, r3
 250 0132 3B61     		str	r3, [r7, #16]
 642:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* HCLK frequency */
 643:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   SystemCoreClock >>= tmp;
 251              		.loc 1 643 0
 252 0134 064B     		ldr	r3, .L13+4
 253 0136 1A68     		ldr	r2, [r3]
 254 0138 3B69     		ldr	r3, [r7, #16]
 255 013a 22FA03F3 		lsr	r3, r2, r3
 256 013e 044A     		ldr	r2, .L13+4
 257 0140 1360     		str	r3, [r2]
 644:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** }
 258              		.loc 1 644 0
 259 0142 1C37     		adds	r7, r7, #28
 260              		.cfi_def_cfa_offset 4
 261 0144 BD46     		mov	sp, r7
 262              		.cfi_def_cfa_register 13
 263              		@ sp needed
 264 0146 5DF8047B 		ldr	r7, [sp], #4
 265              		.cfi_restore 7
 266              		.cfi_def_cfa_offset 0
 267 014a 7047     		bx	lr
 268              	.L14:
 269              		.align	2
 270              	.L13:
 271 014c 00380240 		.word	1073887232
 272 0150 00000000 		.word	SystemCoreClock
 273 0154 0024F400 		.word	16000000
 274 0158 40787D01 		.word	25000000
 275 015c 00000000 		.word	AHBPrescTable
 276              		.cfi_endproc
 277              	.LFE124:
 279              		.align	2
 280              		.thumb
 281              		.thumb_func
 283              	SetSysClock:
 284              	.LFB125:
 645:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 646:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /**
 647:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @brief  Configures the System clock source, PLL Multiplier and Divider factors, 
 648:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *         AHB/APBx prescalers and Flash settings
 649:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @Note   This function should be called only once the RCC clock configuration  
 650:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   *         is reset to the default reset state (done in SystemInit() function).   
 651:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @param  None
 652:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   * @retval None
 653:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   */
 654:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** static void SetSysClock(void)
 655:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** {
 285              		.loc 1 655 0
 286              		.cfi_startproc
 287              		@ args = 0, pretend = 0, frame = 8
 288              		@ frame_needed = 1, uses_anonymous_args = 0
 289              		@ link register save eliminated.
 290 0160 80B4     		push	{r7}
 291              		.cfi_def_cfa_offset 4
 292              		.cfi_offset 7, -4
 293 0162 83B0     		sub	sp, sp, #12
 294              		.cfi_def_cfa_offset 16
 295 0164 00AF     		add	r7, sp, #0
 296              		.cfi_def_cfa_register 7
 656:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F40_41xxx) || defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM3
 657:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /******************************************************************************/
 658:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /*            PLL (clocked by HSE) used as System clock source                */
 659:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /******************************************************************************/
 660:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   __IO uint32_t StartUpCounter = 0, HSEStatus = 0;
 297              		.loc 1 660 0
 298 0166 0023     		movs	r3, #0
 299 0168 7B60     		str	r3, [r7, #4]
 300 016a 0023     		movs	r3, #0
 301 016c 3B60     		str	r3, [r7]
 661:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   
 662:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Enable HSE */
 663:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->CR |= ((uint32_t)RCC_CR_HSEON);
 302              		.loc 1 663 0
 303 016e 354A     		ldr	r2, .L23
 304 0170 344B     		ldr	r3, .L23
 305 0172 1B68     		ldr	r3, [r3]
 306 0174 43F48033 		orr	r3, r3, #65536
 307 0178 1360     		str	r3, [r2]
 308              	.L17:
 664:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****  
 665:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Wait till HSE is ready and if Time out is reached exit */
 666:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   do
 667:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   {
 668:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     HSEStatus = RCC->CR & RCC_CR_HSERDY;
 309              		.loc 1 668 0 discriminator 2
 310 017a 324B     		ldr	r3, .L23
 311 017c 1B68     		ldr	r3, [r3]
 312 017e 03F40033 		and	r3, r3, #131072
 313 0182 3B60     		str	r3, [r7]
 669:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     StartUpCounter++;
 314              		.loc 1 669 0 discriminator 2
 315 0184 7B68     		ldr	r3, [r7, #4]
 316 0186 0133     		adds	r3, r3, #1
 317 0188 7B60     		str	r3, [r7, #4]
 670:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   } while((HSEStatus == 0) && (StartUpCounter != HSE_STARTUP_TIMEOUT));
 318              		.loc 1 670 0 discriminator 2
 319 018a 3B68     		ldr	r3, [r7]
 320 018c 002B     		cmp	r3, #0
 321 018e 03D1     		bne	.L16
 322              		.loc 1 670 0 is_stmt 0 discriminator 1
 323 0190 7B68     		ldr	r3, [r7, #4]
 324 0192 B3F5A04F 		cmp	r3, #20480
 325 0196 F0D1     		bne	.L17
 326              	.L16:
 671:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 672:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   if ((RCC->CR & RCC_CR_HSERDY) != RESET)
 327              		.loc 1 672 0 is_stmt 1
 328 0198 2A4B     		ldr	r3, .L23
 329 019a 1B68     		ldr	r3, [r3]
 330 019c 03F40033 		and	r3, r3, #131072
 331 01a0 002B     		cmp	r3, #0
 332 01a2 02D0     		beq	.L18
 673:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   {
 674:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     HSEStatus = (uint32_t)0x01;
 333              		.loc 1 674 0
 334 01a4 0123     		movs	r3, #1
 335 01a6 3B60     		str	r3, [r7]
 336 01a8 01E0     		b	.L19
 337              	.L18:
 675:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   }
 676:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   else
 677:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   {
 678:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     HSEStatus = (uint32_t)0x00;
 338              		.loc 1 678 0
 339 01aa 0023     		movs	r3, #0
 340 01ac 3B60     		str	r3, [r7]
 341              	.L19:
 679:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   }
 680:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 681:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   if (HSEStatus == (uint32_t)0x01)
 342              		.loc 1 681 0
 343 01ae 3B68     		ldr	r3, [r7]
 344 01b0 012B     		cmp	r3, #1
 345 01b2 42D1     		bne	.L15
 682:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   {
 683:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Select regulator voltage output Scale 1 mode */
 684:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->APB1ENR |= RCC_APB1ENR_PWREN;
 346              		.loc 1 684 0
 347 01b4 234A     		ldr	r2, .L23
 348 01b6 234B     		ldr	r3, .L23
 349 01b8 1B6C     		ldr	r3, [r3, #64]
 350 01ba 43F08053 		orr	r3, r3, #268435456
 351 01be 1364     		str	r3, [r2, #64]
 685:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     PWR->CR |= PWR_CR_VOS;
 352              		.loc 1 685 0
 353 01c0 214A     		ldr	r2, .L23+4
 354 01c2 214B     		ldr	r3, .L23+4
 355 01c4 1B68     		ldr	r3, [r3]
 356 01c6 43F44043 		orr	r3, r3, #49152
 357 01ca 1360     		str	r3, [r2]
 686:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 687:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* HCLK = SYSCLK / 1*/
 688:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->CFGR |= RCC_CFGR_HPRE_DIV1;
 358              		.loc 1 688 0
 359 01cc 1D4A     		ldr	r2, .L23
 360 01ce 1D4B     		ldr	r3, .L23
 361 01d0 9B68     		ldr	r3, [r3, #8]
 362 01d2 9360     		str	r3, [r2, #8]
 689:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 690:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F40_41xxx) || defined(STM32F427_437xx) || defined(STM32F429_439xx) ||  defined(STM
 691:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* PCLK2 = HCLK / 2*/
 692:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->CFGR |= RCC_CFGR_PPRE2_DIV2;
 363              		.loc 1 692 0
 364 01d4 1B4A     		ldr	r2, .L23
 365 01d6 1B4B     		ldr	r3, .L23
 366 01d8 9B68     		ldr	r3, [r3, #8]
 367 01da 43F40043 		orr	r3, r3, #32768
 368 01de 9360     		str	r3, [r2, #8]
 693:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     
 694:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* PCLK1 = HCLK / 4*/
 695:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->CFGR |= RCC_CFGR_PPRE1_DIV4;
 369              		.loc 1 695 0
 370 01e0 184A     		ldr	r2, .L23
 371 01e2 184B     		ldr	r3, .L23
 372 01e4 9B68     		ldr	r3, [r3, #8]
 373 01e6 43F4A053 		orr	r3, r3, #5120
 374 01ea 9360     		str	r3, [r2, #8]
 696:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F40_41xxx || STM32F427_437x || STM32F429_439xx  || STM32F412xG || STM32F446xx || STM
 697:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 698:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F401xx)
 699:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* PCLK2 = HCLK / 2*/
 700:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->CFGR |= RCC_CFGR_PPRE2_DIV1;
 701:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     
 702:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* PCLK1 = HCLK / 4*/
 703:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->CFGR |= RCC_CFGR_PPRE1_DIV2;
 704:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F401xx */
 705:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 706:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F40_41xxx) || defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM3
 707:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Configure the main PLL */
 708:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->PLLCFGR = PLL_M | (PLL_N << 6) | (((PLL_P >> 1) -1) << 16) |
 375              		.loc 1 708 0
 376 01ec 154B     		ldr	r3, .L23
 377 01ee 174A     		ldr	r2, .L23+8
 378 01f0 5A60     		str	r2, [r3, #4]
 709:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****                    (RCC_PLLCFGR_PLLSRC_HSE) | (PLL_Q << 24);
 710:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F40_41xxx || STM32F401xx || STM32F427_437x || STM32F429_439xx || STM32F469_479xx */
 711:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 712:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if  defined(STM32F412xG) || defined(STM32F446xx)
 713:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Configure the main PLL */
 714:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->PLLCFGR = PLL_M | (PLL_N << 6) | (((PLL_P >> 1) -1) << 16) |
 715:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****                    (RCC_PLLCFGR_PLLSRC_HSE) | (PLL_Q << 24) | (PLL_R << 28);
 716:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F412xG || STM32F446xx */    
 717:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     
 718:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Enable the main PLL */
 719:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->CR |= RCC_CR_PLLON;
 379              		.loc 1 719 0
 380 01f2 144A     		ldr	r2, .L23
 381 01f4 134B     		ldr	r3, .L23
 382 01f6 1B68     		ldr	r3, [r3]
 383 01f8 43F08073 		orr	r3, r3, #16777216
 384 01fc 1360     		str	r3, [r2]
 720:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 721:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Wait till the main PLL is ready */
 722:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     while((RCC->CR & RCC_CR_PLLRDY) == 0)
 385              		.loc 1 722 0
 386 01fe 00BF     		nop
 387              	.L21:
 388              		.loc 1 722 0 is_stmt 0 discriminator 1
 389 0200 104B     		ldr	r3, .L23
 390 0202 1B68     		ldr	r3, [r3]
 391 0204 03F00073 		and	r3, r3, #33554432
 392 0208 002B     		cmp	r3, #0
 393 020a F9D0     		beq	.L21
 723:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     {
 724:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     }
 725:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****    
 726:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM32F446xx) || defined(STM32F4
 727:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Enable the Over-drive to extend the clock frequency to 180 Mhz */
 728:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     PWR->CR |= PWR_CR_ODEN;
 729:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     while((PWR->CSR & PWR_CSR_ODRDY) == 0)
 730:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     {
 731:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     }
 732:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     PWR->CR |= PWR_CR_ODSWEN;
 733:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     while((PWR->CSR & PWR_CSR_ODSWRDY) == 0)
 734:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     {
 735:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     }      
 736:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Configure Flash prefetch, Instruction cache, Data cache and wait state */
 737:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     FLASH->ACR = FLASH_ACR_PRFTEN | FLASH_ACR_ICEN |FLASH_ACR_DCEN |FLASH_ACR_LATENCY_5WS;
 738:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F427_437x || STM32F429_439xx || STM32F446xx || STM32F469_479xx */
 739:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 740:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F40_41xxx)  || defined(STM32F412xG)   
 741:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Configure Flash prefetch, Instruction cache, Data cache and wait state */
 742:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     FLASH->ACR = FLASH_ACR_PRFTEN | FLASH_ACR_ICEN |FLASH_ACR_DCEN |FLASH_ACR_LATENCY_5WS;
 394              		.loc 1 742 0 is_stmt 1
 395 020c 104B     		ldr	r3, .L23+12
 396 020e 40F20572 		movw	r2, #1797
 397 0212 1A60     		str	r2, [r3]
 743:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F40_41xxx  || STM32F412xG */
 744:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 745:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(STM32F401xx)
 746:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Configure Flash prefetch, Instruction cache, Data cache and wait state */
 747:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     FLASH->ACR = FLASH_ACR_PRFTEN | FLASH_ACR_ICEN |FLASH_ACR_DCEN |FLASH_ACR_LATENCY_2WS;
 748:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F401xx */
 749:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 750:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Select the main PLL as system clock source */
 751:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
 398              		.loc 1 751 0
 399 0214 0B4A     		ldr	r2, .L23
 400 0216 0B4B     		ldr	r3, .L23
 401 0218 9B68     		ldr	r3, [r3, #8]
 402 021a 23F00303 		bic	r3, r3, #3
 403 021e 9360     		str	r3, [r2, #8]
 752:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->CFGR |= RCC_CFGR_SW_PLL;
 404              		.loc 1 752 0
 405 0220 084A     		ldr	r2, .L23
 406 0222 084B     		ldr	r3, .L23
 407 0224 9B68     		ldr	r3, [r3, #8]
 408 0226 43F00203 		orr	r3, r3, #2
 409 022a 9360     		str	r3, [r2, #8]
 753:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 754:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Wait till the main PLL is used as system clock source */
 755:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS ) != RCC_CFGR_SWS_PLL);
 410              		.loc 1 755 0
 411 022c 00BF     		nop
 412              	.L22:
 413              		.loc 1 755 0 is_stmt 0 discriminator 1
 414 022e 054B     		ldr	r3, .L23
 415 0230 9B68     		ldr	r3, [r3, #8]
 416 0232 03F00C03 		and	r3, r3, #12
 417 0236 082B     		cmp	r3, #8
 418 0238 F9D1     		bne	.L22
 419              	.L15:
 756:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     {
 757:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     }
 758:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   }
 759:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   else
 760:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   { /* If HSE fails to start-up, the application will have wrong clock
 761:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****          configuration. User can add here some code to deal with this error */
 762:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   }
 763:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #elif defined(STM32F410xx) || defined(STM32F411xE)
 764:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #if defined(USE_HSE_BYPASS) 
 765:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /******************************************************************************/
 766:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /*            PLL (clocked by HSE) used as System clock source                */
 767:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** /******************************************************************************/
 768:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   __IO uint32_t StartUpCounter = 0, HSEStatus = 0;
 769:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   
 770:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Enable HSE and HSE BYPASS */
 771:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->CR |= ((uint32_t)RCC_CR_HSEON | RCC_CR_HSEBYP);
 772:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****  
 773:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Wait till HSE is ready and if Time out is reached exit */
 774:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   do
 775:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   {
 776:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     HSEStatus = RCC->CR & RCC_CR_HSERDY;
 777:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     StartUpCounter++;
 778:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   } while((HSEStatus == 0) && (StartUpCounter != HSE_STARTUP_TIMEOUT));
 779:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 780:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   if ((RCC->CR & RCC_CR_HSERDY) != RESET)
 781:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   {
 782:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     HSEStatus = (uint32_t)0x01;
 783:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   }
 784:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   else
 785:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   {
 786:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     HSEStatus = (uint32_t)0x00;
 787:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   }
 788:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 789:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   if (HSEStatus == (uint32_t)0x01)
 790:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   {
 791:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Select regulator voltage output Scale 1 mode */
 792:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->APB1ENR |= RCC_APB1ENR_PWREN;
 793:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     PWR->CR |= PWR_CR_VOS;
 794:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 795:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* HCLK = SYSCLK / 1*/
 796:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->CFGR |= RCC_CFGR_HPRE_DIV1;
 797:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 798:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* PCLK2 = HCLK / 2*/
 799:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->CFGR |= RCC_CFGR_PPRE2_DIV1;
 800:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     
 801:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* PCLK1 = HCLK / 4*/
 802:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->CFGR |= RCC_CFGR_PPRE1_DIV2;
 803:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 804:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Configure the main PLL */
 805:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->PLLCFGR = PLL_M | (PLL_N << 6) | (((PLL_P >> 1) -1) << 16) |
 806:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****                    (RCC_PLLCFGR_PLLSRC_HSE) | (PLL_Q << 24);
 807:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     
 808:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Enable the main PLL */
 809:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->CR |= RCC_CR_PLLON;
 810:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 811:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Wait till the main PLL is ready */
 812:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     while((RCC->CR & RCC_CR_PLLRDY) == 0)
 813:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     {
 814:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     }
 815:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 816:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Configure Flash prefetch, Instruction cache, Data cache and wait state */
 817:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     FLASH->ACR = FLASH_ACR_PRFTEN | FLASH_ACR_ICEN |FLASH_ACR_DCEN |FLASH_ACR_LATENCY_2WS;
 818:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 819:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Select the main PLL as system clock source */
 820:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
 821:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     RCC->CFGR |= RCC_CFGR_SW_PLL;
 822:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** 
 823:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     /* Wait till the main PLL is used as system clock source */
 824:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS ) != RCC_CFGR_SWS_PLL);
 825:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     {
 826:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****     }
 827:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   }
 828:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   else
 829:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   { /* If HSE fails to start-up, the application will have wrong clock
 830:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****          configuration. User can add here some code to deal with this error */
 831:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   }
 832:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #else /* HSI will be used as PLL clock source */
 833:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Select regulator voltage output Scale 1 mode */
 834:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->APB1ENR |= RCC_APB1ENR_PWREN;
 835:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   PWR->CR |= PWR_CR_VOS;
 836:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   
 837:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* HCLK = SYSCLK / 1*/
 838:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->CFGR |= RCC_CFGR_HPRE_DIV1;
 839:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   
 840:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* PCLK2 = HCLK / 2*/
 841:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->CFGR |= RCC_CFGR_PPRE2_DIV1;
 842:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   
 843:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* PCLK1 = HCLK / 4*/
 844:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->CFGR |= RCC_CFGR_PPRE1_DIV2;
 845:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   
 846:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Configure the main PLL */
 847:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->PLLCFGR = PLL_M | (PLL_N << 6) | (((PLL_P >> 1) -1) << 16) | (PLL_Q << 24); 
 848:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   
 849:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Enable the main PLL */
 850:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->CR |= RCC_CR_PLLON;
 851:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   
 852:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Wait till the main PLL is ready */
 853:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   while((RCC->CR & RCC_CR_PLLRDY) == 0)
 854:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   {
 855:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   }
 856:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   
 857:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Configure Flash prefetch, Instruction cache, Data cache and wait state */
 858:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   FLASH->ACR = FLASH_ACR_PRFTEN | FLASH_ACR_ICEN |FLASH_ACR_DCEN |FLASH_ACR_LATENCY_2WS;
 859:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   
 860:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Select the main PLL as system clock source */
 861:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
 862:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   RCC->CFGR |= RCC_CFGR_SW_PLL;
 863:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   
 864:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   /* Wait till the main PLL is used as system clock source */
 865:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS ) != RCC_CFGR_SWS_PLL);
 866:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   {
 867:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c ****   }
 868:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* USE_HSE_BYPASS */  
 869:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** #endif /* STM32F40_41xxx || STM32F427_437xx || STM32F429_439xx || STM32F401xx || STM32F469_479xx */
 870:C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil\system_stm32f4xx.c **** }
 420              		.loc 1 870 0 is_stmt 1
 421 023a 0C37     		adds	r7, r7, #12
 422              		.cfi_def_cfa_offset 4
 423 023c BD46     		mov	sp, r7
 424              		.cfi_def_cfa_register 13
 425              		@ sp needed
 426 023e 5DF8047B 		ldr	r7, [sp], #4
 427              		.cfi_restore 7
 428              		.cfi_def_cfa_offset 0
 429 0242 7047     		bx	lr
 430              	.L24:
 431              		.align	2
 432              	.L23:
 433 0244 00380240 		.word	1073887232
 434 0248 00700040 		.word	1073770496
 435 024c 19544007 		.word	121656345
 436 0250 003C0240 		.word	1073888256
 437              		.cfi_endproc
 438              	.LFE125:
 440              	.Letext0:
 441              		.file 2 "c:\\gcc\\arm-none-eabi\\include\\machine\\_default_types.h"
 442              		.file 3 "c:\\gcc\\arm-none-eabi\\include\\stdint.h"
 443              		.file 4 "C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil/core_cm4.h"
 444              		.file 5 "C:/Users/Gustav/Desktop/DAT290 - Projekt/dat290-7/programming/bil/stm32f4xx.h"
