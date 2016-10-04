/*
   ADC.c
*/

#define assert_param(x)

#include "adc.h"

//Common Init DAC
void initCommon_ADC(uint32_t ADC_Mode,
                    uint32_t ADC_Prescaler,
                    uint32_t ADC_DMAAccessMode,
                    uint32_t ADC_TwoSamplingDelay)
{
   ADC_CommonInitTypeDef ADC_CommonInitStructure;

   ADC_CommonInitStructure.ADC_Mode = ADC_Mode;
   ADC_CommonInitStructure.ADC_Prescaler = ADC_Prescaler;
   ADC_CommonInitStructure.ADC_DMAAccessMode = ADC_DMAAccessMode;
   ADC_CommonInitStructure.ADC_TwoSamplingDelay = ADC_TwoSamplingDelay;

   ADC_CommonInit(&ADC_CommonInitStructure);
}

void init_ADC(uint32_t ADC_Resolution,
              FunctionalState ADC_ScanConvMode,
              FunctionalState ADC_ContinuousConvMode,
              uint32_t ADC_ExternalTrigConvEdge,
              uint32_t ADC_ExternalTrigConv,
              uint32_t ADC_DataAlign,
              uint32_t ADC_NbrOfConversion)
{
   ADC_InitTypeDef ADC_InitStructure;

   ADC_DeInit();

   ADC_InitStructure.ADC_Resolution = ADC_Resolution;
   ADC_InitStructure.ADC_ScanConvMode = ADC_ScanConvMode;
   ADC_InitStructure.ADC_ContinuousConvMode = ADC_ContinuousConvMode;
   ADC_InitStructure.ADC_ExternalTrigConvEdge = ADC_ExternalTrigConvEdge;
   ADC_InitStructure.ADC_ExternalTrigConv = ADC_ExternalTrigConv;
   ADC_InitStructure.ADC_DataAlign = ADC_DataAlign;
   ADC_InitStructure.ADC_NbrOfConversion = ADC_NbrOfConversion;

   ADC_Init(ADC1, &ADC_InitStructure);
}

uint16_t read_ADC(ADC_TypeDef* ADCx)
{
   ADC_SoftwareStartConv(ADC1);
   while(ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET);
   return ADC_GetConversionValue(ADC1);
}