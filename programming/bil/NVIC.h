/*
   NVIC.h
*/

#ifndef NVIC_H
#define NVIC_H

#include "misc.h"

//RamIrqVectorBase
#define RAM_IRQ_VECTOR_BASE 0x2001C000
//RamIrqVectorOffset
#define RESET_IRQ_VECTOR_OFFSET 0x04
#define NMI_IRQ_VECTOR_OFFSET 0x08
#define HardFault_IRQ_VECTOR_OFFSET 0x0C
#define MemManage_IRQ_VECTOR_OFFSET 0x10
#define BusFault_IRQ_VECTOR_OFFSET 0x14
#define UsageFault_IRQ_VECTOR_OFFSET 0x18
#define SVCall_IRQ_VECTOR_OFFSET 0x2C
#define Debug_Monitor_IRQ_VECTOR_OFFSET 0x30
#define PendSV_IRQ_VECTOR_OFFSET 0x38
#define SysTick_IRQ_VECTOR_OFFSET 0x3C
#define WWDG_IRQ_VECTOR_OFFSET 0x40
#define PVD_IRQ_VECTOR_OFFSET 0x44
#define TAMP_STAMP_IRQ_VECTOR_OFFSET 0x48
#define RTC_WKUP_IRQ_VECTOR_OFFSET 0x4C
#define FLASH_IRQ_VECTOR_OFFSET 0x50
#define RCC_IRQ_VECTOR_OFFSET 0x54
#define EXTI0_IRQ_VECTOR_OFFSET 0x58
#define EXTI1_IRQ_VECTOR_OFFSET 0x5C
#define EXTI2_IRQ_VECTOR_OFFSET 0x60
#define EXTI3_IRQ_VECTOR_OFFSET 0x64
#define EXTI4_IRQ_VECTOR_OFFSET 0x68
#define DMA1_Stream0_IRQ_VECTOR_OFFSET 0x6C
#define DMA1_Stream1_IRQ_VECTOR_OFFSET 0x70
#define DMA1_Stream2_IRQ_VECTOR_OFFSET 0x74
#define DMA1_Stream3_IRQ_VECTOR_OFFSET 0x78
#define DMA1_Stream4_IRQ_VECTOR_OFFSET 0x7C
#define DMA1_Stream5_IRQ_VECTOR_OFFSET 0x80
#define DMA1_Stream6_IRQ_VECTOR_OFFSET 0x84
#define ADC_IRQ_VECTOR_OFFSET 0x88
#define CAN1_TX_IRQ_VECTOR_OFFSET 0x8C
#define CAN1_RX0_IRQ_VECTOR_OFFSET 0x90
#define CAN1_RX1_IRQ_VECTOR_OFFSET 0x94
#define CAN1_SCE_IRQ_VECTOR_OFFSET 0x98
#define EXTI9_15_IRQ_VECTOR_OFFSET 0x9C
#define TIM1_BRK_TIM9_IRQ_VECTOR_OFFSET 0xA0
#define TIM1_UP_TIM10_IRQ_VECTOR_OFFSET 0xA4
#define TIM1_TRG_COM_TIM11_IRQ_VECTOR_OFFSET 0xA8
#define TIM1_CC_IRQ_VECTOR_OFFSET 0xAC
#define TIM2_IRQ_VECTOR_OFFSET 0xB0
#define TIM3_IRQ_VECTOR_OFFSET 0xB4
#define TIM4_IRQ_VECTOR_OFFSET 0xB8
#define I2C1_EV_IRQ_VECTOR_OFFSET 0xBC
#define I2C1_ER_IRQ_VECTOR_OFFSET 0xC0
#define I2C2_EV_IRQ_VECTOR_OFFSET 0xC4
#define I2C2_ER_IRQ_VECTOR_OFFSET 0xC8
#define SPI1_IRQ_VECTOR_OFFSET 0xCC
#define SPI2_IRQ_VECTOR_OFFSET 0xD0
#define USART1_IRQ_VECTOR_OFFSET 0xD4
#define USART2_IRQ_VECTOR_OFFSET 0xD8
#define USART3_IRQ_VECTOR_OFFSET 0xDC
#define EXTI15_10_IRQ_VECTOR_OFFSET 0xE0
#define RTC_Alarm_IRQ_VECTOR_OFFSET 0xE4
#define OTG_FSWKUP_IRQ_VECTOR_OFFSET 0xE8
#define TIM8_BRK_TIM12_IRQ_VECTOR_OFFSET 0xEC
#define TIM8_UP_TIM13_IRQ_VECTOR_OFFSET 0xF0
#define TIM8_TRG_COM_TIM14_IRQ_VECTOR_OFFSET 0xF4
#define TIM8_CC_IRQ_VECTOR_OFFSET 0xF8
#define DMA1_Stream7_IRQ_VECTOR_OFFSET 0xFC
#define FSMC_IRQ_VECTOR_OFFSET 0x100
#define SDIO_IRQ_VECTOR_OFFSET 0x104
#define TIM5_IRQ_VECTOR_OFFSET 0x108
#define SPI3_IRQ_VECTOR_OFFSET 0x10C
#define UART4_IRQ_VECTOR_OFFSET 0x110
#define UART5_IRQ_VECTOR_OFFSET 0x114
#define TIM6_DAC_IRQ_VECTOR_OFFSET 0x118
#define TIM7_IRQ_VECTOR_OFFSET 0x11C
#define DMA2_Stream0_IRQ_VECTOR_OFFSET 0x120
#define DMA2_Stream1_IRQ_VECTOR_OFFSET 0x124
#define DMA2_Stream2_IRQ_VECTOR_OFFSET 0x128
#define DMA2_Stream3_IRQ_VECTOR_OFFSET 0x12C
#define DMA2_Stream4_IRQ_VECTOR_OFFSET 0x130
#define ETH_Stream0_IRQ_VECTOR_OFFSET 0x134
#define ETH_WKUP_Stream0_IRQ_VECTOR_OFFSET 0x138
#define CAN2_TX_Stream0_IRQ_VECTOR_OFFSET 0x13C
#define CAN2_RX0_Stream0_IRQ_VECTOR_OFFSET 0x140
#define CAN2_RX1_Stream0_IRQ_VECTOR_OFFSET 0x144
#define CAN2_SCE_Stream0_IRQ_VECTOR_OFFSET 0x148
#define OTG_FS_IRQ_VECTOR_OFFSET 0x14C
#define DMA2_Stream5_IRQ_VECTOR_OFFSET 0x150
#define DMA2_Stream6_IRQ_VECTOR_OFFSET 0x154
#define DMA2_Stream7_IRQ_VECTOR_OFFSET 0x158
#define USART6_IRQ_VECTOR_OFFSET 0x15C
#define I2C3_EV_IRQ_VECTOR_OFFSET 0x160
#define I2C3_ER_IRQ_VECTOR_OFFSET 0x164
#define OTG_HS_EP1_OUT_IRQ_VECTOR_OFFSET 0x168
#define OTG_HS_EP1_IN_IRQ_VECTOR_OFFSET 0x16C
#define OTG_HS_WKUP_IRQ_VECTOR_OFFSET 0x170
#define OTG_HS_IRQ_VECTOR_OFFSET 0x174
#define DCMI_IRQ_VECTOR_OFFSET 0x178
#define CRYP_IRQ_VECTOR_OFFSET 0x17C
#define HASH_RING_IRQ_VECTOR_OFFSET 0x180
#define FPU_IRQ_VECTOR_OFFSET 0x184

