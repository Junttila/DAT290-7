   1              		.syntax unified
   2              		.cpu cortex-m4
   3              		.eabi_attribute 27, 1
   4              		.eabi_attribute 28, 1
   5              		.fpu fpv4-sp-d16
   6              		.eabi_attribute 20, 1
   7              		.eabi_attribute 21, 1
   8              		.eabi_attribute 23, 3
   9              		.eabi_attribute 24, 1
  10              		.eabi_attribute 25, 1
  11              		.eabi_attribute 26, 1
  12              		.eabi_attribute 30, 6
  13              		.eabi_attribute 34, 1
  14              		.eabi_attribute 18, 4
  15              		.thumb
  16              		.file	"main.c"
  17              		.text
  18              	.Ltext0:
  19              		.cfi_sections	.debug_frame
  20              		.section	.start_section,"ax",%progbits
  21              		.align	2
  22              		.global	startup
  23              		.thumb
  24              		.thumb_func
  26              	startup:
  27              	.LFB123:
  28              		.file 1 "D:/Git/dat290-7/programming/kontroll/main.c"
   1:D:/Git/dat290-7/programming/kontroll\main.c **** //#include "stdint.h"
   2:D:/Git/dat290-7/programming/kontroll\main.c **** #include "stm32f4xx.h"
   3:D:/Git/dat290-7/programming/kontroll\main.c **** #include "system_stm32f4xx.h"
   4:D:/Git/dat290-7/programming/kontroll\main.c **** #include "stm32f4xx_rcc.h"
   5:D:/Git/dat290-7/programming/kontroll\main.c **** #include "stm32f4xx_gpio.h"
   6:D:/Git/dat290-7/programming/kontroll\main.c **** #include "stm32f4xx_usart.h"
   7:D:/Git/dat290-7/programming/kontroll\main.c **** //#include "stm32f4xx_flash.h"
   8:D:/Git/dat290-7/programming/kontroll\main.c **** #include "stm32f4xx_tim.h"
   9:D:/Git/dat290-7/programming/kontroll\main.c **** #include "USART.h"
  10:D:/Git/dat290-7/programming/kontroll\main.c **** #include "stm32f4xx_adc.h"
  11:D:/Git/dat290-7/programming/kontroll\main.c **** 
  12:D:/Git/dat290-7/programming/kontroll\main.c **** void startup(void) __attribute__((naked)) __attribute__((section(".start_section")));
  13:D:/Git/dat290-7/programming/kontroll\main.c **** void startup (void)
  14:D:/Git/dat290-7/programming/kontroll\main.c **** {
  29              		.loc 1 14 0
  30              		.cfi_startproc
  31              		@ Naked Function: prologue and epilogue provided by programmer.
  32              		@ args = 0, pretend = 0, frame = 0
  33              		@ frame_needed = 1, uses_anonymous_args = 0
  15:D:/Git/dat290-7/programming/kontroll\main.c **** __asm volatile(   
  34              		.loc 1 15 0
  35              	@ 15 "D:/Git/dat290-7/programming/kontroll/main.c" 1
  36 0000 4FF44040 		 mov r0, #0xc000
  37 0004 C2F20100 	 movt r0, #0x2001
  38 0008 8546     	 mov sp, r0
  39 000a FFF7FEFF 	 bl main
  40 000e FEE7     	.l1: b .l1
  41              	
  42              	@ 0 "" 2
  16:D:/Git/dat290-7/programming/kontroll\main.c ****     " mov r0, #0xc000\n"        /* set stack */
  17:D:/Git/dat290-7/programming/kontroll\main.c ****     " movt r0, #0x2001\n"
  18:D:/Git/dat290-7/programming/kontroll\main.c ****     " mov sp, r0\n"
  19:D:/Git/dat290-7/programming/kontroll\main.c ****     " bl main\n"                /* call main */   
  20:D:/Git/dat290-7/programming/kontroll\main.c ****     ".l1: b .l1\n"              /* never return */
  21:D:/Git/dat290-7/programming/kontroll\main.c ****     ) ;    
  22:D:/Git/dat290-7/programming/kontroll\main.c **** }
  43              		.loc 1 22 0
  44              		.thumb
  45              		.cfi_endproc
  46              	.LFE123:
  48              		.text
  49              		.align	2
  50              		.global	init_uart
  51              		.thumb
  52              		.thumb_func
  54              	init_uart:
  55              	.LFB124:
  23:D:/Git/dat290-7/programming/kontroll\main.c **** 
  24:D:/Git/dat290-7/programming/kontroll\main.c **** void init_uart()
  25:D:/Git/dat290-7/programming/kontroll\main.c **** {
  56              		.loc 1 25 0
  57              		.cfi_startproc
  58              		@ args = 0, pretend = 0, frame = 24
  59              		@ frame_needed = 1, uses_anonymous_args = 0
  60 0000 80B5     		push	{r7, lr}
  61              		.cfi_def_cfa_offset 8
  62              		.cfi_offset 7, -8
  63              		.cfi_offset 14, -4
  64 0002 86B0     		sub	sp, sp, #24
  65              		.cfi_def_cfa_offset 32
  66 0004 00AF     		add	r7, sp, #0
  67              		.cfi_def_cfa_register 7
  26:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_InitTypeDef GPIO_initStruct;
  27:D:/Git/dat290-7/programming/kontroll\main.c **** 	USART_InitTypeDef USART_InitStruct;
  28:D:/Git/dat290-7/programming/kontroll\main.c **** 	
  29:D:/Git/dat290-7/programming/kontroll\main.c **** 	//Aktivera klockan till GPIO port A
  30:D:/Git/dat290-7/programming/kontroll\main.c **** 	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA,ENABLE);
  68              		.loc 1 30 0
  69 0006 0120     		movs	r0, #1
  70 0008 0121     		movs	r1, #1
  71 000a FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
  31:D:/Git/dat290-7/programming/kontroll\main.c **** 	
  32:D:/Git/dat290-7/programming/kontroll\main.c **** 	//Sätt alternativ funktion på på PA0 och PA1
  33:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_PinAFConfig(GPIOA, GPIO_PinSource0,GPIO_AF_UART4);
  72              		.loc 1 33 0
  73 000e 1C48     		ldr	r0, .L3
  74 0010 0021     		movs	r1, #0
  75 0012 0822     		movs	r2, #8
  76 0014 FFF7FEFF 		bl	GPIO_PinAFConfig
  34:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_PinAFConfig(GPIOA, GPIO_PinSource1,GPIO_AF_UART4);
  77              		.loc 1 34 0
  78 0018 1948     		ldr	r0, .L3
  79 001a 0121     		movs	r1, #1
  80 001c 0822     		movs	r2, #8
  81 001e FFF7FEFF 		bl	GPIO_PinAFConfig
  35:D:/Git/dat290-7/programming/kontroll\main.c **** 	
  36:D:/Git/dat290-7/programming/kontroll\main.c **** 	//Fyll i GPIO-strukturen
  37:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_initStruct.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1;
  82              		.loc 1 37 0
  83 0022 0323     		movs	r3, #3
  84 0024 3B61     		str	r3, [r7, #16]
  38:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_initStruct.GPIO_Mode = GPIO_Mode_AF;
  85              		.loc 1 38 0
  86 0026 0223     		movs	r3, #2
  87 0028 3B75     		strb	r3, [r7, #20]
  39:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_initStruct.GPIO_OType = GPIO_OType_PP;
  88              		.loc 1 39 0
  89 002a 0023     		movs	r3, #0
  90 002c BB75     		strb	r3, [r7, #22]
  40:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_initStruct.GPIO_PuPd = GPIO_PuPd_UP;
  91              		.loc 1 40 0
  92 002e 0123     		movs	r3, #1
  93 0030 FB75     		strb	r3, [r7, #23]
  41:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_initStruct.GPIO_Speed = GPIO_Speed_100MHz;
  94              		.loc 1 41 0
  95 0032 0323     		movs	r3, #3
  96 0034 7B75     		strb	r3, [r7, #21]
  42:D:/Git/dat290-7/programming/kontroll\main.c **** 	
  43:D:/Git/dat290-7/programming/kontroll\main.c **** 	//Initiera GPIO port A
  44:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_Init(GPIOA,&GPIO_initStruct);
  97              		.loc 1 44 0
  98 0036 07F11003 		add	r3, r7, #16
  99 003a 1148     		ldr	r0, .L3
 100 003c 1946     		mov	r1, r3
 101 003e FFF7FEFF 		bl	GPIO_Init
  45:D:/Git/dat290-7/programming/kontroll\main.c **** 	
  46:D:/Git/dat290-7/programming/kontroll\main.c **** 	//Aktivera klockan till UART4
  47:D:/Git/dat290-7/programming/kontroll\main.c **** 	RCC_APB1PeriphClockCmd(RCC_APB1Periph_UART4,ENABLE);
 102              		.loc 1 47 0
 103 0042 4FF40020 		mov	r0, #524288
 104 0046 0121     		movs	r1, #1
 105 0048 FFF7FEFF 		bl	RCC_APB1PeriphClockCmd
  48:D:/Git/dat290-7/programming/kontroll\main.c **** 	
  49:D:/Git/dat290-7/programming/kontroll\main.c **** 	//Fyll i U(S)ART-strukturen
  50:D:/Git/dat290-7/programming/kontroll\main.c **** 	USART_InitStruct.USART_BaudRate = 38400*3; //38400 är default för bluetoothmodulen
 106              		.loc 1 50 0
 107 004c 4FF4E133 		mov	r3, #115200
 108 0050 3B60     		str	r3, [r7]
  51:D:/Git/dat290-7/programming/kontroll\main.c **** 	//Baudrate ska vara tre gånger högre än värdet man vill ha
  52:D:/Git/dat290-7/programming/kontroll\main.c **** 	USART_InitStruct.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
 109              		.loc 1 52 0
 110 0052 0023     		movs	r3, #0
 111 0054 BB81     		strh	r3, [r7, #12]	@ movhi
  53:D:/Git/dat290-7/programming/kontroll\main.c **** 	USART_InitStruct.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
 112              		.loc 1 53 0
 113 0056 0C23     		movs	r3, #12
 114 0058 7B81     		strh	r3, [r7, #10]	@ movhi
  54:D:/Git/dat290-7/programming/kontroll\main.c **** 	USART_InitStruct.USART_Parity = USART_Parity_No;
 115              		.loc 1 54 0
 116 005a 0023     		movs	r3, #0
 117 005c 3B81     		strh	r3, [r7, #8]	@ movhi
  55:D:/Git/dat290-7/programming/kontroll\main.c **** 	USART_InitStruct.USART_StopBits = USART_StopBits_1; //2
 118              		.loc 1 55 0
 119 005e 0023     		movs	r3, #0
 120 0060 FB80     		strh	r3, [r7, #6]	@ movhi
  56:D:/Git/dat290-7/programming/kontroll\main.c **** 	USART_InitStruct.USART_WordLength = USART_WordLength_8b;
 121              		.loc 1 56 0
 122 0062 0023     		movs	r3, #0
 123 0064 BB80     		strh	r3, [r7, #4]	@ movhi
  57:D:/Git/dat290-7/programming/kontroll\main.c **** 	
  58:D:/Git/dat290-7/programming/kontroll\main.c **** 	//Initiera UART4
  59:D:/Git/dat290-7/programming/kontroll\main.c **** 	USART_Init(UART4,&USART_InitStruct);
 124              		.loc 1 59 0
 125 0066 3B46     		mov	r3, r7
 126 0068 0648     		ldr	r0, .L3+4
 127 006a 1946     		mov	r1, r3
 128 006c FFF7FEFF 		bl	USART_Init
  60:D:/Git/dat290-7/programming/kontroll\main.c **** 	USART_Cmd(UART4,ENABLE);
 129              		.loc 1 60 0
 130 0070 0448     		ldr	r0, .L3+4
 131 0072 0121     		movs	r1, #1
 132 0074 FFF7FEFF 		bl	USART_Cmd
  61:D:/Git/dat290-7/programming/kontroll\main.c **** }
 133              		.loc 1 61 0
 134 0078 1837     		adds	r7, r7, #24
 135              		.cfi_def_cfa_offset 8
 136 007a BD46     		mov	sp, r7
 137              		.cfi_def_cfa_register 13
 138              		@ sp needed
 139 007c 80BD     		pop	{r7, pc}
 140              	.L4:
 141 007e 00BF     		.align	2
 142              	.L3:
 143 0080 00000240 		.word	1073872896
 144 0084 004C0040 		.word	1073761280
 145              		.cfi_endproc
 146              	.LFE124:
 148              		.align	2
 149              		.global	assert_failed
 150              		.thumb
 151              		.thumb_func
 153              	assert_failed:
 154              	.LFB125:
  62:D:/Git/dat290-7/programming/kontroll\main.c **** 
  63:D:/Git/dat290-7/programming/kontroll\main.c **** #ifdef USE_FULL_ASSERT
  64:D:/Git/dat290-7/programming/kontroll\main.c **** void assert_failed(uint8_t* file, uint32_t line)
  65:D:/Git/dat290-7/programming/kontroll\main.c **** {
 155              		.loc 1 65 0
 156              		.cfi_startproc
 157              		@ args = 0, pretend = 0, frame = 8
 158              		@ frame_needed = 1, uses_anonymous_args = 0
 159              		@ link register save eliminated.
 160 0088 80B4     		push	{r7}
 161              		.cfi_def_cfa_offset 4
 162              		.cfi_offset 7, -4
 163 008a 83B0     		sub	sp, sp, #12
 164              		.cfi_def_cfa_offset 16
 165 008c 00AF     		add	r7, sp, #0
 166              		.cfi_def_cfa_register 7
 167 008e 7860     		str	r0, [r7, #4]
 168 0090 3960     		str	r1, [r7]
  66:D:/Git/dat290-7/programming/kontroll\main.c **** 
  67:D:/Git/dat290-7/programming/kontroll\main.c **** }
 169              		.loc 1 67 0
 170 0092 0C37     		adds	r7, r7, #12
 171              		.cfi_def_cfa_offset 4
 172 0094 BD46     		mov	sp, r7
 173              		.cfi_def_cfa_register 13
 174              		@ sp needed
 175 0096 5DF8047B 		ldr	r7, [sp], #4
 176              		.cfi_restore 7
 177              		.cfi_def_cfa_offset 0
 178 009a 7047     		bx	lr
 179              		.cfi_endproc
 180              	.LFE125:
 182              		.align	2
 183              		.global	send_cmd
 184              		.thumb
 185              		.thumb_func
 187              	send_cmd:
 188              	.LFB126:
  68:D:/Git/dat290-7/programming/kontroll\main.c **** #endif
  69:D:/Git/dat290-7/programming/kontroll\main.c **** 
  70:D:/Git/dat290-7/programming/kontroll\main.c **** void send_cmd(uint8_t cmd, uint8_t val)
  71:D:/Git/dat290-7/programming/kontroll\main.c **** {
 189              		.loc 1 71 0
 190              		.cfi_startproc
 191              		@ args = 0, pretend = 0, frame = 16
 192              		@ frame_needed = 1, uses_anonymous_args = 0
 193 009c 80B5     		push	{r7, lr}
 194              		.cfi_def_cfa_offset 8
 195              		.cfi_offset 7, -8
 196              		.cfi_offset 14, -4
 197 009e 84B0     		sub	sp, sp, #16
 198              		.cfi_def_cfa_offset 24
 199 00a0 00AF     		add	r7, sp, #0
 200              		.cfi_def_cfa_register 7
 201 00a2 0346     		mov	r3, r0
 202 00a4 0A46     		mov	r2, r1
 203 00a6 FB71     		strb	r3, [r7, #7]
 204 00a8 1346     		mov	r3, r2
 205 00aa BB71     		strb	r3, [r7, #6]
  72:D:/Git/dat290-7/programming/kontroll\main.c **** 	uint8_t msg = (cmd << 6) | (val & 0b00111111);
 206              		.loc 1 72 0
 207 00ac FB79     		ldrb	r3, [r7, #7]	@ zero_extendqisi2
 208 00ae 9B01     		lsls	r3, r3, #6
 209 00b0 DAB2     		uxtb	r2, r3
 210 00b2 BB79     		ldrb	r3, [r7, #6]	@ zero_extendqisi2
 211 00b4 03F03F03 		and	r3, r3, #63
 212 00b8 DBB2     		uxtb	r3, r3
 213 00ba 1343     		orrs	r3, r3, r2
 214 00bc DBB2     		uxtb	r3, r3
 215 00be FB73     		strb	r3, [r7, #15]
  73:D:/Git/dat290-7/programming/kontroll\main.c **** 	USART_SendData(UART4, msg);
 216              		.loc 1 73 0
 217 00c0 FB7B     		ldrb	r3, [r7, #15]	@ zero_extendqisi2
 218 00c2 9BB2     		uxth	r3, r3
 219 00c4 0348     		ldr	r0, .L7
 220 00c6 1946     		mov	r1, r3
 221 00c8 FFF7FEFF 		bl	USART_SendData
  74:D:/Git/dat290-7/programming/kontroll\main.c **** }
 222              		.loc 1 74 0
 223 00cc 1037     		adds	r7, r7, #16
 224              		.cfi_def_cfa_offset 8
 225 00ce BD46     		mov	sp, r7
 226              		.cfi_def_cfa_register 13
 227              		@ sp needed
 228 00d0 80BD     		pop	{r7, pc}
 229              	.L8:
 230 00d2 00BF     		.align	2
 231              	.L7:
 232 00d4 004C0040 		.word	1073761280
 233              		.cfi_endproc
 234              	.LFE126:
 236              		.align	2
 237              		.global	debug_delay
 238              		.thumb
 239              		.thumb_func
 241              	debug_delay:
 242              	.LFB127:
  75:D:/Git/dat290-7/programming/kontroll\main.c **** 
  76:D:/Git/dat290-7/programming/kontroll\main.c **** void debug_delay()
  77:D:/Git/dat290-7/programming/kontroll\main.c **** {
 243              		.loc 1 77 0
 244              		.cfi_startproc
 245              		@ args = 0, pretend = 0, frame = 8
 246              		@ frame_needed = 1, uses_anonymous_args = 0
 247              		@ link register save eliminated.
 248 00d8 80B4     		push	{r7}
 249              		.cfi_def_cfa_offset 4
 250              		.cfi_offset 7, -4
 251 00da 83B0     		sub	sp, sp, #12
 252              		.cfi_def_cfa_offset 16
 253 00dc 00AF     		add	r7, sp, #0
 254              		.cfi_def_cfa_register 7
  78:D:/Git/dat290-7/programming/kontroll\main.c **** 	long int i = 0;
 255              		.loc 1 78 0
 256 00de 0023     		movs	r3, #0
 257 00e0 7B60     		str	r3, [r7, #4]
  79:D:/Git/dat290-7/programming/kontroll\main.c **** 	for (i = 0; i < 10000000/100; i++)
 258              		.loc 1 79 0
 259 00e2 0023     		movs	r3, #0
 260 00e4 7B60     		str	r3, [r7, #4]
 261 00e6 02E0     		b	.L10
 262              	.L11:
 263              		.loc 1 79 0 is_stmt 0 discriminator 3
 264 00e8 7B68     		ldr	r3, [r7, #4]
 265 00ea 0133     		adds	r3, r3, #1
 266 00ec 7B60     		str	r3, [r7, #4]
 267              	.L10:
 268              		.loc 1 79 0 discriminator 1
 269 00ee 7B68     		ldr	r3, [r7, #4]
 270 00f0 034A     		ldr	r2, .L12
 271 00f2 9342     		cmp	r3, r2
 272 00f4 F8DD     		ble	.L11
  80:D:/Git/dat290-7/programming/kontroll\main.c **** 	{
  81:D:/Git/dat290-7/programming/kontroll\main.c **** 		
  82:D:/Git/dat290-7/programming/kontroll\main.c **** 	}
  83:D:/Git/dat290-7/programming/kontroll\main.c **** }
 273              		.loc 1 83 0 is_stmt 1
 274 00f6 0C37     		adds	r7, r7, #12
 275              		.cfi_def_cfa_offset 4
 276 00f8 BD46     		mov	sp, r7
 277              		.cfi_def_cfa_register 13
 278              		@ sp needed
 279 00fa 5DF8047B 		ldr	r7, [sp], #4
 280              		.cfi_restore 7
 281              		.cfi_def_cfa_offset 0
 282 00fe 7047     		bx	lr
 283              	.L13:
 284              		.align	2
 285              	.L12:
 286 0100 9F860100 		.word	99999
 287              		.cfi_endproc
 288              	.LFE127:
 290              		.comm	ADC_Val,2,2
 291              		.align	2
 292              		.global	init_go
 293              		.thumb
 294              		.thumb_func
 296              	init_go:
 297              	.LFB128:
  84:D:/Git/dat290-7/programming/kontroll\main.c **** 
  85:D:/Git/dat290-7/programming/kontroll\main.c **** uint16_t ADC_Val; //Stores the calculated ADC value
  86:D:/Git/dat290-7/programming/kontroll\main.c ****  
  87:D:/Git/dat290-7/programming/kontroll\main.c **** void init_go()
  88:D:/Git/dat290-7/programming/kontroll\main.c **** {
 298              		.loc 1 88 0
 299              		.cfi_startproc
 300              		@ args = 0, pretend = 0, frame = 8
 301              		@ frame_needed = 1, uses_anonymous_args = 0
 302 0104 80B5     		push	{r7, lr}
 303              		.cfi_def_cfa_offset 8
 304              		.cfi_offset 7, -8
 305              		.cfi_offset 14, -4
 306 0106 82B0     		sub	sp, sp, #8
 307              		.cfi_def_cfa_offset 16
 308 0108 00AF     		add	r7, sp, #0
 309              		.cfi_def_cfa_register 7
  89:D:/Git/dat290-7/programming/kontroll\main.c **** 	//RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);  
  90:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_InitTypeDef GPIO_InitStructure;
  91:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11;
 310              		.loc 1 91 0
 311 010a 4FF40063 		mov	r3, #2048
 312 010e 3B60     		str	r3, [r7]
  92:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
 313              		.loc 1 92 0
 314 0110 0023     		movs	r3, #0
 315 0112 3B71     		strb	r3, [r7, #4]
  93:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
 316              		.loc 1 93 0
 317 0114 0323     		movs	r3, #3
 318 0116 7B71     		strb	r3, [r7, #5]
  94:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
 319              		.loc 1 94 0
 320 0118 0023     		movs	r3, #0
 321 011a BB71     		strb	r3, [r7, #6]
  95:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_DOWN;
 322              		.loc 1 95 0
 323 011c 0223     		movs	r3, #2
 324 011e FB71     		strb	r3, [r7, #7]
  96:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_Init(GPIOC, &GPIO_InitStructure);
 325              		.loc 1 96 0
 326 0120 3B46     		mov	r3, r7
 327 0122 0348     		ldr	r0, .L15
 328 0124 1946     		mov	r1, r3
 329 0126 FFF7FEFF 		bl	GPIO_Init
  97:D:/Git/dat290-7/programming/kontroll\main.c **** }
 330              		.loc 1 97 0
 331 012a 0837     		adds	r7, r7, #8
 332              		.cfi_def_cfa_offset 8
 333 012c BD46     		mov	sp, r7
 334              		.cfi_def_cfa_register 13
 335              		@ sp needed
 336 012e 80BD     		pop	{r7, pc}
 337              	.L16:
 338              		.align	2
 339              	.L15:
 340 0130 00080240 		.word	1073874944
 341              		.cfi_endproc
 342              	.LFE128:
 344              		.align	2
 345              		.global	init_adc
 346              		.thumb
 347              		.thumb_func
 349              	init_adc:
 350              	.LFB129:
  98:D:/Git/dat290-7/programming/kontroll\main.c ****  
  99:D:/Git/dat290-7/programming/kontroll\main.c **** void init_adc(void)
 100:D:/Git/dat290-7/programming/kontroll\main.c **** {
 351              		.loc 1 100 0
 352              		.cfi_startproc
 353              		@ args = 0, pretend = 0, frame = 48
 354              		@ frame_needed = 1, uses_anonymous_args = 0
 355 0134 80B5     		push	{r7, lr}
 356              		.cfi_def_cfa_offset 8
 357              		.cfi_offset 7, -8
 358              		.cfi_offset 14, -4
 359 0136 8CB0     		sub	sp, sp, #48
 360              		.cfi_def_cfa_offset 56
 361 0138 00AF     		add	r7, sp, #0
 362              		.cfi_def_cfa_register 7
 101:D:/Git/dat290-7/programming/kontroll\main.c **** 
 102:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_InitTypeDef       ADC_InitStructure;
 103:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_CommonInitTypeDef ADC_CommonInitStructure;
 104:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_InitTypeDef      GPIO_InitStructure;
 105:D:/Git/dat290-7/programming/kontroll\main.c **** 
 106:D:/Git/dat290-7/programming/kontroll\main.c **** 	RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1 | RCC_APB2Periph_ADC2 | RCC_APB2Periph_ADC3 , ENABLE);
 363              		.loc 1 106 0
 364 013a 4FF4E060 		mov	r0, #1792
 365 013e 0121     		movs	r1, #1
 366 0140 FFF7FEFF 		bl	RCC_APB2PeriphClockCmd
 107:D:/Git/dat290-7/programming/kontroll\main.c **** 	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);  
 367              		.loc 1 107 0
 368 0144 0420     		movs	r0, #4
 369 0146 0121     		movs	r1, #1
 370 0148 FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
 108:D:/Git/dat290-7/programming/kontroll\main.c **** 	
 109:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2;
 371              		.loc 1 109 0
 372 014c 0723     		movs	r3, #7
 373 014e 3B60     		str	r3, [r7]
 110:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AN;
 374              		.loc 1 110 0
 375 0150 0323     		movs	r3, #3
 376 0152 3B71     		strb	r3, [r7, #4]
 111:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL ;
 377              		.loc 1 111 0
 378 0154 0023     		movs	r3, #0
 379 0156 FB71     		strb	r3, [r7, #7]
 112:D:/Git/dat290-7/programming/kontroll\main.c **** 	GPIO_Init(GPIOC, &GPIO_InitStructure);
 380              		.loc 1 112 0
 381 0158 3B46     		mov	r3, r7
 382 015a 2448     		ldr	r0, .L18
 383 015c 1946     		mov	r1, r3
 384 015e FFF7FEFF 		bl	GPIO_Init
 113:D:/Git/dat290-7/programming/kontroll\main.c **** 	
 114:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_CommonInitStructure.ADC_Mode = ADC_Mode_Independent;
 385              		.loc 1 114 0
 386 0162 0023     		movs	r3, #0
 387 0164 BB60     		str	r3, [r7, #8]
 115:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_CommonInit(&ADC_CommonInitStructure);
 388              		.loc 1 115 0
 389 0166 07F10803 		add	r3, r7, #8
 390 016a 1846     		mov	r0, r3
 391 016c FFF7FEFF 		bl	ADC_CommonInit
 116:D:/Git/dat290-7/programming/kontroll\main.c **** 	
 117:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_InitStructure.ADC_Resolution = ADC_Resolution_6b;
 392              		.loc 1 117 0
 393 0170 4FF04073 		mov	r3, #50331648
 394 0174 BB61     		str	r3, [r7, #24]
 118:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_InitStructure.ADC_ScanConvMode = DISABLE;
 395              		.loc 1 118 0
 396 0176 0023     		movs	r3, #0
 397 0178 3B77     		strb	r3, [r7, #28]
 119:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_InitStructure.ADC_ContinuousConvMode = DISABLE;
 398              		.loc 1 119 0
 399 017a 0023     		movs	r3, #0
 400 017c 7B77     		strb	r3, [r7, #29]
 120:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_InitStructure.ADC_ExternalTrigConvEdge = ADC_ExternalTrigConvEdge_None;
 401              		.loc 1 120 0
 402 017e 0023     		movs	r3, #0
 403 0180 3B62     		str	r3, [r7, #32]
 121:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;
 404              		.loc 1 121 0
 405 0182 0023     		movs	r3, #0
 406 0184 BB62     		str	r3, [r7, #40]
 122:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_Init(ADC1, &ADC_InitStructure);
 407              		.loc 1 122 0
 408 0186 07F11803 		add	r3, r7, #24
 409 018a 1948     		ldr	r0, .L18+4
 410 018c 1946     		mov	r1, r3
 411 018e FFF7FEFF 		bl	ADC_Init
 123:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_Init(ADC2, &ADC_InitStructure);
 412              		.loc 1 123 0
 413 0192 07F11803 		add	r3, r7, #24
 414 0196 1748     		ldr	r0, .L18+8
 415 0198 1946     		mov	r1, r3
 416 019a FFF7FEFF 		bl	ADC_Init
 124:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_Init(ADC3, &ADC_InitStructure);
 417              		.loc 1 124 0
 418 019e 07F11803 		add	r3, r7, #24
 419 01a2 1548     		ldr	r0, .L18+12
 420 01a4 1946     		mov	r1, r3
 421 01a6 FFF7FEFF 		bl	ADC_Init
 125:D:/Git/dat290-7/programming/kontroll\main.c **** 	
 126:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_RegularChannelConfig(ADC1, ADC_Channel_10, 1, ADC_SampleTime_3Cycles);
 422              		.loc 1 126 0
 423 01aa 1148     		ldr	r0, .L18+4
 424 01ac 0A21     		movs	r1, #10
 425 01ae 0122     		movs	r2, #1
 426 01b0 0023     		movs	r3, #0
 427 01b2 FFF7FEFF 		bl	ADC_RegularChannelConfig
 127:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_RegularChannelConfig(ADC2, ADC_Channel_11, 1, ADC_SampleTime_3Cycles);
 428              		.loc 1 127 0
 429 01b6 0F48     		ldr	r0, .L18+8
 430 01b8 0B21     		movs	r1, #11
 431 01ba 0122     		movs	r2, #1
 432 01bc 0023     		movs	r3, #0
 433 01be FFF7FEFF 		bl	ADC_RegularChannelConfig
 128:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_RegularChannelConfig(ADC3, ADC_Channel_12, 1, ADC_SampleTime_3Cycles);
 434              		.loc 1 128 0
 435 01c2 0D48     		ldr	r0, .L18+12
 436 01c4 0C21     		movs	r1, #12
 437 01c6 0122     		movs	r2, #1
 438 01c8 0023     		movs	r3, #0
 439 01ca FFF7FEFF 		bl	ADC_RegularChannelConfig
 129:D:/Git/dat290-7/programming/kontroll\main.c **** 	
 130:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_Cmd(ADC1, ENABLE);
 440              		.loc 1 130 0
 441 01ce 0848     		ldr	r0, .L18+4
 442 01d0 0121     		movs	r1, #1
 443 01d2 FFF7FEFF 		bl	ADC_Cmd
 131:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_Cmd(ADC2, ENABLE);
 444              		.loc 1 131 0
 445 01d6 0748     		ldr	r0, .L18+8
 446 01d8 0121     		movs	r1, #1
 447 01da FFF7FEFF 		bl	ADC_Cmd
 132:D:/Git/dat290-7/programming/kontroll\main.c **** 	ADC_Cmd(ADC3, ENABLE);
 448              		.loc 1 132 0
 449 01de 0648     		ldr	r0, .L18+12
 450 01e0 0121     		movs	r1, #1
 451 01e2 FFF7FEFF 		bl	ADC_Cmd
 133:D:/Git/dat290-7/programming/kontroll\main.c **** 	
 134:D:/Git/dat290-7/programming/kontroll\main.c **** }//end ADC_Configuration
 452              		.loc 1 134 0
 453 01e6 3037     		adds	r7, r7, #48
 454              		.cfi_def_cfa_offset 8
 455 01e8 BD46     		mov	sp, r7
 456              		.cfi_def_cfa_register 13
 457              		@ sp needed
 458 01ea 80BD     		pop	{r7, pc}
 459              	.L19:
 460              		.align	2
 461              	.L18:
 462 01ec 00080240 		.word	1073874944
 463 01f0 00200140 		.word	1073815552
 464 01f4 00210140 		.word	1073815808
 465 01f8 00220140 		.word	1073816064
 466              		.cfi_endproc
 467              	.LFE129:
 469              		.align	2
 470              		.global	adc_get_val
 471              		.thumb
 472              		.thumb_func
 474              	adc_get_val:
 475              	.LFB130:
 135:D:/Git/dat290-7/programming/kontroll\main.c ****  
 136:D:/Git/dat290-7/programming/kontroll\main.c **** uint16_t adc_get_val(uint8_t Channel)
 137:D:/Git/dat290-7/programming/kontroll\main.c **** {
 476              		.loc 1 137 0
 477              		.cfi_startproc
 478              		@ args = 0, pretend = 0, frame = 8
 479              		@ frame_needed = 1, uses_anonymous_args = 0
 480 01fc 80B5     		push	{r7, lr}
 481              		.cfi_def_cfa_offset 8
 482              		.cfi_offset 7, -8
 483              		.cfi_offset 14, -4
 484 01fe 82B0     		sub	sp, sp, #8
 485              		.cfi_def_cfa_offset 16
 486 0200 00AF     		add	r7, sp, #0
 487              		.cfi_def_cfa_register 7
 488 0202 0346     		mov	r3, r0
 489 0204 FB71     		strb	r3, [r7, #7]
 138:D:/Git/dat290-7/programming/kontroll\main.c ****     switch(Channel)
 490              		.loc 1 138 0
 491 0206 FB79     		ldrb	r3, [r7, #7]	@ zero_extendqisi2
 492 0208 0B2B     		cmp	r3, #11
 493 020a 18D0     		beq	.L22
 494 020c 0C2B     		cmp	r3, #12
 495 020e 2BD0     		beq	.L23
 496 0210 0A2B     		cmp	r3, #10
 497 0212 3ED1     		bne	.L33
 139:D:/Git/dat290-7/programming/kontroll\main.c ****     {
 140:D:/Git/dat290-7/programming/kontroll\main.c ****         case 10:
 141:D:/Git/dat290-7/programming/kontroll\main.c ****             ADC_SoftwareStartConv(ADC1);
 498              		.loc 1 141 0
 499 0214 2448     		ldr	r0, .L34
 500 0216 FFF7FEFF 		bl	ADC_SoftwareStartConv
 142:D:/Git/dat290-7/programming/kontroll\main.c ****             while(ADC_GetSoftwareStartConvStatus(ADC1) != RESET){ADC_Val = 0;}
 501              		.loc 1 142 0
 502 021a 02E0     		b	.L25
 503              	.L26:
 504              		.loc 1 142 0 is_stmt 0 discriminator 2
 505 021c 234B     		ldr	r3, .L34+4
 506 021e 0022     		movs	r2, #0
 507 0220 1A80     		strh	r2, [r3]	@ movhi
 508              	.L25:
 509              		.loc 1 142 0 discriminator 1
 510 0222 2148     		ldr	r0, .L34
 511 0224 FFF7FEFF 		bl	ADC_GetSoftwareStartConvStatus
 512 0228 0346     		mov	r3, r0
 513 022a 002B     		cmp	r3, #0
 514 022c F6D1     		bne	.L26
 143:D:/Git/dat290-7/programming/kontroll\main.c ****             ADC_Val = ADC_GetConversionValue(ADC1);
 515              		.loc 1 143 0 is_stmt 1
 516 022e 1E48     		ldr	r0, .L34
 517 0230 FFF7FEFF 		bl	ADC_GetConversionValue
 518 0234 0346     		mov	r3, r0
 519 0236 1A46     		mov	r2, r3
 520 0238 1C4B     		ldr	r3, .L34+4
 521 023a 1A80     		strh	r2, [r3]	@ movhi
 144:D:/Git/dat290-7/programming/kontroll\main.c ****             break;
 522              		.loc 1 144 0
 523 023c 2DE0     		b	.L27
 524              	.L22:
 145:D:/Git/dat290-7/programming/kontroll\main.c ****         case 11:
 146:D:/Git/dat290-7/programming/kontroll\main.c ****             ADC_SoftwareStartConv(ADC2);
 525              		.loc 1 146 0
 526 023e 1C48     		ldr	r0, .L34+8
 527 0240 FFF7FEFF 		bl	ADC_SoftwareStartConv
 147:D:/Git/dat290-7/programming/kontroll\main.c ****             while(ADC_GetSoftwareStartConvStatus(ADC2) != RESET){ADC_Val = 0;}
 528              		.loc 1 147 0
 529 0244 02E0     		b	.L28
 530              	.L29:
 531              		.loc 1 147 0 is_stmt 0 discriminator 2
 532 0246 194B     		ldr	r3, .L34+4
 533 0248 0022     		movs	r2, #0
 534 024a 1A80     		strh	r2, [r3]	@ movhi
 535              	.L28:
 536              		.loc 1 147 0 discriminator 1
 537 024c 1848     		ldr	r0, .L34+8
 538 024e FFF7FEFF 		bl	ADC_GetSoftwareStartConvStatus
 539 0252 0346     		mov	r3, r0
 540 0254 002B     		cmp	r3, #0
 541 0256 F6D1     		bne	.L29
 148:D:/Git/dat290-7/programming/kontroll\main.c ****             ADC_Val = ADC_GetConversionValue(ADC2);
 542              		.loc 1 148 0 is_stmt 1
 543 0258 1548     		ldr	r0, .L34+8
 544 025a FFF7FEFF 		bl	ADC_GetConversionValue
 545 025e 0346     		mov	r3, r0
 546 0260 1A46     		mov	r2, r3
 547 0262 124B     		ldr	r3, .L34+4
 548 0264 1A80     		strh	r2, [r3]	@ movhi
 149:D:/Git/dat290-7/programming/kontroll\main.c ****             break;
 549              		.loc 1 149 0
 550 0266 18E0     		b	.L27
 551              	.L23:
 150:D:/Git/dat290-7/programming/kontroll\main.c ****         case 12:
 151:D:/Git/dat290-7/programming/kontroll\main.c ****             ADC_SoftwareStartConv(ADC3);
 552              		.loc 1 151 0
 553 0268 1248     		ldr	r0, .L34+12
 554 026a FFF7FEFF 		bl	ADC_SoftwareStartConv
 152:D:/Git/dat290-7/programming/kontroll\main.c ****             while(ADC_GetSoftwareStartConvStatus(ADC3) != RESET){ADC_Val = 0;}
 555              		.loc 1 152 0
 556 026e 02E0     		b	.L30
 557              	.L31:
 558              		.loc 1 152 0 is_stmt 0 discriminator 2
 559 0270 0E4B     		ldr	r3, .L34+4
 560 0272 0022     		movs	r2, #0
 561 0274 1A80     		strh	r2, [r3]	@ movhi
 562              	.L30:
 563              		.loc 1 152 0 discriminator 1
 564 0276 0F48     		ldr	r0, .L34+12
 565 0278 FFF7FEFF 		bl	ADC_GetSoftwareStartConvStatus
 566 027c 0346     		mov	r3, r0
 567 027e 002B     		cmp	r3, #0
 568 0280 F6D1     		bne	.L31
 153:D:/Git/dat290-7/programming/kontroll\main.c ****             ADC_Val = ADC_GetConversionValue(ADC3);
 569              		.loc 1 153 0 is_stmt 1
 570 0282 0C48     		ldr	r0, .L34+12
 571 0284 FFF7FEFF 		bl	ADC_GetConversionValue
 572 0288 0346     		mov	r3, r0
 573 028a 1A46     		mov	r2, r3
 574 028c 074B     		ldr	r3, .L34+4
 575 028e 1A80     		strh	r2, [r3]	@ movhi
 154:D:/Git/dat290-7/programming/kontroll\main.c ****             break;
 576              		.loc 1 154 0
 577 0290 03E0     		b	.L27
 578              	.L33:
 155:D:/Git/dat290-7/programming/kontroll\main.c ****         default:
 156:D:/Git/dat290-7/programming/kontroll\main.c ****             ADC_Val = 0;
 579              		.loc 1 156 0
 580 0292 064B     		ldr	r3, .L34+4
 581 0294 0022     		movs	r2, #0
 582 0296 1A80     		strh	r2, [r3]	@ movhi
 157:D:/Git/dat290-7/programming/kontroll\main.c ****             break;
 583              		.loc 1 157 0
 584 0298 00BF     		nop
 585              	.L27:
 158:D:/Git/dat290-7/programming/kontroll\main.c ****     }
 159:D:/Git/dat290-7/programming/kontroll\main.c ****     return ADC_Val;
 586              		.loc 1 159 0
 587 029a 044B     		ldr	r3, .L34+4
 588 029c 1B88     		ldrh	r3, [r3]
 160:D:/Git/dat290-7/programming/kontroll\main.c **** }
 589              		.loc 1 160 0
 590 029e 1846     		mov	r0, r3
 591 02a0 0837     		adds	r7, r7, #8
 592              		.cfi_def_cfa_offset 8
 593 02a2 BD46     		mov	sp, r7
 594              		.cfi_def_cfa_register 13
 595              		@ sp needed
 596 02a4 80BD     		pop	{r7, pc}
 597              	.L35:
 598 02a6 00BF     		.align	2
 599              	.L34:
 600 02a8 00200140 		.word	1073815552
 601 02ac 00000000 		.word	ADC_Val
 602 02b0 00210140 		.word	1073815808
 603 02b4 00220140 		.word	1073816064
 604              		.cfi_endproc
 605              	.LFE130:
 607              		.section	.rodata
 608              		.align	2
 609              	.LC0:
 610 0000 42542063 		.ascii	"BT config\012\000"
 610      6F6E6669 
 610      670A00
 611 000b 00       		.align	2
 612              	.LC1:
 613 000c 41540D0A 		.ascii	"AT\015\012\000"
 613      00
 614              		.text
 615              		.align	2
 616              		.global	bt_config
 617              		.thumb
 618              		.thumb_func
 620              	bt_config:
 621              	.LFB131:
 161:D:/Git/dat290-7/programming/kontroll\main.c **** 
 162:D:/Git/dat290-7/programming/kontroll\main.c **** 
 163:D:/Git/dat290-7/programming/kontroll\main.c **** 
 164:D:/Git/dat290-7/programming/kontroll\main.c **** void bt_config()
 165:D:/Git/dat290-7/programming/kontroll\main.c **** {
 622              		.loc 1 165 0
 623              		.cfi_startproc
 624              		@ args = 0, pretend = 0, frame = 8
 625              		@ frame_needed = 1, uses_anonymous_args = 0
 626 02b8 80B5     		push	{r7, lr}
 627              		.cfi_def_cfa_offset 8
 628              		.cfi_offset 7, -8
 629              		.cfi_offset 14, -4
 630 02ba 82B0     		sub	sp, sp, #8
 631              		.cfi_def_cfa_offset 16
 632 02bc 00AF     		add	r7, sp, #0
 633              		.cfi_def_cfa_register 7
 166:D:/Git/dat290-7/programming/kontroll\main.c **** 	uint16_t in = 0;
 634              		.loc 1 166 0
 635 02be 0023     		movs	r3, #0
 636 02c0 FB80     		strh	r3, [r7, #6]	@ movhi
 167:D:/Git/dat290-7/programming/kontroll\main.c **** 	write_string_SCI(USART1, "BT config\n");
 637              		.loc 1 167 0
 638 02c2 1A48     		ldr	r0, .L41
 639 02c4 1A49     		ldr	r1, .L41+4
 640 02c6 FFF7FEFF 		bl	write_string_SCI
 641              	.L40:
 168:D:/Git/dat290-7/programming/kontroll\main.c **** 	while(1)
 169:D:/Git/dat290-7/programming/kontroll\main.c **** 	{
 170:D:/Git/dat290-7/programming/kontroll\main.c **** 		in = read_SCI(USART1);
 642              		.loc 1 170 0
 643 02ca 1848     		ldr	r0, .L41
 644 02cc FFF7FEFF 		bl	read_SCI
 645 02d0 0346     		mov	r3, r0
 646 02d2 FB80     		strh	r3, [r7, #6]	@ movhi
 171:D:/Git/dat290-7/programming/kontroll\main.c **** 		if (in == '<')
 647              		.loc 1 171 0
 648 02d4 FB88     		ldrh	r3, [r7, #6]
 649 02d6 3C2B     		cmp	r3, #60
 650 02d8 10D1     		bne	.L37
 172:D:/Git/dat290-7/programming/kontroll\main.c **** 		{
 173:D:/Git/dat290-7/programming/kontroll\main.c **** 			//write_string_SCI(UART4, "AT+CMODE=0\r\n");
 174:D:/Git/dat290-7/programming/kontroll\main.c **** 			write_SCI(UART4, '\r');
 651              		.loc 1 174 0
 652 02da 1648     		ldr	r0, .L41+8
 653 02dc 0D21     		movs	r1, #13
 654 02de FFF7FEFF 		bl	write_SCI
 175:D:/Git/dat290-7/programming/kontroll\main.c **** 			//debug_delay();
 176:D:/Git/dat290-7/programming/kontroll\main.c **** 			write_SCI(UART4, '\n');
 655              		.loc 1 176 0
 656 02e2 1448     		ldr	r0, .L41+8
 657 02e4 0A21     		movs	r1, #10
 658 02e6 FFF7FEFF 		bl	write_SCI
 177:D:/Git/dat290-7/programming/kontroll\main.c **** 			write_SCI(USART1, '\r');
 659              		.loc 1 177 0
 660 02ea 1048     		ldr	r0, .L41
 661 02ec 0D21     		movs	r1, #13
 662 02ee FFF7FEFF 		bl	write_SCI
 178:D:/Git/dat290-7/programming/kontroll\main.c **** 			write_SCI(USART1, '\n');
 663              		.loc 1 178 0
 664 02f2 0E48     		ldr	r0, .L41
 665 02f4 0A21     		movs	r1, #10
 666 02f6 FFF7FEFF 		bl	write_SCI
 667 02fa 15E0     		b	.L38
 668              	.L37:
 179:D:/Git/dat290-7/programming/kontroll\main.c **** 
 180:D:/Git/dat290-7/programming/kontroll\main.c **** 		}
 181:D:/Git/dat290-7/programming/kontroll\main.c **** 		else if (in == '*')
 669              		.loc 1 181 0
 670 02fc FB88     		ldrh	r3, [r7, #6]
 671 02fe 2A2B     		cmp	r3, #42
 672 0300 08D1     		bne	.L39
 182:D:/Git/dat290-7/programming/kontroll\main.c **** 		{
 183:D:/Git/dat290-7/programming/kontroll\main.c **** 			write_string_SCI(UART4, "AT\r\n");
 673              		.loc 1 183 0
 674 0302 0C48     		ldr	r0, .L41+8
 675 0304 0C49     		ldr	r1, .L41+12
 676 0306 FFF7FEFF 		bl	write_string_SCI
 184:D:/Git/dat290-7/programming/kontroll\main.c **** 			write_string_SCI(USART1, "AT\r\n");
 677              		.loc 1 184 0
 678 030a 0848     		ldr	r0, .L41
 679 030c 0A49     		ldr	r1, .L41+12
 680 030e FFF7FEFF 		bl	write_string_SCI
 681 0312 09E0     		b	.L38
 682              	.L39:
 185:D:/Git/dat290-7/programming/kontroll\main.c **** 		}
 186:D:/Git/dat290-7/programming/kontroll\main.c **** 		else
 187:D:/Git/dat290-7/programming/kontroll\main.c **** 		{
 188:D:/Git/dat290-7/programming/kontroll\main.c **** 			write_SCI(USART1, in);
 683              		.loc 1 188 0
 684 0314 FB88     		ldrh	r3, [r7, #6]
 685 0316 0548     		ldr	r0, .L41
 686 0318 1946     		mov	r1, r3
 687 031a FFF7FEFF 		bl	write_SCI
 189:D:/Git/dat290-7/programming/kontroll\main.c **** 			write_SCI(UART4, in);
 688              		.loc 1 189 0
 689 031e FB88     		ldrh	r3, [r7, #6]
 690 0320 0448     		ldr	r0, .L41+8
 691 0322 1946     		mov	r1, r3
 692 0324 FFF7FEFF 		bl	write_SCI
 693              	.L38:
 190:D:/Git/dat290-7/programming/kontroll\main.c **** 		}
 191:D:/Git/dat290-7/programming/kontroll\main.c **** 	}
 694              		.loc 1 191 0
 695 0328 CFE7     		b	.L40
 696              	.L42:
 697 032a 00BF     		.align	2
 698              	.L41:
 699 032c 00100140 		.word	1073811456
 700 0330 00000000 		.word	.LC0
 701 0334 004C0040 		.word	1073761280
 702 0338 0C000000 		.word	.LC1
 703              		.cfi_endproc
 704              	.LFE131:
 706              		.section	.rodata
 707 0011 000000   		.align	2
 708              	.LC2:
 709 0014 0A496E69 		.ascii	"\012Init\012\000"
 709      740A00
 710 001b 00       		.align	2
 711              	.LC3:
 712 001c 436F6E74 		.ascii	"Controller mode\012\000"
 712      726F6C6C 
 712      6572206D 
 712      6F64650A 
 712      00
 713 002d 000000   		.align	2
 714              	.LC4:
 715 0030 474F2100 		.ascii	"GO!\000"
 716              		.text
 717              		.align	2
 718              		.global	main
 719              		.thumb
 720              		.thumb_func
 722              	main:
 723              	.LFB132:
 192:D:/Git/dat290-7/programming/kontroll\main.c **** }
 193:D:/Git/dat290-7/programming/kontroll\main.c **** 
 194:D:/Git/dat290-7/programming/kontroll\main.c **** 
 195:D:/Git/dat290-7/programming/kontroll\main.c **** void main(void)
 196:D:/Git/dat290-7/programming/kontroll\main.c **** {
 724              		.loc 1 196 0
 725              		.cfi_startproc
 726              		@ args = 0, pretend = 0, frame = 8
 727              		@ frame_needed = 1, uses_anonymous_args = 0
 728 033c 80B5     		push	{r7, lr}
 729              		.cfi_def_cfa_offset 8
 730              		.cfi_offset 7, -8
 731              		.cfi_offset 14, -4
 732 033e 82B0     		sub	sp, sp, #8
 733              		.cfi_def_cfa_offset 16
 734 0340 00AF     		add	r7, sp, #0
 735              		.cfi_def_cfa_register 7
 197:D:/Git/dat290-7/programming/kontroll\main.c ****  	init_uart();
 736              		.loc 1 197 0
 737 0342 FFF7FEFF 		bl	init_uart
 198:D:/Git/dat290-7/programming/kontroll\main.c **** 	init_adc();
 738              		.loc 1 198 0
 739 0346 FFF7FEFF 		bl	init_adc
 199:D:/Git/dat290-7/programming/kontroll\main.c **** 	init_go();
 740              		.loc 1 199 0
 741 034a FFF7FEFF 		bl	init_go
 200:D:/Git/dat290-7/programming/kontroll\main.c **** 	write_string_SCI(USART1, "\nInit\n");
 742              		.loc 1 200 0
 743 034e 2548     		ldr	r0, .L46
 744 0350 2549     		ldr	r1, .L46+4
 745 0352 FFF7FEFF 		bl	write_string_SCI
 201:D:/Git/dat290-7/programming/kontroll\main.c **** 	uint8_t d = 0;
 746              		.loc 1 201 0
 747 0356 0023     		movs	r3, #0
 748 0358 FB71     		strb	r3, [r7, #7]
 202:D:/Git/dat290-7/programming/kontroll\main.c **** 	uint8_t s = 0;
 749              		.loc 1 202 0
 750 035a 0023     		movs	r3, #0
 751 035c BB71     		strb	r3, [r7, #6]
 203:D:/Git/dat290-7/programming/kontroll\main.c **** 	
 204:D:/Git/dat290-7/programming/kontroll\main.c **** 	debug_delay();
 752              		.loc 1 204 0
 753 035e FFF7FEFF 		bl	debug_delay
 205:D:/Git/dat290-7/programming/kontroll\main.c **** 	
 206:D:/Git/dat290-7/programming/kontroll\main.c **** 	//bt_config();
 207:D:/Git/dat290-7/programming/kontroll\main.c **** 	write_string_SCI(USART1, "Controller mode\n");
 754              		.loc 1 207 0
 755 0362 2048     		ldr	r0, .L46
 756 0364 2149     		ldr	r1, .L46+8
 757 0366 FFF7FEFF 		bl	write_string_SCI
 758              	.L45:
 208:D:/Git/dat290-7/programming/kontroll\main.c **** 	
 209:D:/Git/dat290-7/programming/kontroll\main.c **** 	while(1)
 210:D:/Git/dat290-7/programming/kontroll\main.c **** 	{
 211:D:/Git/dat290-7/programming/kontroll\main.c **** 		if (GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_11) != 1)
 759              		.loc 1 211 0
 760 036a 2148     		ldr	r0, .L46+12
 761 036c 4FF40061 		mov	r1, #2048
 762 0370 FFF7FEFF 		bl	GPIO_ReadInputDataBit
 763 0374 0346     		mov	r3, r0
 764 0376 012B     		cmp	r3, #1
 765 0378 07D0     		beq	.L44
 212:D:/Git/dat290-7/programming/kontroll\main.c **** 		{
 213:D:/Git/dat290-7/programming/kontroll\main.c **** 			send_cmd(3, 0);
 766              		.loc 1 213 0
 767 037a 0320     		movs	r0, #3
 768 037c 0021     		movs	r1, #0
 769 037e FFF7FEFF 		bl	send_cmd
 214:D:/Git/dat290-7/programming/kontroll\main.c **** 			write_string_SCI(USART1, "GO!");
 770              		.loc 1 214 0
 771 0382 1848     		ldr	r0, .L46
 772 0384 1B49     		ldr	r1, .L46+16
 773 0386 FFF7FEFF 		bl	write_string_SCI
 774              	.L44:
 215:D:/Git/dat290-7/programming/kontroll\main.c **** 
 216:D:/Git/dat290-7/programming/kontroll\main.c **** 		}
 217:D:/Git/dat290-7/programming/kontroll\main.c **** 		
 218:D:/Git/dat290-7/programming/kontroll\main.c **** 		d = adc_get_val(11);
 775              		.loc 1 218 0
 776 038a 0B20     		movs	r0, #11
 777 038c FFF7FEFF 		bl	adc_get_val
 778 0390 0346     		mov	r3, r0
 779 0392 FB71     		strb	r3, [r7, #7]
 219:D:/Git/dat290-7/programming/kontroll\main.c **** 		s = adc_get_val(12);
 780              		.loc 1 219 0
 781 0394 0C20     		movs	r0, #12
 782 0396 FFF7FEFF 		bl	adc_get_val
 783 039a 0346     		mov	r3, r0
 784 039c BB71     		strb	r3, [r7, #6]
 220:D:/Git/dat290-7/programming/kontroll\main.c **** 		
 221:D:/Git/dat290-7/programming/kontroll\main.c **** 		write_value_SCI(USART1, d);
 785              		.loc 1 221 0
 786 039e FB79     		ldrb	r3, [r7, #7]	@ zero_extendqisi2
 787 03a0 9BB2     		uxth	r3, r3
 788 03a2 1048     		ldr	r0, .L46
 789 03a4 1946     		mov	r1, r3
 790 03a6 FFF7FEFF 		bl	write_value_SCI
 222:D:/Git/dat290-7/programming/kontroll\main.c **** 		write_SCI(USART1, ',');
 791              		.loc 1 222 0
 792 03aa 0E48     		ldr	r0, .L46
 793 03ac 2C21     		movs	r1, #44
 794 03ae FFF7FEFF 		bl	write_SCI
 223:D:/Git/dat290-7/programming/kontroll\main.c **** 		write_value_SCI(USART1, s);
 795              		.loc 1 223 0
 796 03b2 BB79     		ldrb	r3, [r7, #6]	@ zero_extendqisi2
 797 03b4 9BB2     		uxth	r3, r3
 798 03b6 0B48     		ldr	r0, .L46
 799 03b8 1946     		mov	r1, r3
 800 03ba FFF7FEFF 		bl	write_value_SCI
 224:D:/Git/dat290-7/programming/kontroll\main.c **** 		write_SCI(USART1, '\n');
 801              		.loc 1 224 0
 802 03be 0948     		ldr	r0, .L46
 803 03c0 0A21     		movs	r1, #10
 804 03c2 FFF7FEFF 		bl	write_SCI
 225:D:/Git/dat290-7/programming/kontroll\main.c **** 		
 226:D:/Git/dat290-7/programming/kontroll\main.c **** 		send_cmd(1, d);
 805              		.loc 1 226 0
 806 03c6 FB79     		ldrb	r3, [r7, #7]	@ zero_extendqisi2
 807 03c8 0120     		movs	r0, #1
 808 03ca 1946     		mov	r1, r3
 809 03cc FFF7FEFF 		bl	send_cmd
 227:D:/Git/dat290-7/programming/kontroll\main.c **** 		
 228:D:/Git/dat290-7/programming/kontroll\main.c **** 		debug_delay();
 810              		.loc 1 228 0
 811 03d0 FFF7FEFF 		bl	debug_delay
 229:D:/Git/dat290-7/programming/kontroll\main.c **** 		
 230:D:/Git/dat290-7/programming/kontroll\main.c **** 		send_cmd(2, s);
 812              		.loc 1 230 0
 813 03d4 BB79     		ldrb	r3, [r7, #6]	@ zero_extendqisi2
 814 03d6 0220     		movs	r0, #2
 815 03d8 1946     		mov	r1, r3
 816 03da FFF7FEFF 		bl	send_cmd
 231:D:/Git/dat290-7/programming/kontroll\main.c **** 			
 232:D:/Git/dat290-7/programming/kontroll\main.c **** 		debug_delay();
 817              		.loc 1 232 0
 818 03de FFF7FEFF 		bl	debug_delay
 233:D:/Git/dat290-7/programming/kontroll\main.c **** 	}
 819              		.loc 1 233 0
 820 03e2 C2E7     		b	.L45
 821              	.L47:
 822              		.align	2
 823              	.L46:
 824 03e4 00100140 		.word	1073811456
 825 03e8 14000000 		.word	.LC2
 826 03ec 1C000000 		.word	.LC3
 827 03f0 00080240 		.word	1073874944
 828 03f4 30000000 		.word	.LC4
 829              		.cfi_endproc
 830              	.LFE132:
 832              	.Letext0:
 833              		.file 2 "c:\\program files (x86)\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 834              		.file 3 "c:\\program files (x86)\\gcc-arm\\arm-none-eabi\\include\\stdint.h"
 835              		.file 4 "D:/Git/dat290-7/programming/kontroll/stm32f4xx.h"
 836              		.file 5 "D:/Git/dat290-7/programming/kontroll/stm32f4xx_gpio.h"
 837              		.file 6 "D:/Git/dat290-7/programming/kontroll/stm32f4xx_usart.h"
 838              		.file 7 "D:/Git/dat290-7/programming/kontroll/stm32f4xx_adc.h"
 839              		.file 8 "D:/Git/dat290-7/programming/kontroll/core_cm4.h"
