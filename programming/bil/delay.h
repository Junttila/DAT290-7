#ifndef __DELAY_H
#define __DELAY_H

#include "stm32f4xx.h"
#include "system_stm32f4xx.h"

void Delay(uint32_t nTime);   
void TimingDelay_Decrement(void);
void initDelay(void);

#endif 