//-- SysTickCtrl --
#define SYSTICK_CLOCK_SOURCE_EXTERNAL 0x00
#define SYSTICK_CLOCK_SOURCE_CORE 0x04
#define SYSTICK_IRQ_ENABLE 0x02
#define SYSTICK_ENABLE 0x01

//-- wait_for_SysTick --
#define SYSTICK_FLAG 0x00010000

void init_IRQ_Channel(uint8_t NVIC_IRQChannel,
                      uint8_t NVIC_IRQChannelPreemptionPriority,
                      uint8_t NVIC_IRQChannelSubPriority,
                      FunctionalState NVIC_IRQChannelCmd);

void DisableInterrupts( void ) __attribute__( ( naked ) ) ;
   void DisableInterrupts( void ) ;

void EnableInterrupts( void ) __attribute__( ( naked ) ) ;
   void EnableInterrupts( void );

void set_IRQ_vector(uint32_t RamIrqVectorBase,
                    uint32_t RamIrqVectorOffset,
					void IRQ_Handler(void));

void init_SysTick(uint32_t SysTickCtrl,
                  uint32_t SysTickLoad,
                  uint32_t SysTickCurrentValue);

void set_interval_SysTick(uint32_t interval);

uint32_t get_current_value_SysTick(void);

void enable_SysTick(void);

