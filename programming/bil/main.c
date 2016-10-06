//#include "stdint.h"
#include "stm32f4xx.h"
#include "system_stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx_usart.h"
//#include "stm32f4xx_flash.h"
#include "stm32f4xx_tim.h"
#include "USART.h"

TIM_OCInitTypeDef  TIM_OCInitStructure;
TIM_TimeBaseInitTypeDef TIM_TimeBaseStructure;

// Styrning
uint16_t CCR3_val = 142; //Neutralt = 142 [110,173]
// Motor
uint16_t CCR4_val = 142;

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
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB,ENABLE);
	
	//Sätt alternativ funktion på på PA0 och PA1
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource11,GPIO_AF_USART3);
	
	//Fyll i GPIO-strukturen
	GPIO_initStruct.GPIO_Pin = GPIO_Pin_11 | GPIO_Pin_10;
	GPIO_initStruct.GPIO_Mode = GPIO_Mode_AF;
	GPIO_initStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_initStruct.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_initStruct.GPIO_Speed = GPIO_Speed_100MHz;
	
	//Initiera GPIO port A
	GPIO_Init(GPIOB,&GPIO_initStruct);
	
	//Aktivera klockan till USART3
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3,ENABLE);
	
	//Fyll i U(S)ART-strukturen
	USART_InitStruct.USART_BaudRate = 9600; //38400 är default för bluetoothmodulen
	USART_InitStruct.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStruct.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
	USART_InitStruct.USART_Parity = USART_Parity_No;
	USART_InitStruct.USART_StopBits = USART_StopBits_2;
	USART_InitStruct.USART_WordLength = USART_WordLength_8b;
    
	
	//Initiera USART3
	USART_Init(USART3,&USART_InitStruct);
	USART_Cmd(USART3,ENABLE);
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
	
	uint16_t PrescalerValue = ((SystemCoreClock/2)/100000)-1;  //Prescaler = ((SystemCoreClock /2) / frekvens) - 1
		
	TIM_TimeBaseStructure.TIM_Period = 1388;
	TIM_TimeBaseStructure.TIM_Prescaler = PrescalerValue;
	TIM_TimeBaseStructure.TIM_ClockDivision = 0;
	TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
	
	TIM_TimeBaseInit(TIM2, &TIM_TimeBaseStructure);
	//TIM_PrescalerConfig(TIM2, PrescalerValue,TIM_PSCReloadMode_Immediate);
	
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

#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line)
{

}
#endif

void send_cmd(uint8_t cmd, uint8_t val)
{
	uint8_t msg = (cmd << 6) | (val & 0b00111111);
	USART_SendData(USART3, msg);
}

long int i = 0;
void debug_delay()
{
	for (i = 0; i < 10000000/100; i++)
	{
		
	}
}

void debug_delay_long(void)
{
    for(i = 0;i<100;i++)
    {
        debug_delay();
    }
}

void bt_config(void)
{
    while(1)
    {
        write_SCI(USART1, read_SCI(USART3));
        debug_delay();
    }
}

void main(void)
{
	init_uart();
    write_SCI(USART1,'i');
    init_pwm();
    write_SCI(USART1,'p');
    uint8_t t = 0;
    uint16_t offset = 110;
    //appInit();
    bt_config();
	
	double temp = 0;
    
	while(1)
    {
        t = read_SCI(USART3);
        if(t!=0)
        {
            switch(t>>6)
            {
                case 1:
                CCR4_val = (t & 0b00111111) + offset + 10;
                if(CCR4_val >= 151 && CCR4_val <= 159)
                {
                    CCR4_val = 152;
                }
                write_string_SCI(USART1,"d:");
                write_value_SCI(USART1,CCR4_val);
                break;
                case 2:
                CCR3_val = (t & 0b00111111) + offset;
                if(CCR3_val >= 129 && CCR3_val <= 149)
                {
                    CCR3_val = 149;
                    debug_delay_long();
                }
                write_string_SCI(USART1,"s:");
                write_value_SCI(USART1,CCR3_val);
                break;
                case 3:
                
                break;
                default:
                CCR3_val = 142;
                CCR4_val = 142;
            }
            //write_SCI(USART1,' ');
        }
        else
        {
            //write_SCI(USART1,'n');
        }
        TIM_OCInitStructure.TIM_Pulse = CCR4_val;
        TIM_OC4Init(TIM2, &TIM_OCInitStructure);
        TIM_OC4PreloadConfig(TIM2, ENABLE);
        TIM_OCInitStructure.TIM_Pulse = CCR3_val;
        TIM_OC3Init(TIM2, &TIM_OCInitStructure);
        TIM_OC3PreloadConfig(TIM2, ENABLE);
        debug_delay();
    }
}