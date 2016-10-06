//#include "stdint.h"
#include "stm32f4xx.h"
#include "system_stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx_usart.h"
//#include "stm32f4xx_flash.h"
#include "stm32f4xx_tim.h"
#include "USART.h"
#include "stm32f4xx_adc.h"
#include "stm32f4xx_dma.h"

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
	USART_InitStruct.USART_BaudRate = 9600; //38400 är default för bluetoothmodulen
	USART_InitStruct.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStruct.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
	USART_InitStruct.USART_Parity = USART_Parity_No;
	USART_InitStruct.USART_StopBits = USART_StopBits_2;
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
	for (i = 0; i < 10000000/100; i++)
	{
		
	}
}

uint16_t ADC_Val; //Stores the calculated ADC value
 
void init_adc(void)
{

	ADC_InitTypeDef       ADC_InitStructure;
	ADC_CommonInitTypeDef ADC_CommonInitStructure;
	GPIO_InitTypeDef      GPIO_InitStructure;

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1 | RCC_APB2Periph_ADC2 | RCC_APB2Periph_ADC3 , ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);  
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AN;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL ;
	GPIO_Init(GPIOC, &GPIO_InitStructure);
	
	ADC_CommonInitStructure.ADC_Mode = ADC_Mode_Independent;
	ADC_CommonInit(&ADC_CommonInitStructure);
	
	ADC_InitStructure.ADC_Resolution = ADC_Resolution_6b;
	ADC_InitStructure.ADC_ScanConvMode = DISABLE;
	ADC_InitStructure.ADC_ContinuousConvMode = DISABLE;
	ADC_InitStructure.ADC_ExternalTrigConvEdge = ADC_ExternalTrigConvEdge_None;
	ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;
	ADC_Init(ADC1, &ADC_InitStructure);
	ADC_Init(ADC2, &ADC_InitStructure);
	ADC_Init(ADC3, &ADC_InitStructure);
	
	ADC_RegularChannelConfig(ADC1, ADC_Channel_10, 1, ADC_SampleTime_3Cycles);
	ADC_RegularChannelConfig(ADC2, ADC_Channel_11, 1, ADC_SampleTime_3Cycles);
	ADC_RegularChannelConfig(ADC3, ADC_Channel_12, 1, ADC_SampleTime_3Cycles);
	
	ADC_Cmd(ADC1, ENABLE);
	ADC_Cmd(ADC2, ENABLE);
	ADC_Cmd(ADC3, ENABLE);
	
}//end ADC_Configuration
 
uint16_t adc_get_val(uint8_t Channel)
{
    switch(Channel)
    {
        case 10:
            ADC_SoftwareStartConv(ADC1);
            while(ADC_GetSoftwareStartConvStatus(ADC1) != RESET){ADC_Val = 0;}
            ADC_Val = ADC_GetConversionValue(ADC1);
            break;
        case 11:
            ADC_SoftwareStartConv(ADC2);
            while(ADC_GetSoftwareStartConvStatus(ADC2) != RESET){ADC_Val = 0;}
            ADC_Val = ADC_GetConversionValue(ADC2);
            break;
        case 12:
            ADC_SoftwareStartConv(ADC3);
            while(ADC_GetSoftwareStartConvStatus(ADC3) != RESET){ADC_Val = 0;}
            ADC_Val = ADC_GetConversionValue(ADC3);
            break;
        default:
            ADC_Val = 0;
            break;
    }
    return ADC_Val;
}


void main(void)
{
 	init_uart();
	init_adc();
	write_string_SCI(USART1, "\nInit\n");
	uint8_t d = 0;
	uint8_t s = 0;
	
	debug_delay();
	
	while(1)
	{
		d = adc_get_val(11);
		s = adc_get_val(12);
		
		write_value_SCI(USART1, d);
		write_SCI(USART1, ',');
		write_value_SCI(USART1, s);
		write_SCI(USART1, '\n');
		
		send_cmd(1, d);
		
		debug_delay();
		
		send_cmd(2, s);
			
		debug_delay();
	}
}