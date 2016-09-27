//#include "stdint.h"
#include "stm32f4xx.h"
#include "system_stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx_usart.h"
//#include "stm32f4xx_flash.h"
#include "stm32f4xx_tim.h"
#include "USART.h"

void startup(void) __attribute__((naked)) __attribute__((section(".start_section")));
void startup (void)
{
__asm volatile(   
    " mov r0, #0xc000\n"        /* set stack */
    " movt r0, #0x2001\n"
    " mov sp, r0\n"
    " bl main\n"                /* call main */   
    ".l1: b .l1\n"              /* never return */
    ) ;    
}

void appInit(void)
{
	//init_SCI(USART1, 96000, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, USART_Mode_Tx | USART_Mode_Rx, USART_HardwareFlowControl_None);
}

#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line)
{

}
#endif

void main(void)
{
    appInit();
	uint16_t t = 'Q';
	while(1)
	{
		t = read_SCI(USART1);
		if (t != 0)
		{
			write_SCI(USART1, t);
		}
	}
}