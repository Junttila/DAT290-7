//#include "stdint.h"
#include "stm32f4xx.h"
#include "system_stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx_usart.h"
//#include "stm32f4xx_flash.h"
#include "stm32f4xx_tim.h"
#include "test.h"

typedef int bool;
#define true 1
#define false 0

TIM_OCInitTypeDef  TIM_OCInitStructure;
TIM_TimeBaseInitTypeDef TIM_TimeBaseStructure;

// Motor
uint16_t CCR3_val = 10;
// Styrning
uint16_t CCR4_val = 0;

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}

#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line)
{
	//while(1);
	/* Use GDB to find out why we're here */
}
#endif

void init_system ()
{
	SystemInit();
	//kopiera datasegmentet till ram här
	//Fyll BSS med nollor
	SystemCoreClockUpdate();
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
	USART_InitStruct.USART_BaudRate = 38400; //38400 är default för bluetoothmodulen
	USART_InitStruct.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStruct.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
	USART_InitStruct.USART_Parity = USART_Parity_No;
	USART_InitStruct.USART_StopBits = USART_StopBits_1;
	USART_InitStruct.USART_WordLength = USART_WordLength_8b;
	
	//Initiera UART4
	USART_Init(UART4,&USART_InitStruct);
	USART_Cmd(UART4,ENABLE);
}

void init_pwm()
{
	GPIO_InitTypeDef GPIO_InitStruct;
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2,ENABLE);
	
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_2 | GPIO_Pin_3; //TIM2 kanal 3 och 4
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOA, &GPIO_InitStruct);
	
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource2, GPIO_AF_TIM2);
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource3, GPIO_AF_TIM2);
	
	uint16_t PrescalerValue = ((SystemCoreClock/2)/60000000)-1;  //Prescaler = ((SystemCoreClock /2) /21 MHz) - 1
		
	TIM_TimeBaseStructure.TIM_Period = 65535; //Måste möjligtvis ändras, TIM_Period verkar vara 16b
	TIM_TimeBaseStructure.TIM_Prescaler = 0;
	TIM_TimeBaseStructure.TIM_ClockDivision = 0;
	TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
	
	TIM_TimeBaseInit(TIM2, &TIM_TimeBaseStructure);
	TIM_PrescalerConfig(TIM2, PrescalerValue,TIM_PSCReloadMode_Immediate);
	TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM1;
	TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
	TIM_OCInitStructure.TIM_Pulse = CCR3_val;
	TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;

	TIM_OC3Init(TIM2, &TIM_OCInitStructure);
	TIM_OC3PreloadConfig(TIM2, TIM_OCPreload_Enable);
	
	TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
	TIM_OCInitStructure.TIM_Pulse = CCR4_val;
	
	TIM_OC4Init(TIM2, &TIM_OCInitStructure);
	TIM_OC4PreloadConfig(TIM2, TIM_OCPreload_Enable);
    TIM_ARRPreloadConfig(TIM2, ENABLE);
	
	TIM_Cmd(TIM2, ENABLE);
}

#define TIM2_ARR ((unsigned int*) TIM2_BASE + 0x2C)
#define TIM2_CCR3 ((unsigned int*) TIM2_BASE + 0x3C)
#define TIM2_CCR4 ((unsigned int*) TIM2_BASE + 0x40)

void change_duty_cycle(TIM_TypeDef* TIMx,bool change_engine, bool change_steering, float percent)
{
	uint32_t tmp = (uint32_t)TIMx->ARR*(percent/100.00);
	if(change_engine)
	{
		*TIM2_CCR3 = tmp;
	}
	if(change_steering)
	{
		*TIM2_CCR4 = tmp;
	}
}

void init_app()
{
	init_system();
	init_uart();
	init_pwm();
}

int main()
{
	init_app();
    while(1) 
    {
        CCR4_val++;
		*TIM2_CCR4 = CCR4_val;
        delay_milli(100);
    }

	/*char data[10];
    int index = 0;
	while(1)
	{
        char tmp = _inchar();
        if(tmp!=0 && index < 10)
        {
            if (tmp == '\n')
            {
                data[index] = '\0';
                CCR4_val = myAtoi(&data);
                _outchar(CCR4_val);
            }
            else
            {
                data[index++] = (char)tmp;
            }
        }
	}*/
}


/*
 * UART4_TX = PA0/PC10, Alternative function 8
 * UART4_RX = PA1/PC11, AF 8
 * TIM2 Channel 3 = PA2
 * TIM2 Channel 4 = PA3
 * UART4 = 0x4000 4C00 - 0x4000 4FFF 
 * */