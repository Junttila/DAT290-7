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
  12              		.eabi_attribute 30, 4
  13              		.eabi_attribute 34, 1
  14              		.eabi_attribute 18, 4
  15              		.thumb
  16              		.file	"system_stm32f4xx.c"
  17              		.text
  18              		.align	1
  19              		.global	SystemInit
  20              		.thumb
  21              		.thumb_func
  23              	SystemInit:
  24              		@ args = 0, pretend = 0, frame = 8
  25              		@ frame_needed = 0, uses_anonymous_args = 0
  26              		@ link register save eliminated.
  27 0000 374A     		ldr	r2, .L16
  28 0002 D2F88830 		ldr	r3, [r2, #136]
  29 0006 43F47003 		orr	r3, r3, #15728640
  30 000a C2F88830 		str	r3, [r2, #136]
  31 000e 354B     		ldr	r3, .L16+4
  32 0010 1A68     		ldr	r2, [r3]
  33 0012 0021     		movs	r1, #0
  34 0014 42F00102 		orr	r2, r2, #1
  35 0018 1A60     		str	r2, [r3]
  36 001a 9960     		str	r1, [r3, #8]
  37 001c 1A68     		ldr	r2, [r3]
  38 001e 22F08472 		bic	r2, r2, #17301504
  39 0022 22F48032 		bic	r2, r2, #65536
  40 0026 1A60     		str	r2, [r3]
  41 0028 2F4A     		ldr	r2, .L16+8
  42 002a 5A60     		str	r2, [r3, #4]
  43 002c 1A68     		ldr	r2, [r3]
  44 002e 82B0     		sub	sp, sp, #8
  45 0030 22F48022 		bic	r2, r2, #262144
  46 0034 1A60     		str	r2, [r3]
  47 0036 D960     		str	r1, [r3, #12]
  48 0038 0091     		str	r1, [sp]
  49 003a 0191     		str	r1, [sp, #4]
  50 003c 1A68     		ldr	r2, [r3]
  51 003e 42F48032 		orr	r2, r2, #65536
  52 0042 1A60     		str	r2, [r3]
  53              	.L3:
  54 0044 274B     		ldr	r3, .L16+4
  55 0046 1A68     		ldr	r2, [r3]
  56 0048 02F40032 		and	r2, r2, #131072
  57 004c 0192     		str	r2, [sp, #4]
  58 004e 009A     		ldr	r2, [sp]
  59 0050 0132     		adds	r2, r2, #1
  60 0052 0092     		str	r2, [sp]
  61 0054 019A     		ldr	r2, [sp, #4]
  62 0056 1AB9     		cbnz	r2, .L2
  63 0058 009A     		ldr	r2, [sp]
  64 005a B2F5A04F 		cmp	r2, #20480
  65 005e F1D1     		bne	.L3
  66              	.L2:
  67 0060 1B68     		ldr	r3, [r3]
  68 0062 13F40033 		ands	r3, r3, #131072
  69 0066 18BF     		it	ne
  70 0068 0123     		movne	r3, #1
  71 006a 0193     		str	r3, [sp, #4]
  72 006c 019B     		ldr	r3, [sp, #4]
  73 006e 012B     		cmp	r3, #1
  74 0070 05D0     		beq	.L6
  75              	.L9:
  76 0072 1B4B     		ldr	r3, .L16
  77 0074 4FF00062 		mov	r2, #134217728
  78 0078 9A60     		str	r2, [r3, #8]
  79 007a 02B0     		add	sp, sp, #8
  80              		@ sp needed
  81 007c 7047     		bx	lr
  82              	.L6:
  83 007e 194B     		ldr	r3, .L16+4
  84 0080 1A49     		ldr	r1, .L16+12
  85 0082 1A6C     		ldr	r2, [r3, #64]
  86 0084 42F08052 		orr	r2, r2, #268435456
  87 0088 1A64     		str	r2, [r3, #64]
  88 008a 0A68     		ldr	r2, [r1]
  89 008c 42F44042 		orr	r2, r2, #49152
  90 0090 0A60     		str	r2, [r1]
  91 0092 9A68     		ldr	r2, [r3, #8]
  92 0094 9A60     		str	r2, [r3, #8]
  93 0096 9A68     		ldr	r2, [r3, #8]
  94 0098 42F40042 		orr	r2, r2, #32768
  95 009c 9A60     		str	r2, [r3, #8]
  96 009e 9A68     		ldr	r2, [r3, #8]
  97 00a0 42F4A052 		orr	r2, r2, #5120
  98 00a4 9A60     		str	r2, [r3, #8]
  99 00a6 124A     		ldr	r2, .L16+16
 100 00a8 5A60     		str	r2, [r3, #4]
 101 00aa 1A68     		ldr	r2, [r3]
 102 00ac 42F08072 		orr	r2, r2, #16777216
 103 00b0 1A60     		str	r2, [r3]
 104              	.L7:
 105 00b2 1968     		ldr	r1, [r3]
 106 00b4 0B4A     		ldr	r2, .L16+4
 107 00b6 8901     		lsls	r1, r1, #6
 108 00b8 FBD5     		bpl	.L7
 109 00ba 0E4B     		ldr	r3, .L16+20
 110 00bc 40F20571 		movw	r1, #1797
 111 00c0 1960     		str	r1, [r3]
 112 00c2 9368     		ldr	r3, [r2, #8]
 113 00c4 23F00303 		bic	r3, r3, #3
 114 00c8 9360     		str	r3, [r2, #8]
 115 00ca 9368     		ldr	r3, [r2, #8]
 116 00cc 43F00203 		orr	r3, r3, #2
 117 00d0 9360     		str	r3, [r2, #8]
 118              	.L8:
 119 00d2 044B     		ldr	r3, .L16+4
 120 00d4 9B68     		ldr	r3, [r3, #8]
 121 00d6 03F00C03 		and	r3, r3, #12
 122 00da 082B     		cmp	r3, #8
 123 00dc F9D1     		bne	.L8
 124 00de C8E7     		b	.L9
 125              	.L17:
 126              		.align	2
 127              	.L16:
 128 00e0 00ED00E0 		.word	-536810240
 129 00e4 00380240 		.word	1073887232
 130 00e8 10300024 		.word	603992080
 131 00ec 00700040 		.word	1073770496
 132 00f0 19544007 		.word	121656345
 133 00f4 003C0240 		.word	1073888256
 135              		.align	1
 136              		.global	SystemCoreClockUpdate
 137              		.thumb
 138              		.thumb_func
 140              	SystemCoreClockUpdate:
 141              		@ args = 0, pretend = 0, frame = 0
 142              		@ frame_needed = 0, uses_anonymous_args = 0
 143              		@ link register save eliminated.
 144 00f8 174A     		ldr	r2, .L28
 145 00fa 1849     		ldr	r1, .L28+4
 146 00fc 9368     		ldr	r3, [r2, #8]
 147 00fe 03F00C03 		and	r3, r3, #12
 148 0102 042B     		cmp	r3, #4
 149 0104 03D0     		beq	.L20
 150 0106 082B     		cmp	r3, #8
 151 0108 03D0     		beq	.L21
 152 010a 154B     		ldr	r3, .L28+8
 153 010c 18E0     		b	.L27
 154              	.L20:
 155 010e 154B     		ldr	r3, .L28+12
 156 0110 16E0     		b	.L27
 157              	.L21:
 158 0112 5068     		ldr	r0, [r2, #4]
 159 0114 5368     		ldr	r3, [r2, #4]
 160 0116 10F4800F 		tst	r0, #4194304
 161 011a 03F03F03 		and	r3, r3, #63
 162 011e 5068     		ldr	r0, [r2, #4]
 163 0120 14BF     		ite	ne
 164 0122 104A     		ldrne	r2, .L28+12
 165 0124 0E4A     		ldreq	r2, .L28+8
 166 0126 B2FBF3F3 		udiv	r3, r2, r3
 167 012a 0B4A     		ldr	r2, .L28
 168 012c 5268     		ldr	r2, [r2, #4]
 169 012e C2F30142 		ubfx	r2, r2, #16, #2
 170 0132 C0F38810 		ubfx	r0, r0, #6, #9
 171 0136 0132     		adds	r2, r2, #1
 172 0138 4343     		muls	r3, r0, r3
 173 013a 5200     		lsls	r2, r2, #1
 174 013c B3FBF2F3 		udiv	r3, r3, r2
 175              	.L27:
 176 0140 0B60     		str	r3, [r1]
 177 0142 054B     		ldr	r3, .L28
 178 0144 9B68     		ldr	r3, [r3, #8]
 179 0146 C3F30313 		ubfx	r3, r3, #4, #4
 180 014a 0B44     		add	r3, r3, r1
 181 014c 1A79     		ldrb	r2, [r3, #4]	@ zero_extendqisi2
 182 014e 0B68     		ldr	r3, [r1]
 183 0150 D340     		lsrs	r3, r3, r2
 184 0152 0B60     		str	r3, [r1]
 185 0154 7047     		bx	lr
 186              	.L29:
 187 0156 00BF     		.align	2
 188              	.L28:
 189 0158 00380240 		.word	1073887232
 190 015c 00000000 		.word	.LANCHOR0
 191 0160 0024F400 		.word	16000000
 192 0164 40787D01 		.word	25000000
 194              		.global	AHBPrescTable
 195              		.global	SystemCoreClock
 196              		.data
 197              		.align	2
 198              		.set	.LANCHOR0,. + 0
 201              	SystemCoreClock:
 202 0000 007A030A 		.word	168000000
 205              	AHBPrescTable:
 206 0004 00       		.byte	0
 207 0005 00       		.byte	0
 208 0006 00       		.byte	0
 209 0007 00       		.byte	0
 210 0008 00       		.byte	0
 211 0009 00       		.byte	0
 212 000a 00       		.byte	0
 213 000b 00       		.byte	0
 214 000c 01       		.byte	1
 215 000d 02       		.byte	2
 216 000e 03       		.byte	3
 217 000f 04       		.byte	4
 218 0010 06       		.byte	6
 219 0011 07       		.byte	7
 220 0012 08       		.byte	8
 221 0013 09       		.byte	9
 222              		.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20150303 (release) [ARM/embedded-4_9-br