void disable_SysTick(void);

void wait_for_SysTick(void);

void delay_us(uint32_t us);

void delay_ms(uint32_t ms);

void delay_s(uint32_t s);

//** init_IRQ_Channel **
//-- NVIC_IRQChannel --
//   !! Cortex-M4 Processor Exceptions !!
//   NonMaskableInt_IRQn - Non Maskable Interrupt
//   MemoryManagement_IRQn - Cortex-M4 Memory Management Interrupt
//   BusFault_IRQn - 5 Cortex-M4 Bus Fault Interrupt
//   UsageFault_IRQn - Cortex-M4 Usage Fault Interrupt
//   SVCall_IRQn - Cortex-M4 SV Call Interrupt
//   DebugMonitor_IRQn - Cortex-M4 Debug Monitor Interrupt
//   PendSV_IRQn - 14 Cortex-M4 Pend SV Interrupt
//   SysTick_IRQn - Cortex-M4 System Tick Interrupt
//   !! STM32 specific Interrupts !!
//   WWDG_IRQn - Window WatchDog Interrupt
//   PVD_IRQn - PVD through EXTI Line detection Interrupt
//   TAMP_STAMP_IRQn - Tamper and TimeStamp interrupts through the EXTI line
//   RTC_WKUP_IRQn - RTC Wakeup interrupt through the EXTI line
//   FLASH_IRQn - FLASH global Interrupt
//   RCC_IRQn - RCC global Interrupt
//   EXTI0_IRQn - EXTI Line0 Interrupt
//   EXTI1_IRQn - EXTI Line1 Interrupt
//   EXTI2_IRQn - EXTI Line2 Interrupt
//   EXTI3_IRQn - EXTI Line3 Interrupt
//   EXTI4_IRQn - EXTI Line4 Interrupt
//   DMA1_Stream0_IRQn - DMA1 Stream 0 global Interrupt
//   DMA1_Stream1_IRQn - DMA1 Stream 1 global Interrupt
//   DMA1_Stream2_IRQn - DMA1 Stream 2 global Interrupt
//   DMA1_Stream3_IRQn - DMA1 Stream 3 global Interrupt
//   DMA1_Stream4_IRQn - DMA1 Stream 4 global Interrupt
//   DMA1_Stream5_IRQn - DMA1 Stream 5 global Interrupt
//   DMA1_Stream6_IRQn - DMA1 Stream 6 global Interrupt
//   ADC_IRQn - ADC1, ADC2 and ADC3 global Interrupts
//   !! STM32F40_41xxx Interrupts !!
//   CAN1_TX_IRQn - CAN1 TX Interrupt-
//   CAN1_RX0_IRQn - CAN1 RX0 Interrupt
//   CAN1_RX1_IRQn - CAN1 RX1 Interrupt
//   CAN1_SCE_IRQn - CAN1 SCE Interrupt
//   EXTI9_5_IRQn - External Line[9:5] Interrupts
//   TIM1_BRK_TIM9_IRQn - TIM1 Break interrupt and TIM9 global interrupt
//   TIM1_UP_TIM10_IRQn - TIM1 Update Interrupt and TIM10 global interrupt
//   TIM1_TRG_COM_TIM11_IRQn - TIM1 Trigger and Commutation Interrupt and TIM11 global interrupt
//   TIM1_CC_IRQn - TIM1 Capture Compare Interrupt
//   TIM2_IRQn - TIM2 global Interrupt
//   TIM3_IRQn - TIM3 global Interrupt
//   TIM4_IRQn - TIM4 global Interrupt
//   I2C1_EV_IRQn - I2C1 Event Interrupt
//   I2C1_ER_IRQn - I2C1 Error Interrupt
//   I2C2_EV_IRQn - I2C2 Event Interrupt
//   I2C2_ER_IRQn - I2C2 Error Interrupt
//   SPI1_IRQn - SPI1 global Interrupt
//   SPI2_IRQn - SPI2 global Interrupt
//   USART1_IRQn - USART1 global Interrupt
//   USART2_IRQn - USART2 global Interrupt
//   USART3_IRQn - USART3 global Interrupt
//   EXTI15_10_IRQn - External Line[15:10] Interrupts
//   RTC_Alarm_IRQn - RTC Alarm (A and B) through EXTI Line Interrupt
//   OTG_FS_WKUP_IRQn - USB OTG FS Wakeup through EXTI line interrupt
//   TIM8_BRK_TIM12_IRQn - TIM8 Break Interrupt and TIM12 global interrupt
//   TIM8_UP_TIM13_IRQn - TIM8 Update Interrupt and TIM13 global interrupt
//   TIM8_TRG_COM_TIM14_IRQn - TIM8 Trigger and Commutation Interrupt and TIM14 global interrupt
//   TIM8_CC_IRQn - TIM8 Capture Compare Interrupt
//   DMA1_Stream7_IRQn - DMA1 Stream7 Interrupt
//   FSMC_IRQn - FSMC global Interrupt
//   SDIO_IRQn - SDIO global Interrupt
//   TIM5_IRQn - TIM5 global Interrupt
//   SPI3_IRQn - SPI3 global Interrupt
//   UART4_IRQn - UART4 global Interrupt
//   UART5_IRQn - UART5 global Interrupt
//   TIM6_DAC_IRQn - TIM6 global and DAC1&2 underrun error interrupts
//   TIM7_IRQn - TIM7 global interrupt
//   DMA2_Stream0_IRQn - DMA2 Stream 0 global Interrupt
//   DMA2_Stream1_IRQn - DMA2 Stream 1 global Interrupt
//   DMA2_Stream2_IRQn - DMA2 Stream 2 global Interrupt
//   DMA2_Stream3_IRQn - DMA2 Stream 3 global Interrupt
//   DMA2_Stream4_IRQn - DMA2 Stream 4 global Interrupt
//   ETH_IRQn - Ethernet global Interrupt
//   ETH_WKUP_IRQn - Ethernet Wakeup through EXTI line Interrupt
//   CAN2_TX_IRQn - CAN2 TX Interrupt
//   CAN2_RX0_IRQn - CAN2 RX0 Interrupt
//   CAN2_RX1_IRQn - CAN2 RX1 Interrupt
//   CAN2_SCE_IRQn - CAN2 SCE Interrupt
//   OTG_FS_IRQn - USB OTG FS global Interrupt
//   DMA2_Stream5_IRQn - DMA2 Stream 5 global interrupt
//   DMA2_Stream6_IRQn - DMA2 Stream 6 global interrupt
//   DMA2_Stream7_IRQn - DMA2 Stream 7 global interrupt
//   USART6_IRQn - USART6 global interrupt
//   I2C3_EV_IRQn - I2C3 event interrupt
//   I2C3_ER_IRQn - I2C3 error interrupt
//   OTG_HS_EP1_OUT_IRQn - USB OTG HS End Point 1 Out global interrupt
//   OTG_HS_EP1_IN_IRQn - USB OTG HS End Point 1 In global interrupt
//   OTG_HS_WKUP_IRQn - USB OTG HS Wakeup through EXTI interrupt
//   OTG_HS_IRQn - USB OTG HS global interrupt
//   DCMI_IRQn - DCMI global interrupt
//   CRYP_IRQn - CRYP crypto global interrupt
//   HASH_RNG_IRQn - Hash and Rng global interrupt
//   FPU_IRQn - FPU global interrupt

