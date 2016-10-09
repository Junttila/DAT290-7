//test.c - ska innehålla temporära testfunktioner
//(istället för att de läggs direkt i main.c)

#include "test.h"

//USART läs- och skrivfunktioner
void _outchar (char c) 
{
	*USART_DATA_REG = (unsigned short) c; 
	while ((*USART_SR_REG & 0x80) == 0); 
	if(c == '\n') 
	{
		_outchar('\r');
	} 	
}

char _tstchar(void) 
{ 
	if((*USART_SR_REG & 0x20) == 0) 
	{
		return 0; 
	} 
	
	return (char) *USART_DATA_REG; 
} 
char _inchar(void)
{
	while(!_tstchar());
	return (char) *USART_DATA_REG;
}

int atoi(char *str)
{
    int res = 0;
  
    for (int i = 0; str[i] != '\0'; ++i)
        res = res*10 + str[i] - '0';
		
    return res;
}

//----------------------------------------------
//Delay-funktioner

void delay250ns(void)
{
    *SysTickCtrl = 0;
    *SysTickLoad = (168/4)-1;
    *SysTickVal  = 0;
    *SysTickCtrl = 5;
    
    while((*SysTickCtrl & 0x10000) == 0);
    *SysTickCtrl = 0;
}

void delay_micro(unsigned us)
{
    int i;
    while(us--) {
        for(i=0; i<4;i++){
            delay250ns();
        }
    }
}

void delay_milli(unsigned ms)
{
    delay_micro(1000*ms);
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