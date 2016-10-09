#ifndef __TEST
#define __TEST


//USART läs- och skrivfunktioner
#define USART_DATA_REG	((unsigned short *) 0x40011004) 
#define USART_SR_REG	((unsigned short *) 0x40011000) 

void _outchar (char c);
char _tstchar(void);
char _inchar(void);
int atoi(char *str);

//Delay-funktioner
#define SysTickCtrl (unsigned int *) 0xE000E010
#define SysTickLoad (unsigned int *) 0xE000E014
#define SysTickVal  (unsigned int *) 0xE000E018

void delay250ns(void);
void delay_micro(unsigned us);
void delay_milli(unsigned ms);

#endif