//** init_SysTick **
//-- SysTickCtrl --
//   SYSTICK_CLOCK_SOURCE_EXTERNAL
//   SYSTICK_CLOCK_SOURCE_CORE
//   SYSTICK_IRQ_ENABLE
//   SYSTICK_ENABLE
//-- SysTickLoad --
//   0x00000000 - 0xFFFFFFFF
//-- SysTickCurrentValue --
//   0x00000000 - 0xFFFFFFFF

//-- wait_for_SysTick --
#define SYSTICK_FLAG 0x00010000

//-- NVIC_IRQChannelPreemptionPriority --
//   0x0 - 0xF

//-- NVIC_IRQChannelSubPriority --
//   0x0 - 0xF

//-- NVIC_IRQChannelCmd --
//   ENABLE
//   DISABLE

//** set_IRQ_vector **
//-- RamIrqVectorBase --
//   RAM_IRQ_VECTOR_BASE
//-- RamIrqVectorOffset --
//   RESET_IRQ_VECTOR_OFFSET
//   NMI_IRQ_VECTOR_OFFSET
//   HardFault_IRQ_VECTOR_OFFSET
//   MemManage_IRQ_VECTOR_OFFSET
//   BusFault_IRQ_VECTOR_OFFSET
//   UsageFault_IRQ_VECTOR_OFFSET
//   SVCall_IRQ_VECTOR_OFFSET
//   Debug_Monitor_IRQ_VECTOR_OFFSET
//   PendSV_IRQ_VECTOR_OFFSET
//   SysTick_IRQ_VECTOR_OFFSET
//   WWDG_IRQ_VECTOR_OFFSET
//   PVD_IRQ_VECTOR_OFFSET
//   TAMP_STAMP_IRQ_VECTOR_OFFSET
//   RTC_WKUP_IRQ_VECTOR_OFFSET
//   FLASH_IRQ_VECTOR_OFFSET
//   RCC_IRQ_VECTOR_OFFSET
//   EXTI0_IRQ_VECTOR_OFFSET
//   EXTI1_IRQ_VECTOR_OFFSET
//   EXTI2_IRQ_VECTOR_OFFSET
//   EXTI3_IRQ_VECTOR_OFFSET
//   EXTI4_IRQ_VECTOR_OFFSET
//   DMA1_Stream0_IRQ_VECTOR_OFFSET
//   DMA1_Stream1_IRQ_VECTOR_OFFSET
//   DMA1_Stream2_IRQ_VECTOR_OFFSET
//   DMA1_Stream3_IRQ_VECTOR_OFFSET
//   DMA1_Stream4_IRQ_VECTOR_OFFSET
//   DMA1_Stream5_IRQ_VECTOR_OFFSET
//   DMA1_Stream6_IRQ_VECTOR_OFFSET
//   ADC_IRQ_VECTOR_OFFSET
//   CAN1_TX_IRQ_VECTOR_OFFSET
//   CAN1_RX0_IRQ_VECTOR_OFFSET
//   CAN1_RX1_IRQ_VECTOR_OFFSET
//   CAN1_SCE_IRQ_VECTOR_OFFSET
//   EXTI9_15_IRQ_VECTOR_OFFSET
//   TIM1_BRK_TIM9_IRQ_VECTOR_OFFSET
//   TIM1_UP_TIM10_IRQ_VECTOR_OFFSET
//   TIM1_TRG_COM_TIM11_IRQ_VECTOR_OFFSET
//   TIM1_CC_IRQ_VECTOR_OFFSET
//   TIM2_IRQ_VECTOR_OFFSET
//   TIM3_IRQ_VECTOR_OFFSET
//   TIM4_IRQ_VECTOR_OFFSET
//   I2C1_EV_IRQ_VECTOR_OFFSET
//   I2C1_ER_IRQ_VECTOR_OFFSET
//   I2C2_EV_IRQ_VECTOR_OFFSET
//   I2C2_ER_IRQ_VECTOR_OFFSET
//   SPI1_IRQ_VECTOR_OFFSET
//   SPI2_IRQ_VECTOR_OFFSET
//   USART1_IRQ_VECTOR_OFFSET
//   USART2_IRQ_VECTOR_OFFSET
//   USART3_IRQ_VECTOR_OFFSET
//   EXTI15_10_IRQ_VECTOR_OFFSET
//   RTC_Alarm_IRQ_VECTOR_OFFSET
//   OTG_FSWKUP_IRQ_VECTOR_OFFSET
//   TIM8_BRK_TIM12_IRQ_VECTOR_OFFSET
//   TIM8_UP_TIM13_IRQ_VECTOR_OFFSET
//   TIM8_TRG_COM_TIM14_IRQ_VECTOR_OFFSET
//   TIM8_CC_IRQ_VECTOR_OFFSET
//   DMA1_Stream7_IRQ_VECTOR_OFFSET
//   FSMC_IRQ_VECTOR_OFFSET
//   SDIO_IRQ_VECTOR_OFFSET
//   TIM5_IRQ_VECTOR_OFFSET
//   SPI3_IRQ_VECTOR_OFFSET
//   UART4_IRQ_VECTOR_OFFSET
//   UART5_IRQ_VECTOR_OFFSET
//   TIM6_DAC_IRQ_VECTOR_OFFSET
//   TIM7_IRQ_VECTOR_OFFSET
//   DMA2_Stream0_IRQ_VECTOR_OFFSET
//   DMA2_Stream1_IRQ_VECTOR_OFFSET
//   DMA2_Stream2_IRQ_VECTOR_OFFSET
//   DMA2_Stream3_IRQ_VECTOR_OFFSET
//   DMA2_Stream4_IRQ_VECTOR_OFFSET
//   ETH_Stream0_IRQ_VECTOR_OFFSET
//   ETH_WKUP_Stream0_IRQ_VECTOR_OFFSET
//   CAN2_TX_Stream0_IRQ_VECTOR_OFFSET
//   CAN2_RX0_Stream0_IRQ_VECTOR_OFFSET
//   CAN2_RX1_Stream0_IRQ_VECTOR_OFFSET
//   CAN2_SCE_Stream0_IRQ_VECTOR_OFFSET
//   OTG_FS_IRQ_VECTOR_OFFSET
//   DMA2_Stream5_IRQ_VECTOR_OFFSET
//   DMA2_Stream6_IRQ_VECTOR_OFFSET
//   DMA2_Stream7_IRQ_VECTOR_OFFSET
//   USART6_IRQ_VECTOR_OFFSET
//   I2C3_EV_IRQ_VECTOR_OFFSET
//   I2C3_ER_IRQ_VECTOR_OFFSET
//   OTG_HS_EP1_OUT_IRQ_VECTOR_OFFSET
//   OTG_HS_EP1_IN_IRQ_VECTOR_OFFSET
//   OTG_HS_WKUP_IRQ_VECTOR_OFFSET
//   OTG_HS_IRQ_VECTOR_OFFSET
//   DCMI_IRQ_VECTOR_OFFSET
//   CRYP_IRQ_VECTOR_OFFSET
//   HASH_RING_IRQ_VECTOR_OFFSET
//   FPU_IRQ_VECTOR_OFFSET

