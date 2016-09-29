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
	GPIO_InitTypeDef GPIO_InitStructure;

	//Initiera UART	
	SystemInit();
	SystemCoreClockUpdate();
		
	if (SysTick_Config(SystemCoreClock / 100))
	{
		//write_SCI(USART1, '3');

		//while (1);
	}
	
	
	
	//GPIO clock
	RCC_AHB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
	
	//Initiera GPIO
	GPIO_PinAFConfig(UART4, GPIO_PinSource11, GPIO_AF_USART2);
	GPIO_PinAFConfig(UART4, GPIO_PinSource10, GPIO_AF_USART2);

	
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
	GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11;
	GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	//USART_OverSampling8Cmd(USART2, ENABLE);
	
	init_SCI(USART2, 38400, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, USART_Mode_Tx, USART_HardwareFlowControl_None);

}

void init_uart()
{
	GPIO_InitTypeDef GPIO_initStruct;
	USART_InitTypeDef USART_InitStruct;
	
	//Aktivera klockan till GPIO port A
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA,ENABLE);
	
	//Sätt alternativ funktion på på PA0 och PA1
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource0,GPIO_AF_UART4);
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource1,GPIO_AF_UART4);
	
	//Fyll i GPIO-strukturen
	GPIO_initStruct.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1;
	GPIO_initStruct.GPIO_Mode = GPIO_Mode_AF;
	GPIO_initStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_initStruct.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_initStruct.GPIO_Speed = GPIO_Speed_100MHz;
	
	//Initiera GPIO port A
	GPIO_Init(GPIOA,&GPIO_initStruct);
	
	//Aktivera klockan till UART4
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_UART4,ENABLE);
	
	//Fyll i U(S)ART-strukturen
	USART_InitStruct.USART_BaudRate = 300; //38400 är default för bluetoothmodulen
	USART_InitStruct.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStruct.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
	USART_InitStruct.USART_Parity = USART_Parity_No;
	USART_InitStruct.USART_StopBits = USART_StopBits_1;
	USART_InitStruct.USART_WordLength = USART_WordLength_8b;
	
	//Initiera UART4
	USART_Init(UART4,&USART_InitStruct);
	USART_Cmd(UART4,ENABLE);
}

#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line)
{

}
#endif

void send_cmd(uint8_t cmd, uint8_t val)
{
	uint8_t msg = (cmd << 6) | (val & 0b00111111);
	USART_SendData(UART4, msg);
}

void debug_delay()
{
	long int i = 0;
	for (i = 0; i < 10000000; i++)
	{
		
	}
}

void main(void)
{
	init_uart();
    //appInit();
	uint8_t t = 1;
	uint8_t dir = 1;
	int offset = 110;
	
	debug_delay();
	
	while(1)
	{
		t += dir;
		
		if (t == (173 - offset))
		{
			dir = -1;
		}
		
		if (t == (110 - offset))
		{
			dir = 1;
		}
		
		write_SCI(USART1, t);
		send_cmd(1, t);
		debug_delay();
	}
}