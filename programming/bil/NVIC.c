/*
   NVIC.c
*/

#define assert_param(x)

#include "NVIC.h"

NVIC_InitTypeDef NVIC_InitStructure;

/* Enable global Interrupt */
void init_IRQ_Channel(uint8_t NVIC_IRQChannel,
                      uint8_t NVIC_IRQChannelPreemptionPriority,
                      uint8_t NVIC_IRQChannelSubPriority,
                      FunctionalState NVIC_IRQChannelCmd)
{
   NVIC_InitStructure.NVIC_IRQChannel = NVIC_IRQChannel;
   NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = NVIC_IRQChannelPreemptionPriority;
   NVIC_InitStructure.NVIC_IRQChannelSubPriority = NVIC_IRQChannelSubPriority;
   NVIC_InitStructure.NVIC_IRQChannelCmd = NVIC_IRQChannelCmd;

   NVIC_Init(&NVIC_InitStructure);
}

	void DisableInterrupts( void ) __attribute__( ( naked ) ) ;
		void DisableInterrupts( void )
		{
			__asm ("        cpsid     i\n"        /* set I=1 */
				   "        bx        lr\n");
		}

	void EnableInterrupts( void ) __attribute__( ( naked ) ) ;
		void EnableInterrupts( void )
		{
			__asm ("        cpsie     i\n"        /* set I=0 */
				   "        bx        lr\n");
		}

	void set_IRQ_vector(uint32_t RamIrqVectorBase,
						uint32_t RamIrqVectorOffset,
						void IRQ_Handler(void))
	{
		*((void (**)(void) ) (RamIrqVectorBase+RamIrqVectorOffset) ) = IRQ_Handler;
	}

	void init_SysTick(uint32_t SysTickCtrl,
	                  uint32_t SysTickLoad,
	                  uint32_t SysTickCurrentValue)
	{
		SysTick->CTRL = SysTickCtrl;
		SysTick->LOAD = SysTickLoad;
		SysTick->VAL = SysTickCurrentValue;
	};

	void set_interval_SysTick(uint32_t interval)
	{
		SysTick->LOAD = interval;
	};

	uint32_t get_current_value_SysTick(void)
	{
		return SysTick->VAL;
	};

	void enable_SysTick(void)
	{
		SysTick->CTRL = SysTick->CTRL | SYSTICK_ENABLE;
	};

	void disable_SysTick(void)
		{
		SysTick->CTRL = SysTick->CTRL & ~SYSTICK_ENABLE;
	};

	void wait_for_SysTick(void)
	{
		while ((SysTick->CTRL & SYSTICK_FLAG) == 0);
	}

	void delay_us(uint32_t us)
	{
		init_SysTick(SYSTICK_CLOCK_SOURCE_CORE,
	                 us*168-1,
	                 0);
		enable_SysTick();
		wait_for_SysTick();
		disable_SysTick();
	}

	void delay_ms(uint32_t ms)
	{
		uint32_t i;
		for (i=0;i<ms;i++)
			delay_us(1000);
	}

	void delay_s(uint32_t s)
	{
		uint32_t i;
		for (i=0;i<s;i++)
			delay_ms(1000);
	}