//** init_SysTick **
//-- SysTickCtrl --
//   SYSTICK_CLOCK_SOURCE_EXTERNAL
//   SYSTICK_CLOCK_SOURCE_CORE
//   SYSTICK_IRQ_ENABLE
//   SYSTICK_ENABLE

//-- wait_for_SysTick --
//   SYSTICK_FLAG

//*****************************************************************
//** Definitions for other functions **
//-- MISC_Vector_Table_Base --
//   NVIC_VectTab_RAM
//   NVIC_VectTab_FLASH

//-- MISC_System_Low_Power --
//   NVIC_LP_SEVONPEND
//   NVIC_LP_SLEEPDEEP
//   NVIC_LP_SLEEPONEXIT

//-- MISC_Preemption_Priority_Group --
//   NVIC_PriorityGroup_0 - 0 bits for pre-emption priority
//                          4 bits for subpriority
//   NVIC_PriorityGroup_1 - 1 bits for pre-emption priority
//                          3 bits for subpriority
//   NVIC_PriorityGroup_2 - 2 bits for pre-emption priority
//                          2 bits for subpriority
//   NVIC_PriorityGroup_3 - 3 bits for pre-emption priority
//                          1 bits for subpriority
//   NVIC_PriorityGroup_4 - 4 bits for pre-emption priority
//                          0 bits for subpriority

//-- NVIC_Preemption_Priority --
//   0x00 - 0x10

//-- NVIC_Sub_Priority --
//   0x00 - 0x10

//-- NVIC_Offset --
//   0x00000000 - 0x000FFFFF

//-- MISC_SysTick_clock_source
//   SysTick_CLKSource_HCLK_Div8
//   SysTick_CLKSource_HCLK

#endif
