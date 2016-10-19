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
  17              		.comm	TIM_OCInitStructure,20,4
  18              		.comm	TIM_TimeBaseStructure,12,4
  19              		.global	CCR3_val
  20              		.data
  21              		.align	1
  24              	CCR3_val:
  25 0000 8E00     		.short	142
  26              		.global	CCR4_val
  27              		.align	1
  30              	CCR4_val:
  31 0002 8E00     		.short	142
  32              		.section	.start_section,"ax",%progbits
  33              		.align	2
  34              		.global	startup
  35              		.thumb
  36              		.thumb_func
  38              	startup:
  39              		@ Naked Function: prologue and epilogue provided by programmer.
  40              		@ args = 0, pretend = 0, frame = 0
  41              		@ frame_needed = 1, uses_anonymous_args = 0
  42              	@ 23 "D:/Git/dat290-7/programming/bil/main.c" 1
  43 0000 4FF44040 		 mov r0, #0xc000
  44 0004 C2F20100 	 movt r0, #0x2001
  45 0008 8546     	 mov sp, r0
  46 000a FFF7FEFF 	 bl main
  47 000e FEE7     	.l1: b .l1
  48              	
  49              	@ 0 "" 2
  50              		.thumb
  52              		.text
  53              		.align	2
  54              		.global	init_uart
  55              		.thumb
  56              		.thumb_func
  58              	init_uart:
  59              		@ args = 0, pretend = 0, frame = 24
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62 0002 86B0     		sub	sp, sp, #24
  63 0004 00AF     		add	r7, sp, #0
  64 0006 0220     		movs	r0, #2
  65 0008 0121     		movs	r1, #1
  66 000a FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
  67 000e 1A48     		ldr	r0, .L3
  68 0010 0B21     		movs	r1, #11
  69 0012 0722     		movs	r2, #7
  70 0014 FFF7FEFF 		bl	GPIO_PinAFConfig
  71 0018 4FF44063 		mov	r3, #3072
  72 001c 3B61     		str	r3, [r7, #16]
  73 001e 0223     		movs	r3, #2
  74 0020 3B75     		strb	r3, [r7, #20]
  75 0022 0023     		movs	r3, #0
  76 0024 BB75     		strb	r3, [r7, #22]
  77 0026 0123     		movs	r3, #1
  78 0028 FB75     		strb	r3, [r7, #23]
  79 002a 0323     		movs	r3, #3
  80 002c 7B75     		strb	r3, [r7, #21]
  81 002e 07F11003 		add	r3, r7, #16
  82 0032 1148     		ldr	r0, .L3
  83 0034 1946     		mov	r1, r3
  84 0036 FFF7FEFF 		bl	GPIO_Init
  85 003a 4FF48020 		mov	r0, #262144
  86 003e 0121     		movs	r1, #1
  87 0040 FFF7FEFF 		bl	RCC_APB1PeriphClockCmd
  88 0044 4FF4E133 		mov	r3, #115200
  89 0048 3B60     		str	r3, [r7]
  90 004a 0023     		movs	r3, #0
  91 004c BB81     		strh	r3, [r7, #12]	@ movhi
  92 004e 0C23     		movs	r3, #12
  93 0050 7B81     		strh	r3, [r7, #10]	@ movhi
  94 0052 0023     		movs	r3, #0
  95 0054 3B81     		strh	r3, [r7, #8]	@ movhi
  96 0056 0023     		movs	r3, #0
  97 0058 FB80     		strh	r3, [r7, #6]	@ movhi
  98 005a 0023     		movs	r3, #0
  99 005c BB80     		strh	r3, [r7, #4]	@ movhi
 100 005e 3B46     		mov	r3, r7
 101 0060 0648     		ldr	r0, .L3+4
 102 0062 1946     		mov	r1, r3
 103 0064 FFF7FEFF 		bl	USART_Init
 104 0068 0448     		ldr	r0, .L3+4
 105 006a 0121     		movs	r1, #1
 106 006c FFF7FEFF 		bl	USART_Cmd
 107 0070 1837     		adds	r7, r7, #24
 108 0072 BD46     		mov	sp, r7
 109              		@ sp needed
 110 0074 80BD     		pop	{r7, pc}
 111              	.L4:
 112 0076 00BF     		.align	2
 113              	.L3:
 114 0078 00040240 		.word	1073873920
 115 007c 00480040 		.word	1073760256
 117              		.align	2
 118              		.global	init_pwm
 119              		.thumb
 120              		.thumb_func
 122              	init_pwm:
 123              		@ args = 0, pretend = 0, frame = 16
 124              		@ frame_needed = 1, uses_anonymous_args = 0
 125 0080 80B5     		push	{r7, lr}
 126 0082 84B0     		sub	sp, sp, #16
 127 0084 00AF     		add	r7, sp, #0
 128 0086 0120     		movs	r0, #1
 129 0088 0121     		movs	r1, #1
 130 008a FFF7FEFF 		bl	RCC_APB1PeriphClockCmd
 131 008e 0C23     		movs	r3, #12
 132 0090 7B60     		str	r3, [r7, #4]
 133 0092 0223     		movs	r3, #2
 134 0094 3B72     		strb	r3, [r7, #8]
 135 0096 0323     		movs	r3, #3
 136 0098 7B72     		strb	r3, [r7, #9]
 137 009a 0023     		movs	r3, #0
 138 009c BB72     		strb	r3, [r7, #10]
 139 009e 0123     		movs	r3, #1
 140 00a0 FB72     		strb	r3, [r7, #11]
 141 00a2 3B1D     		adds	r3, r7, #4
 142 00a4 3048     		ldr	r0, .L6
 143 00a6 1946     		mov	r1, r3
 144 00a8 FFF7FEFF 		bl	GPIO_Init
 145 00ac 2E48     		ldr	r0, .L6
 146 00ae 0221     		movs	r1, #2
 147 00b0 0122     		movs	r2, #1
 148 00b2 FFF7FEFF 		bl	GPIO_PinAFConfig
 149 00b6 2C48     		ldr	r0, .L6
 150 00b8 0321     		movs	r1, #3
 151 00ba 0122     		movs	r2, #1
 152 00bc FFF7FEFF 		bl	GPIO_PinAFConfig
 153 00c0 2A4B     		ldr	r3, .L6+4
 154 00c2 1B68     		ldr	r3, [r3]
 155 00c4 9A09     		lsrs	r2, r3, #6
 156 00c6 2A4B     		ldr	r3, .L6+8
 157 00c8 A3FB0223 		umull	r2, r3, r3, r2
 158 00cc 9B09     		lsrs	r3, r3, #6
 159 00ce 9BB2     		uxth	r3, r3
 160 00d0 013B     		subs	r3, r3, #1
 161 00d2 FB81     		strh	r3, [r7, #14]	@ movhi
 162 00d4 274B     		ldr	r3, .L6+12
 163 00d6 40F26C52 		movw	r2, #1388
 164 00da 5A60     		str	r2, [r3, #4]
 165 00dc 254B     		ldr	r3, .L6+12
 166 00de FA89     		ldrh	r2, [r7, #14]	@ movhi
 167 00e0 1A80     		strh	r2, [r3]	@ movhi
 168 00e2 244B     		ldr	r3, .L6+12
 169 00e4 0022     		movs	r2, #0
 170 00e6 1A81     		strh	r2, [r3, #8]	@ movhi
 171 00e8 224B     		ldr	r3, .L6+12
 172 00ea 0022     		movs	r2, #0
 173 00ec 5A80     		strh	r2, [r3, #2]	@ movhi
 174 00ee 4FF08040 		mov	r0, #1073741824
 175 00f2 2049     		ldr	r1, .L6+12
 176 00f4 FFF7FEFF 		bl	TIM_TimeBaseInit
 177 00f8 1F4B     		ldr	r3, .L6+16
 178 00fa 6022     		movs	r2, #96
 179 00fc 1A80     		strh	r2, [r3]	@ movhi
 180 00fe 1E4B     		ldr	r3, .L6+16
 181 0100 0122     		movs	r2, #1
 182 0102 5A80     		strh	r2, [r3, #2]	@ movhi
 183 0104 1D4B     		ldr	r3, .L6+20
 184 0106 1B88     		ldrh	r3, [r3]
 185 0108 1A46     		mov	r2, r3
 186 010a 1B4B     		ldr	r3, .L6+16
 187 010c 9A60     		str	r2, [r3, #8]
 188 010e 1A4B     		ldr	r3, .L6+16
 189 0110 0022     		movs	r2, #0
 190 0112 9A81     		strh	r2, [r3, #12]	@ movhi
 191 0114 4FF08040 		mov	r0, #1073741824
 192 0118 1749     		ldr	r1, .L6+16
 193 011a FFF7FEFF 		bl	TIM_OC3Init
 194 011e 4FF08040 		mov	r0, #1073741824
 195 0122 0821     		movs	r1, #8
 196 0124 FFF7FEFF 		bl	TIM_OC3PreloadConfig
 197 0128 134B     		ldr	r3, .L6+16
 198 012a 0122     		movs	r2, #1
 199 012c 5A80     		strh	r2, [r3, #2]	@ movhi
 200 012e 144B     		ldr	r3, .L6+24
 201 0130 1B88     		ldrh	r3, [r3]
 202 0132 1A46     		mov	r2, r3
 203 0134 104B     		ldr	r3, .L6+16
 204 0136 9A60     		str	r2, [r3, #8]
 205 0138 4FF08040 		mov	r0, #1073741824
 206 013c 0E49     		ldr	r1, .L6+16
 207 013e FFF7FEFF 		bl	TIM_OC4Init
 208 0142 4FF08040 		mov	r0, #1073741824
 209 0146 0821     		movs	r1, #8
 210 0148 FFF7FEFF 		bl	TIM_OC4PreloadConfig
 211 014c 4FF08040 		mov	r0, #1073741824
 212 0150 0121     		movs	r1, #1
 213 0152 FFF7FEFF 		bl	TIM_ARRPreloadConfig
 214 0156 4FF08040 		mov	r0, #1073741824
 215 015a 0121     		movs	r1, #1
 216 015c FFF7FEFF 		bl	TIM_Cmd
 217 0160 1037     		adds	r7, r7, #16
 218 0162 BD46     		mov	sp, r7
 219              		@ sp needed
 220 0164 80BD     		pop	{r7, pc}
 221              	.L7:
 222 0166 00BF     		.align	2
 223              	.L6:
 224 0168 00000240 		.word	1073872896
 225 016c 00000000 		.word	SystemCoreClock
 226 0170 632D3E05 		.word	87960931
 227 0174 00000000 		.word	TIM_TimeBaseStructure
 228 0178 00000000 		.word	TIM_OCInitStructure
 229 017c 00000000 		.word	CCR3_val
 230 0180 00000000 		.word	CCR4_val
 232              		.align	2
 233              		.global	IC_init
 234              		.thumb
 235              		.thumb_func
 237              	IC_init:
 238              		@ args = 0, pretend = 0, frame = 8
 239              		@ frame_needed = 1, uses_anonymous_args = 0
 240 0184 80B5     		push	{r7, lr}
 241 0186 82B0     		sub	sp, sp, #8
 242 0188 00AF     		add	r7, sp, #0
 243 018a 4023     		movs	r3, #64
 244 018c 3B60     		str	r3, [r7]
 245 018e 0023     		movs	r3, #0
 246 0190 3B71     		strb	r3, [r7, #4]
 247 0192 0323     		movs	r3, #3
 248 0194 7B71     		strb	r3, [r7, #5]
 249 0196 0023     		movs	r3, #0
 250 0198 BB71     		strb	r3, [r7, #6]
 251 019a 0123     		movs	r3, #1
 252 019c FB71     		strb	r3, [r7, #7]
 253 019e 3B46     		mov	r3, r7
 254 01a0 0348     		ldr	r0, .L9
 255 01a2 1946     		mov	r1, r3
 256 01a4 FFF7FEFF 		bl	GPIO_Init
 257 01a8 0837     		adds	r7, r7, #8
 258 01aa BD46     		mov	sp, r7
 259              		@ sp needed
 260 01ac 80BD     		pop	{r7, pc}
 261              	.L10:
 262 01ae 00BF     		.align	2
 263              	.L9:
 264 01b0 00000240 		.word	1073872896
 266              		.align	2
 267              		.global	pulse_init
 268              		.thumb
 269              		.thumb_func
 271              	pulse_init:
 272              		@ args = 0, pretend = 0, frame = 8
 273              		@ frame_needed = 1, uses_anonymous_args = 0
 274 01b4 80B5     		push	{r7, lr}
 275 01b6 82B0     		sub	sp, sp, #8
 276 01b8 00AF     		add	r7, sp, #0
 277 01ba 0420     		movs	r0, #4
 278 01bc 0121     		movs	r1, #1
 279 01be FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
 280 01c2 4FF48073 		mov	r3, #256
 281 01c6 3B60     		str	r3, [r7]
 282 01c8 0123     		movs	r3, #1
 283 01ca 3B71     		strb	r3, [r7, #4]
 284 01cc 0323     		movs	r3, #3
 285 01ce 7B71     		strb	r3, [r7, #5]
 286 01d0 0023     		movs	r3, #0
 287 01d2 BB71     		strb	r3, [r7, #6]
 288 01d4 0223     		movs	r3, #2
 289 01d6 FB71     		strb	r3, [r7, #7]
 290 01d8 3B46     		mov	r3, r7
 291 01da 0348     		ldr	r0, .L12
 292 01dc 1946     		mov	r1, r3
 293 01de FFF7FEFF 		bl	GPIO_Init
 294 01e2 0837     		adds	r7, r7, #8
 295 01e4 BD46     		mov	sp, r7
 296              		@ sp needed
 297 01e6 80BD     		pop	{r7, pc}
 298              	.L13:
 299              		.align	2
 300              	.L12:
 301 01e8 00080240 		.word	1073874944
 303              		.align	2
 304              		.global	assert_failed
 305              		.thumb
 306              		.thumb_func
 308              	assert_failed:
 309              		@ args = 0, pretend = 0, frame = 8
 310              		@ frame_needed = 1, uses_anonymous_args = 0
 311              		@ link register save eliminated.
 312 01ec 80B4     		push	{r7}
 313 01ee 83B0     		sub	sp, sp, #12
 314 01f0 00AF     		add	r7, sp, #0
 315 01f2 7860     		str	r0, [r7, #4]
 316 01f4 3960     		str	r1, [r7]
 317 01f6 0C37     		adds	r7, r7, #12
 318 01f8 BD46     		mov	sp, r7
 319              		@ sp needed
 320 01fa 5DF8047B 		ldr	r7, [sp], #4
 321 01fe 7047     		bx	lr
 323              		.align	2
 324              		.global	send_cmd
 325              		.thumb
 326              		.thumb_func
 328              	send_cmd:
 329              		@ args = 0, pretend = 0, frame = 16
 330              		@ frame_needed = 1, uses_anonymous_args = 0
 331 0200 80B5     		push	{r7, lr}
 332 0202 84B0     		sub	sp, sp, #16
 333 0204 00AF     		add	r7, sp, #0
 334 0206 0246     		mov	r2, r0
 335 0208 0B46     		mov	r3, r1
 336 020a FA71     		strb	r2, [r7, #7]
 337 020c BB71     		strb	r3, [r7, #6]
 338 020e FB79     		ldrb	r3, [r7, #7]	@ zero_extendqisi2
 339 0210 9B01     		lsls	r3, r3, #6
 340 0212 DAB2     		uxtb	r2, r3
 341 0214 BB79     		ldrb	r3, [r7, #6]	@ zero_extendqisi2
 342 0216 03F03F03 		and	r3, r3, #63
 343 021a DBB2     		uxtb	r3, r3
 344 021c 1343     		orrs	r3, r3, r2
 345 021e DBB2     		uxtb	r3, r3
 346 0220 FB73     		strb	r3, [r7, #15]
 347 0222 FB7B     		ldrb	r3, [r7, #15]	@ zero_extendqisi2
 348 0224 9BB2     		uxth	r3, r3
 349 0226 0348     		ldr	r0, .L16
 350 0228 1946     		mov	r1, r3
 351 022a FFF7FEFF 		bl	USART_SendData
 352 022e 1037     		adds	r7, r7, #16
 353 0230 BD46     		mov	sp, r7
 354              		@ sp needed
 355 0232 80BD     		pop	{r7, pc}
 356              	.L17:
 357              		.align	2
 358              	.L16:
 359 0234 00480040 		.word	1073760256
 361              		.global	i
 362              		.bss
 363              		.align	2
 366              	i:
 367 0000 00000000 		.space	4
 368              		.text
 369              		.align	2
 370              		.global	debug_delay
 371              		.thumb
 372              		.thumb_func
 374              	debug_delay:
 375              		@ args = 0, pretend = 0, frame = 0
 376              		@ frame_needed = 1, uses_anonymous_args = 0
 377              		@ link register save eliminated.
 378 0238 80B4     		push	{r7}
 379 023a 00AF     		add	r7, sp, #0
 380 023c 084B     		ldr	r3, .L21
 381 023e 0022     		movs	r2, #0
 382 0240 1A60     		str	r2, [r3]
 383 0242 04E0     		b	.L19
 384              	.L20:
 385 0244 064B     		ldr	r3, .L21
 386 0246 1B68     		ldr	r3, [r3]
 387 0248 5A1C     		adds	r2, r3, #1
 388 024a 054B     		ldr	r3, .L21
 389 024c 1A60     		str	r2, [r3]
 390              	.L19:
 391 024e 044B     		ldr	r3, .L21
 392 0250 1A68     		ldr	r2, [r3]
 393 0252 044B     		ldr	r3, .L21+4
 394 0254 9A42     		cmp	r2, r3
 395 0256 F5DD     		ble	.L20
 396 0258 BD46     		mov	sp, r7
 397              		@ sp needed
 398 025a 5DF8047B 		ldr	r7, [sp], #4
 399 025e 7047     		bx	lr
 400              	.L22:
 401              		.align	2
 402              	.L21:
 403 0260 00000000 		.word	i
 404 0264 9F860100 		.word	99999
 406              		.align	2
 407              		.global	debug_delay_long
 408              		.thumb
 409              		.thumb_func
 411              	debug_delay_long:
 412              		@ args = 0, pretend = 0, frame = 0
 413              		@ frame_needed = 1, uses_anonymous_args = 0
 414 0268 80B5     		push	{r7, lr}
 415 026a 00AF     		add	r7, sp, #0
 416 026c 074B     		ldr	r3, .L26
 417 026e 0022     		movs	r2, #0
 418 0270 1A60     		str	r2, [r3]
 419 0272 06E0     		b	.L24
 420              	.L25:
 421 0274 FFF7FEFF 		bl	debug_delay
 422 0278 044B     		ldr	r3, .L26
 423 027a 1B68     		ldr	r3, [r3]
 424 027c 5A1C     		adds	r2, r3, #1
 425 027e 034B     		ldr	r3, .L26
 426 0280 1A60     		str	r2, [r3]
 427              	.L24:
 428 0282 024B     		ldr	r3, .L26
 429 0284 1B68     		ldr	r3, [r3]
 430 0286 632B     		cmp	r3, #99
 431 0288 F4DD     		ble	.L25
 432 028a 80BD     		pop	{r7, pc}
 433              	.L27:
 434              		.align	2
 435              	.L26:
 436 028c 00000000 		.word	i
 438              		.section	.rodata
 439              		.align	2
 440              	.LC0:
 441 0000 0A425420 		.ascii	"\012BT Init start\012\000"
 441      496E6974 
 441      20737461 
 441      72740A00 
 442              		.text
 443              		.align	2
 444              		.global	bt_config
 445              		.thumb
 446              		.thumb_func
 448              	bt_config:
 449              		@ args = 0, pretend = 0, frame = 0
 450              		@ frame_needed = 1, uses_anonymous_args = 0
 451 0290 80B5     		push	{r7, lr}
 452 0292 00AF     		add	r7, sp, #0
 453 0294 0748     		ldr	r0, .L30
 454 0296 0849     		ldr	r1, .L30+4
 455 0298 FFF7FEFF 		bl	write_string_SCI
 456              	.L29:
 457 029c 0748     		ldr	r0, .L30+8
 458 029e FFF7FEFF 		bl	read_SCI
 459 02a2 0346     		mov	r3, r0
 460 02a4 0348     		ldr	r0, .L30
 461 02a6 1946     		mov	r1, r3
 462 02a8 FFF7FEFF 		bl	write_SCI
 463 02ac FFF7FEFF 		bl	debug_delay
 464 02b0 F4E7     		b	.L29
 465              	.L31:
 466 02b2 00BF     		.align	2
 467              	.L30:
 468 02b4 00100140 		.word	1073811456
 469 02b8 00000000 		.word	.LC0
 470 02bc 00480040 		.word	1073760256
 472              		.align	2
 473              		.global	send_pulse
 474              		.thumb
 475              		.thumb_func
 477              	send_pulse:
 478              		@ args = 0, pretend = 0, frame = 0
 479              		@ frame_needed = 1, uses_anonymous_args = 0
 480 02c0 80B5     		push	{r7, lr}
 481 02c2 00AF     		add	r7, sp, #0
 482 02c4 0948     		ldr	r0, .L33
 483 02c6 0021     		movs	r1, #0
 484 02c8 FFF7FEFF 		bl	GPIO_Write
 485 02cc 0220     		movs	r0, #2
 486 02ce FFF7FEFF 		bl	delay_us
 487 02d2 0648     		ldr	r0, .L33
 488 02d4 4FF6FF71 		movw	r1, #65535
 489 02d8 FFF7FEFF 		bl	GPIO_Write
 490 02dc 0A20     		movs	r0, #10
 491 02de FFF7FEFF 		bl	delay_us
 492 02e2 0248     		ldr	r0, .L33
 493 02e4 0021     		movs	r1, #0
 494 02e6 FFF7FEFF 		bl	GPIO_Write
 495 02ea 80BD     		pop	{r7, pc}
 496              	.L34:
 497              		.align	2
 498              	.L33:
 499 02ec 00080240 		.word	1073874944
 501              		.align	2
 502              		.global	abs
 503              		.thumb
 504              		.thumb_func
 506              	abs:
 507              		@ args = 0, pretend = 0, frame = 8
 508              		@ frame_needed = 1, uses_anonymous_args = 0
 509              		@ link register save eliminated.
 510 02f0 80B4     		push	{r7}
 511 02f2 83B0     		sub	sp, sp, #12
 512 02f4 00AF     		add	r7, sp, #0
 513 02f6 7860     		str	r0, [r7, #4]
 514 02f8 7B68     		ldr	r3, [r7, #4]
 515 02fa 002B     		cmp	r3, #0
 516 02fc 02DA     		bge	.L36
 517 02fe 7B68     		ldr	r3, [r7, #4]
 518 0300 5B42     		negs	r3, r3
 519 0302 00E0     		b	.L37
 520              	.L36:
 521 0304 7B68     		ldr	r3, [r7, #4]
 522              	.L37:
 523 0306 1846     		mov	r0, r3
 524 0308 0C37     		adds	r7, r7, #12
 525 030a BD46     		mov	sp, r7
 526              		@ sp needed
 527 030c 5DF8047B 		ldr	r7, [sp], #4
 528 0310 7047     		bx	lr
 530 0312 00BF     		.align	2
 531              		.global	smooth
 532              		.thumb
 533              		.thumb_func
 535              	smooth:
 536              		@ args = 0, pretend = 0, frame = 16
 537              		@ frame_needed = 1, uses_anonymous_args = 0
 538              		@ link register save eliminated.
 539 0314 80B4     		push	{r7}
 540 0316 85B0     		sub	sp, sp, #20
 541 0318 00AF     		add	r7, sp, #0
 542 031a F860     		str	r0, [r7, #12]
 543 031c 87ED020A 		fsts	s0, [r7, #8]
 544 0320 C7ED010A 		fsts	s1, [r7, #4]
 545 0324 97ED027A 		flds	s14, [r7, #8]
 546 0328 F7EE007A 		fconsts	s15, #112
 547 032c B4EEE77A 		fcmpes	s14, s15
 548 0330 F1EE10FA 		fmstat
 549 0334 02DD     		ble	.L46
 550 0336 184B     		ldr	r3, .L47
 551 0338 BB60     		str	r3, [r7, #8]	@ float
 552 033a 09E0     		b	.L41
 553              	.L46:
 554 033c D7ED027A 		flds	s15, [r7, #8]
 555 0340 F5EEC07A 		fcmpezs	s15
 556 0344 F1EE10FA 		fmstat
 557 0348 02D8     		bhi	.L41
 558 034a 4FF00003 		mov	r3, #0
 559 034e BB60     		str	r3, [r7, #8]	@ float
 560              	.L41:
 561 0350 FB68     		ldr	r3, [r7, #12]
 562 0352 07EE903A 		fmsr	s15, r3	@ int
 563 0356 B8EEE77A 		fsitos	s14, s15
 564 035a F7EE006A 		fconsts	s13, #112
 565 035e D7ED027A 		flds	s15, [r7, #8]
 566 0362 76EEE77A 		fsubs	s15, s13, s15
 567 0366 27EE277A 		fmuls	s14, s14, s15
 568 036a D7ED016A 		flds	s13, [r7, #4]
 569 036e D7ED027A 		flds	s15, [r7, #8]
 570 0372 66EEA77A 		fmuls	s15, s13, s15
 571 0376 77EE277A 		fadds	s15, s14, s15
 572 037a C7ED017A 		fsts	s15, [r7, #4]
 573 037e D7ED017A 		flds	s15, [r7, #4]
 574 0382 FDEEE77A 		ftosizs	s15, s15
 575 0386 17EE903A 		fmrs	r3, s15	@ int
 576 038a 1846     		mov	r0, r3
 577 038c 1437     		adds	r7, r7, #20
 578 038e BD46     		mov	sp, r7
 579              		@ sp needed
 580 0390 5DF8047B 		ldr	r7, [sp], #4
 581 0394 7047     		bx	lr
 582              	.L48:
 583 0396 00BF     		.align	2
 584              	.L47:
 585 0398 A4707D3F 		.word	1065185444
 587              		.global	prev
 588              		.bss
 589              		.align	2
 592              	prev:
 593 0004 00000000 		.space	4
 594              		.section	.rodata
 595              		.align	2
 596              	.LC1:
 597 0010 20202020 		.ascii	"    d\000"
 597      6400
 598              		.text
 599              		.align	2
 600              		.global	distance_read
 601              		.thumb
 602              		.thumb_func
 604              	distance_read:
 605              		@ args = 0, pretend = 0, frame = 8
 606              		@ frame_needed = 1, uses_anonymous_args = 0
 607 039c 80B5     		push	{r7, lr}
 608 039e 82B0     		sub	sp, sp, #8
 609 03a0 00AF     		add	r7, sp, #0
 610 03a2 0023     		movs	r3, #0
 611 03a4 7B60     		str	r3, [r7, #4]
 612 03a6 FFF7FEFF 		bl	send_pulse
 613 03aa 00BF     		nop
 614              	.L50:
 615 03ac 2648     		ldr	r0, .L55
 616 03ae 4021     		movs	r1, #64
 617 03b0 FFF7FEFF 		bl	GPIO_ReadInputDataBit
 618 03b4 0346     		mov	r3, r0
 619 03b6 002B     		cmp	r3, #0
 620 03b8 F8D0     		beq	.L50
 621 03ba 05E0     		b	.L51
 622              	.L52:
 623 03bc 7B68     		ldr	r3, [r7, #4]
 624 03be 0133     		adds	r3, r3, #1
 625 03c0 7B60     		str	r3, [r7, #4]
 626 03c2 0120     		movs	r0, #1
 627 03c4 FFF7FEFF 		bl	delay_us
 628              	.L51:
 629 03c8 1F48     		ldr	r0, .L55
 630 03ca 4021     		movs	r1, #64
 631 03cc FFF7FEFF 		bl	GPIO_ReadInputDataBit
 632 03d0 0346     		mov	r3, r0
 633 03d2 002B     		cmp	r3, #0
 634 03d4 F2D1     		bne	.L52
 635 03d6 1D4B     		ldr	r3, .L55+4
 636 03d8 D3ED007A 		flds	s15, [r3]
 637 03dc F5EE407A 		fcmpzs	s15
 638 03e0 F1EE10FA 		fmstat
 639 03e4 07D1     		bne	.L53
 640 03e6 7B68     		ldr	r3, [r7, #4]
 641 03e8 07EE903A 		fmsr	s15, r3	@ int
 642 03ec F8EE677A 		fuitos	s15, s15
 643 03f0 164B     		ldr	r3, .L55+4
 644 03f2 C3ED007A 		fsts	s15, [r3]
 645              	.L53:
 646 03f6 7B68     		ldr	r3, [r7, #4]
 647 03f8 144A     		ldr	r2, .L55+4
 648 03fa D2ED007A 		flds	s15, [r2]
 649 03fe 1846     		mov	r0, r3
 650 0400 9FED130A 		flds	s0, .L55+8
 651 0404 F0EE670A 		fcpys	s1, s15
 652 0408 FFF7FEFF 		bl	smooth
 653 040c 3860     		str	r0, [r7]
 654 040e 3B68     		ldr	r3, [r7]
 655 0410 9BB2     		uxth	r3, r3
 656 0412 1048     		ldr	r0, .L55+12
 657 0414 1946     		mov	r1, r3
 658 0416 FFF7FEFF 		bl	write_value_SCI
 659 041a 0E48     		ldr	r0, .L55+12
 660 041c 0E49     		ldr	r1, .L55+16
 661 041e FFF7FEFF 		bl	write_string_SCI
 662 0422 0C48     		ldr	r0, .L55+12
 663 0424 0A21     		movs	r1, #10
 664 0426 FFF7FEFF 		bl	write_SCI
 665 042a 3B68     		ldr	r3, [r7]
 666 042c 07EE903A 		fmsr	s15, r3	@ int
 667 0430 F8EEE77A 		fsitos	s15, s15
 668 0434 054B     		ldr	r3, .L55+4
 669 0436 C3ED007A 		fsts	s15, [r3]
 670 043a 3B68     		ldr	r3, [r7]
 671 043c 9BB2     		uxth	r3, r3
 672 043e 1846     		mov	r0, r3
 673 0440 0837     		adds	r7, r7, #8
 674 0442 BD46     		mov	sp, r7
 675              		@ sp needed
 676 0444 80BD     		pop	{r7, pc}
 677              	.L56:
 678 0446 00BF     		.align	2
 679              	.L55:
 680 0448 00000240 		.word	1073872896
 681 044c 00000000 		.word	prev
 682 0450 9A99193F 		.word	1058642330
 683 0454 00100140 		.word	1073811456
 684 0458 10000000 		.word	.LC1
 686              		.align	2
 687              		.global	CCR4_update
 688              		.thumb
 689              		.thumb_func
 691              	CCR4_update:
 692              		@ args = 0, pretend = 0, frame = 8
 693              		@ frame_needed = 1, uses_anonymous_args = 0
 694 045c 80B5     		push	{r7, lr}
 695 045e 82B0     		sub	sp, sp, #8
 696 0460 00AF     		add	r7, sp, #0
 697 0462 0346     		mov	r3, r0
 698 0464 FB71     		strb	r3, [r7, #7]
 699 0466 FB79     		ldrb	r3, [r7, #7]	@ zero_extendqisi2
 700 0468 AD2B     		cmp	r3, #173
 701 046a 02D9     		bls	.L58
 702 046c B723     		movs	r3, #183
 703 046e FB71     		strb	r3, [r7, #7]
 704 0470 04E0     		b	.L59
 705              	.L58:
 706 0472 FB79     		ldrb	r3, [r7, #7]	@ zero_extendqisi2
 707 0474 772B     		cmp	r3, #119
 708 0476 01D8     		bhi	.L59
 709 0478 7823     		movs	r3, #120
 710 047a FB71     		strb	r3, [r7, #7]
 711              	.L59:
 712 047c FB79     		ldrb	r3, [r7, #7]	@ zero_extendqisi2
 713 047e 9AB2     		uxth	r2, r3
 714 0480 094B     		ldr	r3, .L60
 715 0482 1A80     		strh	r2, [r3]	@ movhi
 716 0484 084B     		ldr	r3, .L60
 717 0486 1B88     		ldrh	r3, [r3]
 718 0488 1A46     		mov	r2, r3
 719 048a 084B     		ldr	r3, .L60+4
 720 048c 9A60     		str	r2, [r3, #8]
 721 048e 4FF08040 		mov	r0, #1073741824
 722 0492 0649     		ldr	r1, .L60+4
 723 0494 FFF7FEFF 		bl	TIM_OC4Init
 724 0498 4FF08040 		mov	r0, #1073741824
 725 049c 0121     		movs	r1, #1
 726 049e FFF7FEFF 		bl	TIM_OC4PreloadConfig
 727 04a2 0837     		adds	r7, r7, #8
 728 04a4 BD46     		mov	sp, r7
 729              		@ sp needed
 730 04a6 80BD     		pop	{r7, pc}
 731              	.L61:
 732              		.align	2
 733              	.L60:
 734 04a8 00000000 		.word	CCR4_val
 735 04ac 00000000 		.word	TIM_OCInitStructure
 737              		.align	2
 738              		.global	CCR3_update
 739              		.thumb
 740              		.thumb_func
 742              	CCR3_update:
 743              		@ args = 0, pretend = 0, frame = 8
 744              		@ frame_needed = 1, uses_anonymous_args = 0
 745 04b0 80B5     		push	{r7, lr}
 746 04b2 82B0     		sub	sp, sp, #8
 747 04b4 00AF     		add	r7, sp, #0
 748 04b6 0346     		mov	r3, r0
 749 04b8 FB71     		strb	r3, [r7, #7]
 750 04ba FB79     		ldrb	r3, [r7, #7]	@ zero_extendqisi2
 751 04bc B72B     		cmp	r3, #183
 752 04be 02D9     		bls	.L63
 753 04c0 AD23     		movs	r3, #173
 754 04c2 FB71     		strb	r3, [r7, #7]
 755 04c4 04E0     		b	.L64
 756              	.L63:
 757 04c6 FB79     		ldrb	r3, [r7, #7]	@ zero_extendqisi2
 758 04c8 6D2B     		cmp	r3, #109
 759 04ca 01D8     		bhi	.L64
 760 04cc 6E23     		movs	r3, #110
 761 04ce FB71     		strb	r3, [r7, #7]
 762              	.L64:
 763 04d0 FB79     		ldrb	r3, [r7, #7]	@ zero_extendqisi2
 764 04d2 9AB2     		uxth	r2, r3
 765 04d4 094B     		ldr	r3, .L65
 766 04d6 1A80     		strh	r2, [r3]	@ movhi
 767 04d8 084B     		ldr	r3, .L65
 768 04da 1B88     		ldrh	r3, [r3]
 769 04dc 1A46     		mov	r2, r3
 770 04de 084B     		ldr	r3, .L65+4
 771 04e0 9A60     		str	r2, [r3, #8]
 772 04e2 4FF08040 		mov	r0, #1073741824
 773 04e6 0649     		ldr	r1, .L65+4
 774 04e8 FFF7FEFF 		bl	TIM_OC3Init
 775 04ec 4FF08040 		mov	r0, #1073741824
 776 04f0 0121     		movs	r1, #1
 777 04f2 FFF7FEFF 		bl	TIM_OC3PreloadConfig
 778 04f6 0837     		adds	r7, r7, #8
 779 04f8 BD46     		mov	sp, r7
 780              		@ sp needed
 781 04fa 80BD     		pop	{r7, pc}
 782              	.L66:
 783              		.align	2
 784              	.L65:
 785 04fc 00000000 		.word	CCR3_val
 786 0500 00000000 		.word	TIM_OCInitStructure
 788              		.comm	first_brake,1,1
 789              		.align	2
 790              		.global	break_test
 791              		.thumb
 792              		.thumb_func
 794              	break_test:
 795              		@ args = 0, pretend = 0, frame = 8
 796              		@ frame_needed = 1, uses_anonymous_args = 0
 797 0504 80B5     		push	{r7, lr}
 798 0506 82B0     		sub	sp, sp, #8
 799 0508 00AF     		add	r7, sp, #0
 800 050a 2B4B     		ldr	r3, .L75
 801 050c 4FF00002 		mov	r2, #0
 802 0510 1A60     		str	r2, [r3]	@ float
 803 0512 2A4B     		ldr	r3, .L75+4
 804 0514 0122     		movs	r2, #1
 805 0516 1A70     		strb	r2, [r3]
 806 0518 9720     		movs	r0, #151
 807 051a FFF7FEFF 		bl	CCR4_update
 808 051e 8E20     		movs	r0, #142
 809 0520 FFF7FEFF 		bl	CCR3_update
 810 0524 0820     		movs	r0, #8
 811 0526 FFF7FEFF 		bl	delay_s
 812 052a 9B20     		movs	r0, #155
 813 052c FFF7FEFF 		bl	CCR3_update
 814 0530 2348     		ldr	r0, .L75+8
 815 0532 7321     		movs	r1, #115
 816 0534 FFF7FEFF 		bl	write_SCI
 817 0538 02E0     		b	.L68
 818              	.L69:
 819 053a 3C20     		movs	r0, #60
 820 053c FFF7FEFF 		bl	delay_ms
 821              	.L68:
 822 0540 FFF7FEFF 		bl	distance_read
 823 0544 0346     		mov	r3, r0
 824 0546 1A46     		mov	r2, r3
 825 0548 41F65833 		movw	r3, #7000
 826 054c 9A42     		cmp	r2, r3
 827 054e F4D8     		bhi	.L69
 828              	.L73:
 829 0550 FFF7FEFF 		bl	distance_read
 830 0554 0346     		mov	r3, r0
 831 0556 7B60     		str	r3, [r7, #4]
 832 0558 1948     		ldr	r0, .L75+8
 833 055a 6221     		movs	r1, #98
 834 055c FFF7FEFF 		bl	write_SCI
 835 0560 7A68     		ldr	r2, [r7, #4]
 836 0562 40F2B533 		movw	r3, #949
 837 0566 9A42     		cmp	r2, r3
 838 0568 03D8     		bhi	.L70
 839 056a 6E20     		movs	r0, #110
 840 056c FFF7FEFF 		bl	CCR3_update
 841 0570 18E0     		b	.L74
 842              	.L70:
 843 0572 7B68     		ldr	r3, [r7, #4]
 844 0574 B3F5FA5F 		cmp	r3, #8000
 845 0578 10D2     		bcs	.L72
 846 057a 104B     		ldr	r3, .L75+4
 847 057c 1B78     		ldrb	r3, [r3]	@ zero_extendqisi2
 848 057e 002B     		cmp	r3, #0
 849 0580 0CD0     		beq	.L72
 850 0582 6E20     		movs	r0, #110
 851 0584 FFF7FEFF 		bl	CCR3_update
 852 0588 4FF41670 		mov	r0, #600
 853 058c FFF7FEFF 		bl	delay_ms
 854 0590 9720     		movs	r0, #151
 855 0592 FFF7FEFF 		bl	CCR3_update
 856 0596 094B     		ldr	r3, .L75+4
 857 0598 0022     		movs	r2, #0
 858 059a 1A70     		strb	r2, [r3]
 859              	.L72:
 860 059c 3C20     		movs	r0, #60
 861 059e FFF7FEFF 		bl	delay_ms
 862 05a2 D5E7     		b	.L73
 863              	.L74:
 864 05a4 0520     		movs	r0, #5
 865 05a6 FFF7FEFF 		bl	delay_s
 866 05aa 8E20     		movs	r0, #142
 867 05ac FFF7FEFF 		bl	CCR3_update
 868 05b0 0837     		adds	r7, r7, #8
 869 05b2 BD46     		mov	sp, r7
 870              		@ sp needed
 871 05b4 80BD     		pop	{r7, pc}
 872              	.L76:
 873 05b6 00BF     		.align	2
 874              	.L75:
 875 05b8 00000000 		.word	prev
 876 05bc 00000000 		.word	first_brake
 877 05c0 00100140 		.word	1073811456
 879              		.section	.rodata
 880 0016 0000     		.align	2
 881              	.LC2:
 882 0018 643A00   		.ascii	"d:\000"
 883 001b 00       		.align	2
 884              	.LC3:
 885 001c 733A00   		.ascii	"s:\000"
 886 001f 00       		.text
 887              		.align	2
 888              		.global	main
 889              		.thumb
 890              		.thumb_func
 892              	main:
 893              		@ args = 0, pretend = 0, frame = 16
 894              		@ frame_needed = 1, uses_anonymous_args = 0
 895 05c4 80B5     		push	{r7, lr}
 896 05c6 84B0     		sub	sp, sp, #16
 897 05c8 00AF     		add	r7, sp, #0
 898 05ca FFF7FEFF 		bl	init_uart
 899 05ce 4C48     		ldr	r0, .L88
 900 05d0 6921     		movs	r1, #105
 901 05d2 FFF7FEFF 		bl	write_SCI
 902 05d6 FFF7FEFF 		bl	init_pwm
 903 05da 4948     		ldr	r0, .L88
 904 05dc 7021     		movs	r1, #112
 905 05de FFF7FEFF 		bl	write_SCI
 906 05e2 0023     		movs	r3, #0
 907 05e4 FB73     		strb	r3, [r7, #15]
 908 05e6 6E23     		movs	r3, #110
 909 05e8 BB81     		strh	r3, [r7, #12]	@ movhi
 910 05ea FFF7FEFF 		bl	pulse_init
 911 05ee FFF7FEFF 		bl	IC_init
 912 05f2 4FF00002 		mov	r2, #0
 913 05f6 4FF00003 		mov	r3, #0
 914 05fa C7E90023 		strd	r2, [r7]
 915              	.L86:
 916 05fe 4148     		ldr	r0, .L88+4
 917 0600 FFF7FEFF 		bl	read_SCI
 918 0604 0346     		mov	r3, r0
 919 0606 FB73     		strb	r3, [r7, #15]
 920 0608 FB7B     		ldrb	r3, [r7, #15]	@ zero_extendqisi2
 921 060a 002B     		cmp	r3, #0
 922 060c 56D0     		beq	.L78
 923 060e FB7B     		ldrb	r3, [r7, #15]	@ zero_extendqisi2
 924 0610 9B09     		lsrs	r3, r3, #6
 925 0612 DBB2     		uxtb	r3, r3
 926 0614 022B     		cmp	r3, #2
 927 0616 25D0     		beq	.L80
 928 0618 032B     		cmp	r3, #3
 929 061a 45D0     		beq	.L81
 930 061c 012B     		cmp	r3, #1
 931 061e 46D1     		bne	.L87
 932 0620 FB7B     		ldrb	r3, [r7, #15]	@ zero_extendqisi2
 933 0622 9BB2     		uxth	r3, r3
 934 0624 03F03F03 		and	r3, r3, #63
 935 0628 9AB2     		uxth	r2, r3
 936 062a BB89     		ldrh	r3, [r7, #12]	@ movhi
 937 062c 1344     		add	r3, r3, r2
 938 062e 9BB2     		uxth	r3, r3
 939 0630 0A33     		adds	r3, r3, #10
 940 0632 9AB2     		uxth	r2, r3
 941 0634 344B     		ldr	r3, .L88+8
 942 0636 1A80     		strh	r2, [r3]	@ movhi
 943 0638 334B     		ldr	r3, .L88+8
 944 063a 1B88     		ldrh	r3, [r3]
 945 063c 962B     		cmp	r3, #150
 946 063e 06D9     		bls	.L83
 947 0640 314B     		ldr	r3, .L88+8
 948 0642 1B88     		ldrh	r3, [r3]
 949 0644 9F2B     		cmp	r3, #159
 950 0646 02D8     		bhi	.L83
 951 0648 2F4B     		ldr	r3, .L88+8
 952 064a 9822     		movs	r2, #152
 953 064c 1A80     		strh	r2, [r3]	@ movhi
 954              	.L83:
 955 064e 2C48     		ldr	r0, .L88
 956 0650 2E49     		ldr	r1, .L88+12
 957 0652 FFF7FEFF 		bl	write_string_SCI
 958 0656 2C4B     		ldr	r3, .L88+8
 959 0658 1B88     		ldrh	r3, [r3]
 960 065a 2948     		ldr	r0, .L88
 961 065c 1946     		mov	r1, r3
 962 065e FFF7FEFF 		bl	write_value_SCI
 963 0662 2BE0     		b	.L84
 964              	.L80:
 965 0664 FB7B     		ldrb	r3, [r7, #15]	@ zero_extendqisi2
 966 0666 9BB2     		uxth	r3, r3
 967 0668 03F03F03 		and	r3, r3, #63
 968 066c 9AB2     		uxth	r2, r3
 969 066e BB89     		ldrh	r3, [r7, #12]	@ movhi
 970 0670 1344     		add	r3, r3, r2
 971 0672 9AB2     		uxth	r2, r3
 972 0674 264B     		ldr	r3, .L88+16
 973 0676 1A80     		strh	r2, [r3]	@ movhi
 974 0678 254B     		ldr	r3, .L88+16
 975 067a 1B88     		ldrh	r3, [r3]
 976 067c 802B     		cmp	r3, #128
 977 067e 08D9     		bls	.L85
 978 0680 234B     		ldr	r3, .L88+16
 979 0682 1B88     		ldrh	r3, [r3]
 980 0684 952B     		cmp	r3, #149
 981 0686 04D8     		bhi	.L85
 982 0688 214B     		ldr	r3, .L88+16
 983 068a 9522     		movs	r2, #149
 984 068c 1A80     		strh	r2, [r3]	@ movhi
 985 068e FFF7FEFF 		bl	debug_delay_long
 986              	.L85:
 987 0692 1B48     		ldr	r0, .L88
 988 0694 1F49     		ldr	r1, .L88+20
 989 0696 FFF7FEFF 		bl	write_string_SCI
 990 069a 1D4B     		ldr	r3, .L88+16
 991 069c 1B88     		ldrh	r3, [r3]
 992 069e 1848     		ldr	r0, .L88
 993 06a0 1946     		mov	r1, r3
 994 06a2 FFF7FEFF 		bl	write_value_SCI
 995 06a6 09E0     		b	.L84
 996              	.L81:
 997 06a8 FFF7FEFF 		bl	break_test
 998 06ac 06E0     		b	.L84
 999              	.L87:
 1000 06ae 184B     		ldr	r3, .L88+16
 1001 06b0 8E22     		movs	r2, #142
 1002 06b2 1A80     		strh	r2, [r3]	@ movhi
 1003 06b4 144B     		ldr	r3, .L88+8
 1004 06b6 8E22     		movs	r2, #142
 1005 06b8 1A80     		strh	r2, [r3]	@ movhi
 1006 06ba FFE7     		b	.L78
 1007              	.L84:
 1008              	.L78:
 1009 06bc 124B     		ldr	r3, .L88+8
 1010 06be 1B88     		ldrh	r3, [r3]
 1011 06c0 1A46     		mov	r2, r3
 1012 06c2 154B     		ldr	r3, .L88+24
 1013 06c4 9A60     		str	r2, [r3, #8]
 1014 06c6 4FF08040 		mov	r0, #1073741824
 1015 06ca 1349     		ldr	r1, .L88+24
 1016 06cc FFF7FEFF 		bl	TIM_OC4Init
 1017 06d0 4FF08040 		mov	r0, #1073741824
 1018 06d4 0121     		movs	r1, #1
 1019 06d6 FFF7FEFF 		bl	TIM_OC4PreloadConfig
 1020 06da 0D4B     		ldr	r3, .L88+16
 1021 06dc 1B88     		ldrh	r3, [r3]
 1022 06de 1A46     		mov	r2, r3
 1023 06e0 0D4B     		ldr	r3, .L88+24
 1024 06e2 9A60     		str	r2, [r3, #8]
 1025 06e4 4FF08040 		mov	r0, #1073741824
 1026 06e8 0B49     		ldr	r1, .L88+24
 1027 06ea FFF7FEFF 		bl	TIM_OC3Init
 1028 06ee 4FF08040 		mov	r0, #1073741824
 1029 06f2 0121     		movs	r1, #1
 1030 06f4 FFF7FEFF 		bl	TIM_OC3PreloadConfig
 1031 06f8 FFF7FEFF 		bl	debug_delay
 1032 06fc 7FE7     		b	.L86
 1033              	.L89:
 1034 06fe 00BF     		.align	2
 1035              	.L88:
 1036 0700 00100140 		.word	1073811456
 1037 0704 00480040 		.word	1073760256
 1038 0708 00000000 		.word	CCR4_val
 1039 070c 18000000 		.word	.LC2
 1040 0710 00000000 		.word	CCR3_val
 1041 0714 1C000000 		.word	.LC3
 1042 0718 00000000 		.word	TIM_OCInitStructure
 1044              		.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20150303 (release) [ARM/embedded-4_9-br
