All addresses are in byte, so use directly for ijmp

v0.1.0-alpha.elf:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .data         00000000  00800100  00000ac2  00000b56  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  1 .text         00000ac2  00000000  00000000  00000094  2**1
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .bss          00000021  00800100  00800100  00000b56  2**0
                  ALLOC
  3 .avr.prop     00000058  00000000  00000000  00000b56  2**0
                  CONTENTS, READONLY

Disassembly of section .text:

00000000 <__ctors_end>:
   0:	8c d0       	rcall	.+280    	; 0x11a <uartInit>
   2:	f6 d0       	rcall	.+492    	; 0x1f0 <terminalInit>

00000004 <shellInit>:
   4:	70 d2       	rcall	.+1248   	; 0x4e6 <bufferReset>

00000006 <shellRun>:
   6:	a8 d0       	rcall	.+336    	; 0x158 <uartRecv>
   8:	9d 30       	cpi	r25, 0x0D	; 13
   a:	71 f0       	breq	.+28     	; 0x28 <shellHandleEnter>
   c:	9f 37       	cpi	r25, 0x7F	; 127
   e:	31 f0       	breq	.+12     	; 0x1c <shellHandleBackspace>
  10:	58 d2       	rcall	.+1200   	; 0x4c2 <bufferAdd>
  12:	90 d0       	rcall	.+288    	; 0x134 <uartSend>
  14:	f8 cf       	rjmp	.-16     	; 0x6 <shellRun>

00000016 <getBL>:
  16:	6f d2       	rcall	.+1246   	; 0x4f6 <setYBL>
  18:	08 81       	ld	r16, Y
  1a:	08 95       	ret

0000001c <shellHandleBackspace>:
  1c:	fc df       	rcall	.-8      	; 0x16 <getBL>
  1e:	00 30       	cpi	r16, 0x00	; 0
  20:	91 f3       	breq	.-28     	; 0x6 <shellRun>
  22:	54 d2       	rcall	.+1192   	; 0x4cc <bufferDel>
  24:	ea d0       	rcall	.+468    	; 0x1fa <terminalBackspace>
  26:	ef cf       	rjmp	.-34     	; 0x6 <shellRun>

00000028 <shellHandleEnter>:
  28:	f6 df       	rcall	.-20     	; 0x16 <getBL>
  2a:	00 30       	cpi	r16, 0x00	; 0
  2c:	31 f0       	breq	.+12     	; 0x3a <emptyLine>
  2e:	01 d1       	rcall	.+514    	; 0x232 <terminalNewLine>
  30:	85 d2       	rcall	.+1290   	; 0x53c <parseCommand>
  32:	05 d0       	rcall	.+10     	; 0x3e <shellExecute>
  34:	58 d2       	rcall	.+1200   	; 0x4e6 <bufferReset>
  36:	fa d0       	rcall	.+500    	; 0x22c <terminalEnter>
  38:	e6 cf       	rjmp	.-52     	; 0x6 <shellRun>

0000003a <emptyLine>:
  3a:	f8 d0       	rcall	.+496    	; 0x22c <terminalEnter>
  3c:	e4 cf       	rjmp	.-56     	; 0x6 <shellRun>

0000003e <shellExecute>:
  3e:	10 e2       	ldi	r17, 0x20	; 32
  40:	01 16       	cp	r0, r17
  42:	c9 f0       	breq	.+50     	; 0x76 <callHelpCommand>
  44:	11 e2       	ldi	r17, 0x21	; 33
  46:	01 16       	cp	r0, r17
  48:	c1 f0       	breq	.+48     	; 0x7a <callInfoCommand>
  4a:	12 e2       	ldi	r17, 0x22	; 34
  4c:	01 16       	cp	r0, r17
  4e:	b9 f0       	breq	.+46     	; 0x7e <callRegsCommand>
  50:	10 e3       	ldi	r17, 0x30	; 48
  52:	01 16       	cp	r0, r17
  54:	b1 f0       	breq	.+44     	; 0x82 <callClearCommand>
  56:	11 ef       	ldi	r17, 0xF1	; 241
  58:	01 16       	cp	r0, r17
  5a:	d9 f0       	breq	.+54     	; 0x92 <callIjmp>
  5c:	12 ef       	ldi	r17, 0xF2	; 242
  5e:	01 16       	cp	r0, r17
  60:	a1 f0       	breq	.+40     	; 0x8a <callMread>
  62:	13 ef       	ldi	r17, 0xF3	; 243
  64:	01 16       	cp	r0, r17
  66:	99 f0       	breq	.+38     	; 0x8e <callMwrite>
  68:	10 ef       	ldi	r17, 0xF0	; 240
  6a:	01 16       	cp	r0, r17
  6c:	61 f0       	breq	.+24     	; 0x86 <callEchoCommand>
  6e:	1d ef       	ldi	r17, 0xFD	; 253
  70:	01 16       	cp	r0, r17
  72:	81 f0       	breq	.+32     	; 0x94 <callInvalidArg>
  74:	14 c0       	rjmp	.+40     	; 0x9e <invalidCommand>

00000076 <callHelpCommand>:
  76:	01 d1       	rcall	.+514    	; 0x27a <helpCommand>
  78:	08 95       	ret

0000007a <callInfoCommand>:
  7a:	96 d1       	rcall	.+812    	; 0x3a8 <infoCommand>
  7c:	08 95       	ret

0000007e <callRegsCommand>:
  7e:	6e d3       	rcall	.+1756   	; 0x75c <regsCommand>
  80:	08 95       	ret

00000082 <callClearCommand>:
  82:	8d d1       	rcall	.+794    	; 0x39e <clearCommand>
  84:	08 95       	ret

00000086 <callEchoCommand>:
  86:	68 d4       	rcall	.+2256   	; 0x958 <echoCommand>
  88:	08 95       	ret

0000008a <callMread>:
  8a:	f1 d4       	rcall	.+2530   	; 0xa6e <mread>
  8c:	08 95       	ret

0000008e <callMwrite>:
  8e:	dc d4       	rcall	.+2488   	; 0xa48 <mwrite>
  90:	08 95       	ret

00000092 <callIjmp>:
  92:	09 94       	ijmp

00000094 <callInvalidArg>:
  94:	16 d0       	rcall	.+44     	; 0xc2 <printInvalidArg>
  96:	08 95       	ret

00000098 <setZCommandNotFound>:
  98:	f0 e0       	ldi	r31, 0x00	; 0
  9a:	e6 ed       	ldi	r30, 0xD6	; 214
  9c:	08 95       	ret

0000009e <invalidCommand>:
  9e:	fc df       	rcall	.-8      	; 0x98 <setZCommandNotFound>

000000a0 <loop2>:
  a0:	95 91       	lpm	r25, Z+
  a2:	90 30       	cpi	r25, 0x00	; 0
  a4:	11 f0       	breq	.+4      	; 0xaa <done2>
  a6:	46 d0       	rcall	.+140    	; 0x134 <uartSend>
  a8:	fb cf       	rjmp	.-10     	; 0xa0 <loop2>

000000aa <done2>:
  aa:	02 d0       	rcall	.+4      	; 0xb0 <printBuffer>
  ac:	1c d2       	rcall	.+1080   	; 0x4e6 <bufferReset>
  ae:	08 95       	ret

000000b0 <printBuffer>:
  b0:	1f d2       	rcall	.+1086   	; 0x4f0 <resetXBuffer>
  b2:	b1 df       	rcall	.-158    	; 0x16 <getBL>

000000b4 <loop1>:
  b4:	00 30       	cpi	r16, 0x00	; 0
  b6:	21 f0       	breq	.+8      	; 0xc0 <done1>
  b8:	9d 91       	ld	r25, X+
  ba:	3c d0       	rcall	.+120    	; 0x134 <uartSend>
  bc:	0a 95       	dec	r16
  be:	fa cf       	rjmp	.-12     	; 0xb4 <loop1>

000000c0 <done1>:
  c0:	08 95       	ret

000000c2 <printInvalidArg>:
  c2:	06 d0       	rcall	.+12     	; 0xd0 <setZInvalidArg>

000000c4 <loop3>:
  c4:	95 91       	lpm	r25, Z+
  c6:	90 30       	cpi	r25, 0x00	; 0
  c8:	11 f0       	breq	.+4      	; 0xce <done3>
  ca:	34 d0       	rcall	.+104    	; 0x134 <uartSend>
  cc:	fb cf       	rjmp	.-10     	; 0xc4 <loop3>

000000ce <done3>:
  ce:	08 95       	ret

000000d0 <setZInvalidArg>:
  d0:	f0 e0       	ldi	r31, 0x00	; 0
  d2:	e1 ef       	ldi	r30, 0xF1	; 241
  d4:	08 95       	ret

000000d6 <commandNotFound>:
  d6:	45 52       	subi	r20, 0x25	; 37
  d8:	52 4f       	sbci	r21, 0xF2	; 242
  da:	52 3a       	cpi	r21, 0xA2	; 162
  dc:	20 43       	sbci	r18, 0x30	; 48
  de:	6f 6d       	ori	r22, 0xDF	; 223
  e0:	6d 61       	ori	r22, 0x1D	; 29
  e2:	6e 64       	ori	r22, 0x4E	; 78
  e4:	20 6e       	ori	r18, 0xE0	; 224
  e6:	6f 74       	andi	r22, 0x4F	; 79
  e8:	20 66       	ori	r18, 0x60	; 96
  ea:	6f 75       	andi	r22, 0x5F	; 95
  ec:	6e 64       	ori	r22, 0x4E	; 78
  ee:	3a 20       	and	r3, r10
	...

000000f1 <invalidArg>:
  f1:	45 52       	subi	r20, 0x25	; 37
  f3:	52 4f       	sbci	r21, 0xF2	; 242
  f5:	52 3a       	cpi	r21, 0xA2	; 162
  f7:	20 49       	sbci	r18, 0x90	; 144
  f9:	6e 76       	andi	r22, 0x6E	; 110
  fb:	61 6c       	ori	r22, 0xC1	; 193
  fd:	69 64       	ori	r22, 0x49	; 73
  ff:	20 61       	ori	r18, 0x10	; 16
 101:	72 67       	ori	r23, 0x72	; 114
 103:	75 6d       	ori	r23, 0xD5	; 213
 105:	65 6e       	ori	r22, 0xE5	; 229
 107:	74 2f       	mov	r23, r20
 109:	73 20       	and	r7, r3
 10b:	70 72       	andi	r23, 0x20	; 32
 10d:	6f 76       	andi	r22, 0x6F	; 111
 10f:	69 64       	ori	r22, 0x49	; 73
 111:	65 64       	ori	r22, 0x45	; 69
	...

00000114 <resetZHex>:
 114:	f1 e0       	ldi	r31, 0x01	; 1
 116:	e0 ee       	ldi	r30, 0xE0	; 224
 118:	08 95       	ret

0000011a <uartInit>:
 11a:	08 e1       	ldi	r16, 0x18	; 24
 11c:	00 93 c1 00 	sts	0x00C1, r16	; 0x8000c1 <__DATA_REGION_ORIGIN__+0x61>
 120:	06 e0       	ldi	r16, 0x06	; 6
 122:	00 93 c2 00 	sts	0x00C2, r16	; 0x8000c2 <__DATA_REGION_ORIGIN__+0x62>
 126:	03 e0       	ldi	r16, 0x03	; 3
 128:	00 93 c4 00 	sts	0x00C4, r16	; 0x8000c4 <__DATA_REGION_ORIGIN__+0x64>
 12c:	00 e0       	ldi	r16, 0x00	; 0
 12e:	00 93 c5 00 	sts	0x00C5, r16	; 0x8000c5 <__DATA_REGION_ORIGIN__+0x65>
 132:	08 95       	ret

00000134 <uartSend>:
 134:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__DATA_REGION_ORIGIN__+0x60>
 138:	85 ff       	sbrs	r24, 5
 13a:	fc cf       	rjmp	.-8      	; 0x134 <uartSend>
 13c:	70 91 c0 00 	lds	r23, 0x00C0	; 0x8000c0 <__DATA_REGION_ORIGIN__+0x60>
 140:	70 64       	ori	r23, 0x40	; 64
 142:	70 93 c0 00 	sts	0x00C0, r23	; 0x8000c0 <__DATA_REGION_ORIGIN__+0x60>
 146:	90 93 c6 00 	sts	0x00C6, r25	; 0x8000c6 <__DATA_REGION_ORIGIN__+0x66>
 14a:	01 d0       	rcall	.+2      	; 0x14e <confirm_send>
 14c:	08 95       	ret

0000014e <confirm_send>:
 14e:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__DATA_REGION_ORIGIN__+0x60>
 152:	86 ff       	sbrs	r24, 6
 154:	fc cf       	rjmp	.-8      	; 0x14e <confirm_send>
 156:	08 95       	ret

00000158 <uartRecv>:
 158:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__DATA_REGION_ORIGIN__+0x60>
 15c:	87 ff       	sbrs	r24, 7
 15e:	fc cf       	rjmp	.-8      	; 0x158 <uartRecv>
 160:	90 91 c6 00 	lds	r25, 0x00C6	; 0x8000c6 <__DATA_REGION_ORIGIN__+0x66>
 164:	08 95       	ret

00000166 <uartSendHex>:
 166:	11 24       	eor	r1, r1
 168:	04 d0       	rcall	.+8      	; 0x172 <high_hex>
 16a:	d4 df       	rcall	.-88     	; 0x114 <resetZHex>
 16c:	0b d0       	rcall	.+22     	; 0x184 <low_hex>
 16e:	d2 df       	rcall	.-92     	; 0x114 <resetZHex>
 170:	08 95       	ret

00000172 <high_hex>:
 172:	65 2f       	mov	r22, r21
 174:	cf df       	rcall	.-98     	; 0x114 <resetZHex>
 176:	62 95       	swap	r22
 178:	6f 70       	andi	r22, 0x0F	; 15
 17a:	e6 0f       	add	r30, r22
 17c:	f1 1d       	adc	r31, r1
 17e:	94 91       	lpm	r25, Z
 180:	d9 df       	rcall	.-78     	; 0x134 <uartSend>
 182:	08 95       	ret

00000184 <low_hex>:
 184:	65 2f       	mov	r22, r21
 186:	c6 df       	rcall	.-116    	; 0x114 <resetZHex>
 188:	6f 70       	andi	r22, 0x0F	; 15
 18a:	e6 0f       	add	r30, r22
 18c:	f1 1d       	adc	r31, r1
 18e:	94 91       	lpm	r25, Z
 190:	d1 df       	rcall	.-94     	; 0x134 <uartSend>
 192:	08 95       	ret

00000194 <uartSendDec>:
 194:	13 d0       	rcall	.+38     	; 0x1bc <if_zero>

00000196 <continue>:
 196:	1d d0       	rcall	.+58     	; 0x1d2 <send_decimal>
 198:	90 e2       	ldi	r25, 0x20	; 32
 19a:	cc df       	rcall	.-104    	; 0x134 <uartSend>
 19c:	08 95       	ret

0000019e <hundreds>:
 19e:	54 36       	cpi	r21, 0x64	; 100
 1a0:	98 f0       	brcs	.+38     	; 0x1c8 <decimal_send>
 1a2:	63 95       	inc	r22
 1a4:	54 56       	subi	r21, 0x64	; 100
 1a6:	fb cf       	rjmp	.-10     	; 0x19e <hundreds>

000001a8 <tens>:
 1a8:	5a 30       	cpi	r21, 0x0A	; 10
 1aa:	70 f0       	brcs	.+28     	; 0x1c8 <decimal_send>
 1ac:	63 95       	inc	r22
 1ae:	5a 50       	subi	r21, 0x0A	; 10
 1b0:	fb cf       	rjmp	.-10     	; 0x1a8 <tens>

000001b2 <ones>:
 1b2:	51 30       	cpi	r21, 0x01	; 1
 1b4:	48 f0       	brcs	.+18     	; 0x1c8 <decimal_send>
 1b6:	63 95       	inc	r22
 1b8:	51 50       	subi	r21, 0x01	; 1
 1ba:	fb cf       	rjmp	.-10     	; 0x1b2 <ones>

000001bc <if_zero>:
 1bc:	55 23       	and	r21, r21
 1be:	09 f0       	breq	.+2      	; 0x1c2 <is_zero>
 1c0:	ea cf       	rjmp	.-44     	; 0x196 <continue>

000001c2 <is_zero>:
 1c2:	90 e3       	ldi	r25, 0x30	; 48
 1c4:	b7 df       	rcall	.-146    	; 0x134 <uartSend>
 1c6:	e7 cf       	rjmp	.-50     	; 0x196 <continue>

000001c8 <decimal_send>:
 1c8:	60 5d       	subi	r22, 0xD0	; 208
 1ca:	96 2f       	mov	r25, r22
 1cc:	b3 df       	rcall	.-154    	; 0x134 <uartSend>
 1ce:	66 27       	eor	r22, r22
 1d0:	00 c0       	rjmp	.+0      	; 0x1d2 <send_decimal>

000001d2 <send_decimal>:
 1d2:	54 36       	cpi	r21, 0x64	; 100
 1d4:	20 f7       	brcc	.-56     	; 0x19e <hundreds>
 1d6:	5a 30       	cpi	r21, 0x0A	; 10
 1d8:	38 f7       	brcc	.-50     	; 0x1a8 <tens>
 1da:	51 30       	cpi	r21, 0x01	; 1
 1dc:	50 f7       	brcc	.-44     	; 0x1b2 <ones>
 1de:	08 95       	ret

000001e0 <hex_list>:
 1e0:	30 31       	cpi	r19, 0x10	; 16
 1e2:	32 33       	cpi	r19, 0x32	; 50
 1e4:	34 35       	cpi	r19, 0x54	; 84
 1e6:	36 37       	cpi	r19, 0x76	; 118
 1e8:	38 39       	cpi	r19, 0x98	; 152
 1ea:	41 42       	sbci	r20, 0x21	; 33
 1ec:	43 44       	sbci	r20, 0x43	; 67
 1ee:	45 46       	sbci	r20, 0x65	; 101

000001f0 <terminalInit>:
 1f0:	2b d0       	rcall	.+86     	; 0x248 <terminalColorBG>
 1f2:	35 d0       	rcall	.+106    	; 0x25e <terminalColorTXT>
 1f4:	09 d0       	rcall	.+18     	; 0x208 <terminalClear>
 1f6:	11 d0       	rcall	.+34     	; 0x21a <terminalPrompt>
 1f8:	08 95       	ret

000001fa <terminalBackspace>:
 1fa:	98 e0       	ldi	r25, 0x08	; 8
 1fc:	9b df       	rcall	.-202    	; 0x134 <uartSend>
 1fe:	90 e2       	ldi	r25, 0x20	; 32
 200:	99 df       	rcall	.-206    	; 0x134 <uartSend>
 202:	98 e0       	ldi	r25, 0x08	; 8
 204:	97 df       	rcall	.-210    	; 0x134 <uartSend>
 206:	08 95       	ret

00000208 <terminalClear>:
 208:	9b e1       	ldi	r25, 0x1B	; 27
 20a:	94 df       	rcall	.-216    	; 0x134 <uartSend>
 20c:	9b e5       	ldi	r25, 0x5B	; 91
 20e:	92 df       	rcall	.-220    	; 0x134 <uartSend>
 210:	92 e3       	ldi	r25, 0x32	; 50
 212:	90 df       	rcall	.-224    	; 0x134 <uartSend>
 214:	9a e4       	ldi	r25, 0x4A	; 74
 216:	8e df       	rcall	.-228    	; 0x134 <uartSend>
 218:	08 95       	ret

0000021a <terminalPrompt>:
 21a:	91 e6       	ldi	r25, 0x61	; 97
 21c:	8b df       	rcall	.-234    	; 0x134 <uartSend>
 21e:	96 e7       	ldi	r25, 0x76	; 118
 220:	89 df       	rcall	.-238    	; 0x134 <uartSend>
 222:	92 e7       	ldi	r25, 0x72	; 114
 224:	87 df       	rcall	.-242    	; 0x134 <uartSend>
 226:	9e e3       	ldi	r25, 0x3E	; 62
 228:	85 df       	rcall	.-246    	; 0x134 <uartSend>
 22a:	08 95       	ret

0000022c <terminalEnter>:
 22c:	02 d0       	rcall	.+4      	; 0x232 <terminalNewLine>
 22e:	f5 df       	rcall	.-22     	; 0x21a <terminalPrompt>
 230:	08 95       	ret

00000232 <terminalNewLine>:
 232:	9a e0       	ldi	r25, 0x0A	; 10
 234:	7f df       	rcall	.-258    	; 0x134 <uartSend>
 236:	9d e0       	ldi	r25, 0x0D	; 13
 238:	7d df       	rcall	.-262    	; 0x134 <uartSend>
 23a:	9b e1       	ldi	r25, 0x1B	; 27
 23c:	7b df       	rcall	.-266    	; 0x134 <uartSend>
 23e:	9b e5       	ldi	r25, 0x5B	; 91
 240:	79 df       	rcall	.-270    	; 0x134 <uartSend>
 242:	9b e4       	ldi	r25, 0x4B	; 75
 244:	77 df       	rcall	.-274    	; 0x134 <uartSend>
 246:	08 95       	ret

00000248 <terminalColorBG>:
 248:	9b e1       	ldi	r25, 0x1B	; 27
 24a:	74 df       	rcall	.-280    	; 0x134 <uartSend>
 24c:	9b e5       	ldi	r25, 0x5B	; 91
 24e:	72 df       	rcall	.-284    	; 0x134 <uartSend>
 250:	94 e3       	ldi	r25, 0x34	; 52
 252:	70 df       	rcall	.-288    	; 0x134 <uartSend>
 254:	94 e3       	ldi	r25, 0x34	; 52
 256:	6e df       	rcall	.-292    	; 0x134 <uartSend>
 258:	9d e6       	ldi	r25, 0x6D	; 109
 25a:	6c df       	rcall	.-296    	; 0x134 <uartSend>
 25c:	08 95       	ret

0000025e <terminalColorTXT>:
 25e:	9b e1       	ldi	r25, 0x1B	; 27
 260:	69 df       	rcall	.-302    	; 0x134 <uartSend>
 262:	9b e5       	ldi	r25, 0x5B	; 91
 264:	67 df       	rcall	.-306    	; 0x134 <uartSend>
 266:	99 e3       	ldi	r25, 0x39	; 57
 268:	65 df       	rcall	.-310    	; 0x134 <uartSend>
 26a:	97 e3       	ldi	r25, 0x37	; 55
 26c:	63 df       	rcall	.-314    	; 0x134 <uartSend>
 26e:	9d e6       	ldi	r25, 0x6D	; 109
 270:	61 df       	rcall	.-318    	; 0x134 <uartSend>
 272:	08 95       	ret

00000274 <setZHelpMessage>:
 274:	f2 e0       	ldi	r31, 0x02	; 2
 276:	e0 e9       	ldi	r30, 0x90	; 144
 278:	08 95       	ret

0000027a <helpCommand>:
 27a:	fc df       	rcall	.-8      	; 0x274 <setZHelpMessage>

0000027c <loop1>:
 27c:	95 91       	lpm	r25, Z+
 27e:	90 30       	cpi	r25, 0x00	; 0
 280:	21 f0       	breq	.+8      	; 0x28a <done1>
 282:	9d 30       	cpi	r25, 0x0D	; 13
 284:	19 f0       	breq	.+6      	; 0x28c <newLine1>
 286:	56 df       	rcall	.-340    	; 0x134 <uartSend>
 288:	f9 cf       	rjmp	.-14     	; 0x27c <loop1>

0000028a <done1>:
 28a:	08 95       	ret

0000028c <newLine1>:
 28c:	d2 df       	rcall	.-92     	; 0x232 <terminalNewLine>
 28e:	f6 cf       	rjmp	.-20     	; 0x27c <loop1>

00000290 <helpMessage>:
 290:	68 65       	ori	r22, 0x58	; 88
 292:	6c 70       	andi	r22, 0x0C	; 12
 294:	20 2d       	mov	r18, r0
 296:	20 64       	ori	r18, 0x40	; 64
 298:	69 73       	andi	r22, 0x39	; 57
 29a:	70 6c       	ori	r23, 0xC0	; 192
 29c:	61 79       	andi	r22, 0x91	; 145
 29e:	20 74       	andi	r18, 0x40	; 64
 2a0:	68 69       	ori	r22, 0x98	; 152
 2a2:	73 20       	and	r7, r3
 2a4:	6c 69       	ori	r22, 0x9C	; 156
 2a6:	73 74       	andi	r23, 0x43	; 67
 2a8:	0d 69       	ori	r16, 0x9D	; 157
 2aa:	6e 66       	ori	r22, 0x6E	; 110
 2ac:	6f 20       	and	r6, r15
 2ae:	2d 20       	and	r2, r13
 2b0:	64 69       	ori	r22, 0x94	; 148
 2b2:	73 70       	andi	r23, 0x03	; 3
 2b4:	6c 61       	ori	r22, 0x1C	; 28
 2b6:	79 20       	and	r7, r9
 2b8:	73 79       	andi	r23, 0x93	; 147
 2ba:	73 74       	andi	r23, 0x43	; 67
 2bc:	65 6d       	ori	r22, 0xD5	; 213
 2be:	20 69       	ori	r18, 0x90	; 144
 2c0:	6e 66       	ori	r22, 0x6E	; 110
 2c2:	6f 0d       	add	r22, r15
 2c4:	72 65       	ori	r23, 0x52	; 82
 2c6:	67 73       	andi	r22, 0x37	; 55
 2c8:	20 2d       	mov	r18, r0
 2ca:	20 64       	ori	r18, 0x40	; 64
 2cc:	69 73       	andi	r22, 0x39	; 57
 2ce:	70 6c       	ori	r23, 0xC0	; 192
 2d0:	61 79       	andi	r22, 0x91	; 145
 2d2:	20 61       	ori	r18, 0x10	; 16
 2d4:	6c 6c       	ori	r22, 0xCC	; 204
 2d6:	20 72       	andi	r18, 0x20	; 32
 2d8:	65 67       	ori	r22, 0x75	; 117
 2da:	69 73       	andi	r22, 0x39	; 57
 2dc:	74 65       	ori	r23, 0x54	; 84
 2de:	72 20       	and	r7, r2
 2e0:	76 61       	ori	r23, 0x16	; 22
 2e2:	6c 75       	andi	r22, 0x5C	; 92
 2e4:	65 73       	andi	r22, 0x35	; 53
 2e6:	0d 63       	ori	r16, 0x3D	; 61
 2e8:	6c 65       	ori	r22, 0x5C	; 92
 2ea:	61 72       	andi	r22, 0x21	; 33
 2ec:	20 2d       	mov	r18, r0
 2ee:	20 63       	ori	r18, 0x30	; 48
 2f0:	6c 65       	ori	r22, 0x5C	; 92
 2f2:	61 72       	andi	r22, 0x21	; 33
 2f4:	20 64       	ori	r18, 0x40	; 64
 2f6:	69 73       	andi	r22, 0x39	; 57
 2f8:	70 6c       	ori	r23, 0xC0	; 192
 2fa:	61 79       	andi	r22, 0x91	; 145
 2fc:	0d 65       	ori	r16, 0x5D	; 93
 2fe:	63 68       	ori	r22, 0x83	; 131
 300:	6f 20       	and	r6, r15
 302:	2d 20       	and	r2, r13
 304:	70 72       	andi	r23, 0x20	; 32
 306:	69 6e       	ori	r22, 0xE9	; 233
 308:	74 20       	and	r7, r4
 30a:	61 72       	andi	r22, 0x21	; 33
 30c:	67 75       	andi	r22, 0x57	; 87
 30e:	6d 65       	ori	r22, 0x5D	; 93
 310:	6e 74       	andi	r22, 0x4E	; 78
 312:	0d 6d       	ori	r16, 0xDD	; 221
 314:	72 65       	ori	r23, 0x52	; 82
 316:	61 64       	ori	r22, 0x41	; 65
 318:	20 2d       	mov	r18, r0
 31a:	20 72       	andi	r18, 0x20	; 32
 31c:	65 61       	ori	r22, 0x15	; 21
 31e:	64 20       	and	r6, r4
 320:	64 61       	ori	r22, 0x14	; 20
 322:	74 61       	ori	r23, 0x14	; 20
 324:	20 6d       	ori	r18, 0xD0	; 208
 326:	65 6d       	ori	r22, 0xD5	; 213
 328:	6f 72       	andi	r22, 0x2F	; 47
 32a:	79 28       	or	r7, r9
 32c:	63 68       	ori	r22, 0x83	; 131
 32e:	65 63       	ori	r22, 0x35	; 53
 330:	6b 20       	and	r6, r11
 332:	52 45       	sbci	r21, 0x52	; 82
 334:	41 44       	sbci	r20, 0x41	; 65
 336:	4d 45       	sbci	r20, 0x5D	; 93
 338:	2e 6d       	ori	r18, 0xDE	; 222
 33a:	64 29       	or	r22, r4
 33c:	0d 6d       	ori	r16, 0xDD	; 221
 33e:	77 72       	andi	r23, 0x27	; 39
 340:	69 74       	andi	r22, 0x49	; 73
 342:	65 20       	and	r6, r5
 344:	2d 20       	and	r2, r13
 346:	77 72       	andi	r23, 0x27	; 39
 348:	69 74       	andi	r22, 0x49	; 73
 34a:	65 20       	and	r6, r5
 34c:	74 6f       	ori	r23, 0xF4	; 244
 34e:	20 64       	ori	r18, 0x40	; 64
 350:	61 74       	andi	r22, 0x41	; 65
 352:	61 20       	and	r6, r1
 354:	6d 65       	ori	r22, 0x5D	; 93
 356:	6d 6f       	ori	r22, 0xFD	; 253
 358:	72 79       	andi	r23, 0x92	; 146
 35a:	28 63       	ori	r18, 0x38	; 56
 35c:	68 65       	ori	r22, 0x58	; 88
 35e:	63 6b       	ori	r22, 0xB3	; 179
 360:	20 52       	subi	r18, 0x20	; 32
 362:	45 41       	sbci	r20, 0x15	; 21
 364:	44 4d       	sbci	r20, 0xD4	; 212
 366:	45 2e       	mov	r4, r21
 368:	6d 64       	ori	r22, 0x4D	; 77
 36a:	29 0d       	add	r18, r9
 36c:	69 6a       	ori	r22, 0xA9	; 169
 36e:	6d 70       	andi	r22, 0x0D	; 13
 370:	20 2d       	mov	r18, r0
 372:	20 69       	ori	r18, 0x90	; 144
 374:	6e 64       	ori	r22, 0x4E	; 78
 376:	69 72       	andi	r22, 0x29	; 41
 378:	65 63       	ori	r22, 0x35	; 53
 37a:	74 20       	and	r7, r4
 37c:	6a 75       	andi	r22, 0x5A	; 90
 37e:	6d 70       	andi	r22, 0x0D	; 13
 380:	20 74       	andi	r18, 0x40	; 64
 382:	6f 20       	and	r6, r15
 384:	61 64       	ori	r22, 0x41	; 65
 386:	64 72       	andi	r22, 0x24	; 36
 388:	65 73       	andi	r22, 0x35	; 53
 38a:	73 20       	and	r7, r3
 38c:	28 63       	ori	r18, 0x38	; 56
 38e:	68 65       	ori	r22, 0x58	; 88
 390:	63 6b       	ori	r22, 0xB3	; 179
 392:	20 52       	subi	r18, 0x20	; 32
 394:	45 41       	sbci	r20, 0x15	; 21
 396:	44 4d       	sbci	r20, 0xD4	; 212
 398:	45 2e       	mov	r4, r21
 39a:	6d 64       	ori	r22, 0x4D	; 77
 39c:	29 00       	.word	0x0029	; ????

0000039e <clearCommand>:
 39e:	34 df       	rcall	.-408    	; 0x208 <terminalClear>
 3a0:	08 95       	ret

000003a2 <setZInfoMessage>:
 3a2:	f3 e0       	ldi	r31, 0x03	; 3
 3a4:	ee eb       	ldi	r30, 0xBE	; 190
 3a6:	08 95       	ret

000003a8 <infoCommand>:
 3a8:	fc df       	rcall	.-8      	; 0x3a2 <setZInfoMessage>

000003aa <loop1>:
 3aa:	95 91       	lpm	r25, Z+
 3ac:	90 30       	cpi	r25, 0x00	; 0
 3ae:	21 f0       	breq	.+8      	; 0x3b8 <done1>
 3b0:	9d 30       	cpi	r25, 0x0D	; 13
 3b2:	19 f0       	breq	.+6      	; 0x3ba <newLine>
 3b4:	bf de       	rcall	.-642    	; 0x134 <uartSend>
 3b6:	f9 cf       	rjmp	.-14     	; 0x3aa <loop1>

000003b8 <done1>:
 3b8:	08 95       	ret

000003ba <newLine>:
 3ba:	3b df       	rcall	.-394    	; 0x232 <terminalNewLine>
 3bc:	f6 cf       	rjmp	.-20     	; 0x3aa <loop1>

000003be <infoMessage>:
 3be:	20 20       	and	r2, r0
 3c0:	20 20       	and	r2, r0
 3c2:	20 20       	and	r2, r0
 3c4:	5f 09       	sbc	r21, r15
 3c6:	20 20       	and	r2, r0
 3c8:	20 20       	and	r2, r0
 3ca:	20 20       	and	r2, r0
 3cc:	20 20       	and	r2, r0
 3ce:	5f 5f       	subi	r21, 0xFF	; 255
 3d0:	5f 5f       	subi	r21, 0xFF	; 255
 3d2:	5f 5f       	subi	r21, 0xFF	; 255
 3d4:	5f 2e       	mov	r5, r31
 3d6:	09 43       	sbci	r16, 0x39	; 57
 3d8:	50 55       	subi	r21, 0x50	; 80
 3da:	3a 20       	and	r3, r10
 3dc:	41 54       	subi	r20, 0x41	; 65
 3de:	6d 65       	ori	r22, 0x5D	; 93
 3e0:	67 61       	ori	r22, 0x17	; 23
 3e2:	33 32       	cpi	r19, 0x23	; 35
 3e4:	38 70       	andi	r19, 0x08	; 8
 3e6:	0d 20       	and	r0, r13
 3e8:	20 20       	and	r2, r0
 3ea:	20 20       	and	r2, r0
 3ec:	2f 40       	sbci	r18, 0x0F	; 15
 3ee:	2e 20       	and	r2, r14
 3f0:	20 20       	and	r2, r0
 3f2:	20 20       	and	r2, r0
 3f4:	20 20       	and	r2, r0
 3f6:	2f 40       	sbci	r18, 0x0F	; 15
 3f8:	40 40       	sbci	r20, 0x00	; 0
 3fa:	40 40       	sbci	r20, 0x00	; 0
 3fc:	40 40       	sbci	r20, 0x00	; 0
 3fe:	40 2e       	mov	r4, r16
 400:	09 53       	subi	r16, 0x39	; 57
 402:	52 41       	sbci	r21, 0x12	; 18
 404:	4d 3a       	cpi	r20, 0xAD	; 173
 406:	20 32       	cpi	r18, 0x20	; 32
 408:	4b 69       	ori	r20, 0x9B	; 155
 40a:	42 0d       	add	r20, r2
 40c:	20 20       	and	r2, r0
 40e:	20 20       	and	r2, r0
 410:	2f 40       	sbci	r18, 0x0F	; 15
 412:	5e 40       	sbci	r21, 0x0E	; 14
 414:	2e 20       	and	r2, r14
 416:	20 20       	and	r2, r0
 418:	20 20       	and	r2, r0
 41a:	2f 40       	sbci	r18, 0x0F	; 15
 41c:	2f 60       	ori	r18, 0x0F	; 15
 41e:	60 60       	ori	r22, 0x00	; 0
 420:	60 60       	ori	r22, 0x00	; 0
 422:	60 40       	sbci	r22, 0x00	; 0
 424:	40 2e       	mov	r4, r16
 426:	09 46       	sbci	r16, 0x69	; 105
 428:	4c 41       	sbci	r20, 0x1C	; 28
 42a:	53 48       	sbci	r21, 0x83	; 131
 42c:	3a 20       	and	r3, r10
 42e:	33 32       	cpi	r19, 0x23	; 35
 430:	4b 69       	ori	r20, 0x9B	; 155
 432:	42 0d       	add	r20, r2
 434:	20 20       	and	r2, r0
 436:	20 2f       	mov	r18, r16
 438:	40 2f       	mov	r20, r16
 43a:	5f 60       	ori	r21, 0x0F	; 15
 43c:	40 2e       	mov	r4, r16
 43e:	20 20       	and	r2, r0
 440:	20 2f       	mov	r18, r16
 442:	40 40       	sbci	r20, 0x00	; 0
 444:	40 40       	sbci	r20, 0x00	; 0
 446:	40 40       	sbci	r20, 0x00	; 0
 448:	40 40       	sbci	r20, 0x00	; 0
 44a:	40 40       	sbci	r20, 0x00	; 0
 44c:	2f 09       	sbc	r18, r15
 44e:	45 45       	sbci	r20, 0x55	; 85
 450:	50 52       	subi	r21, 0x20	; 32
 452:	4f 4d       	sbci	r20, 0xDF	; 223
 454:	3a 20       	and	r3, r10
 456:	31 4b       	sbci	r19, 0xB1	; 177
 458:	69 42       	sbci	r22, 0x29	; 41
 45a:	0d 20       	and	r0, r13
 45c:	20 2f       	mov	r18, r16
 45e:	40 40       	sbci	r20, 0x00	; 0
 460:	40 40       	sbci	r20, 0x00	; 0
 462:	40 40       	sbci	r20, 0x00	; 0
 464:	40 2e       	mov	r4, r16
 466:	20 2f       	mov	r18, r16
 468:	40 40       	sbci	r20, 0x00	; 0
 46a:	40 40       	sbci	r20, 0x00	; 0
 46c:	2e 60       	ori	r18, 0x0E	; 14
 46e:	60 60       	ori	r22, 0x00	; 0
 470:	60 60       	ori	r22, 0x00	; 0
 472:	60 09       	sbc	r22, r0
 474:	41 56       	subi	r20, 0x61	; 97
 476:	52 3a       	cpi	r21, 0xA2	; 162
 478:	20 31       	cpi	r18, 0x10	; 16
 47a:	30 30       	cpi	r19, 0x00	; 0
 47c:	25 0d       	add	r18, r5
 47e:	20 2f       	mov	r18, r16
 480:	40 2f       	mov	r20, r16
 482:	60 60       	ori	r22, 0x00	; 0
 484:	60 60       	ori	r22, 0x00	; 0
 486:	60 40       	sbci	r22, 0x00	; 0
 488:	40 56       	subi	r20, 0x60	; 96
 48a:	40 2f       	mov	r20, r16
 48c:	60 40       	sbci	r22, 0x00	; 0
 48e:	40 40       	sbci	r20, 0x00	; 0
 490:	40 2e       	mov	r4, r16
 492:	09 09       	sbc	r16, r9
 494:	56 45       	sbci	r21, 0x56	; 86
 496:	52 53       	subi	r21, 0x32	; 50
 498:	49 4f       	sbci	r20, 0xF9	; 249
 49a:	4e 3a       	cpi	r20, 0xAE	; 174
 49c:	20 30       	cpi	r18, 0x00	; 0
 49e:	2e 31       	cpi	r18, 0x1E	; 30
 4a0:	2e 30       	cpi	r18, 0x0E	; 14
 4a2:	2d 61       	ori	r18, 0x1D	; 29
 4a4:	6c 70       	andi	r22, 0x0C	; 12
 4a6:	68 61       	ori	r22, 0x18	; 24
 4a8:	0d 2f       	mov	r16, r29
 4aa:	40 2f       	mov	r20, r16
 4ac:	20 20       	and	r2, r0
 4ae:	20 20       	and	r2, r0
 4b0:	20 20       	and	r2, r0
 4b2:	60 40       	sbci	r22, 0x00	; 0
 4b4:	40 2f       	mov	r20, r16
 4b6:	20 20       	and	r2, r0
 4b8:	20 20       	and	r2, r0
 4ba:	60 40       	sbci	r22, 0x00	; 0
 4bc:	40 40       	sbci	r20, 0x00	; 0
 4be:	40 2e       	mov	r4, r16
	...

000004c2 <bufferAdd>:
 4c2:	07 d0       	rcall	.+14     	; 0x4d2 <incBL>
 4c4:	01 32       	cpi	r16, 0x21	; 33
 4c6:	e9 f0       	breq	.+58     	; 0x502 <overflow>
 4c8:	9d 93       	st	X+, r25
 4ca:	08 95       	ret

000004cc <bufferDel>:
 4cc:	07 d0       	rcall	.+14     	; 0x4dc <decBL>
 4ce:	11 97       	sbiw	r26, 0x01	; 1
 4d0:	08 95       	ret

000004d2 <incBL>:
 4d2:	11 d0       	rcall	.+34     	; 0x4f6 <setYBL>
 4d4:	08 81       	ld	r16, Y
 4d6:	03 95       	inc	r16
 4d8:	08 83       	st	Y, r16
 4da:	08 95       	ret

000004dc <decBL>:
 4dc:	0c d0       	rcall	.+24     	; 0x4f6 <setYBL>
 4de:	08 81       	ld	r16, Y
 4e0:	0a 95       	dec	r16
 4e2:	08 83       	st	Y, r16
 4e4:	08 95       	ret

000004e6 <bufferReset>:
 4e6:	04 d0       	rcall	.+8      	; 0x4f0 <resetXBuffer>
 4e8:	06 d0       	rcall	.+12     	; 0x4f6 <setYBL>
 4ea:	00 e0       	ldi	r16, 0x00	; 0
 4ec:	08 83       	st	Y, r16
 4ee:	08 95       	ret

000004f0 <resetXBuffer>:
 4f0:	b1 e0       	ldi	r27, 0x01	; 1
 4f2:	a0 e0       	ldi	r26, 0x00	; 0
 4f4:	08 95       	ret

000004f6 <setYBL>:
 4f6:	d1 e0       	ldi	r29, 0x01	; 1
 4f8:	c0 e2       	ldi	r28, 0x20	; 32
 4fa:	08 95       	ret

000004fc <setZErrorOverflow>:
 4fc:	f5 e0       	ldi	r31, 0x05	; 5
 4fe:	e8 e1       	ldi	r30, 0x18	; 24
 500:	08 95       	ret

00000502 <overflow>:
 502:	f1 df       	rcall	.-30     	; 0x4e6 <bufferReset>
 504:	fb df       	rcall	.-10     	; 0x4fc <setZErrorOverflow>
 506:	95 de       	rcall	.-726    	; 0x232 <terminalNewLine>

00000508 <loop1>:
 508:	95 91       	lpm	r25, Z+
 50a:	99 23       	and	r25, r25
 50c:	11 f0       	breq	.+4      	; 0x512 <done1>
 50e:	12 de       	rcall	.-988    	; 0x134 <uartSend>
 510:	fb cf       	rjmp	.-10     	; 0x508 <loop1>

00000512 <done1>:
 512:	8c de       	rcall	.-744    	; 0x22c <terminalEnter>
 514:	99 27       	eor	r25, r25
 516:	08 95       	ret

00000518 <errorOverflow>:
 518:	45 52       	subi	r20, 0x25	; 37
 51a:	52 4f       	sbci	r21, 0xF2	; 242
 51c:	52 3a       	cpi	r21, 0xA2	; 162
 51e:	20 4f       	sbci	r18, 0xF0	; 240
 520:	56 45       	sbci	r21, 0x56	; 86
 522:	52 46       	sbci	r21, 0x62	; 98
 524:	4c 4f       	sbci	r20, 0xFC	; 252
 526:	57 20       	and	r5, r7
 528:	33 32       	cpi	r19, 0x23	; 35
 52a:	20 63       	ori	r18, 0x30	; 48
 52c:	68 61       	ori	r22, 0x18	; 24
 52e:	72 61       	ori	r23, 0x12	; 18
 530:	63 74       	andi	r22, 0x43	; 67
 532:	65 72       	andi	r22, 0x25	; 37
 534:	20 6c       	ori	r18, 0xC0	; 192
 536:	69 6d       	ori	r22, 0xD9	; 217
 538:	69 74       	andi	r22, 0x49	; 73
 53a:	21 00       	.word	0x0021	; ????

0000053c <parseCommand>:
 53c:	f9 d0       	rcall	.+498    	; 0x730 <restoreBL>
 53e:	07 c0       	rjmp	.+14     	; 0x54e <variableLength>

00000540 <notVariableLength>:
 540:	04 30       	cpi	r16, 0x04	; 4
 542:	09 f4       	brne	.+2      	; 0x546 <notChar4>
 544:	b8 c0       	rjmp	.+368    	; 0x6b6 <char4>

00000546 <notChar4>:
 546:	05 30       	cpi	r16, 0x05	; 5
 548:	09 f4       	brne	.+2      	; 0x54c <notChar5>
 54a:	af c0       	rjmp	.+350    	; 0x6aa <char5>

0000054c <notChar5>:
 54c:	d2 c0       	rjmp	.+420    	; 0x6f2 <invalidCommand>

0000054e <variableLength>:
 54e:	40 ef       	ldi	r20, 0xF0	; 240
 550:	e0 d0       	rcall	.+448    	; 0x712 <setZEcho>
 552:	04 e0       	ldi	r16, 0x04	; 4
 554:	c1 d0       	rcall	.+386    	; 0x6d8 <noRestoreBL>
 556:	31 30       	cpi	r19, 0x01	; 1
 558:	09 f4       	brne	.+2      	; 0x55c <notEcho>
 55a:	85 c0       	rjmp	.+266    	; 0x666 <isEcho>

0000055c <notEcho>:
 55c:	e9 d0       	rcall	.+466    	; 0x730 <restoreBL>
 55e:	dc d0       	rcall	.+440    	; 0x718 <setZIndirectJump>
 560:	04 e0       	ldi	r16, 0x04	; 4
 562:	ba d0       	rcall	.+372    	; 0x6d8 <noRestoreBL>
 564:	31 30       	cpi	r19, 0x01	; 1
 566:	09 f4       	brne	.+2      	; 0x56a <notIjmp>
 568:	5b c0       	rjmp	.+182    	; 0x620 <isIjmp>

0000056a <notIjmp>:
 56a:	e2 d0       	rcall	.+452    	; 0x730 <restoreBL>
 56c:	db d0       	rcall	.+438    	; 0x724 <setZMread>
 56e:	05 e0       	ldi	r16, 0x05	; 5
 570:	b3 d0       	rcall	.+358    	; 0x6d8 <noRestoreBL>
 572:	31 30       	cpi	r19, 0x01	; 1
 574:	09 f4       	brne	.+2      	; 0x578 <notMread>
 576:	34 c0       	rjmp	.+104    	; 0x5e0 <isMread>

00000578 <notMread>:
 578:	db d0       	rcall	.+438    	; 0x730 <restoreBL>
 57a:	d1 d0       	rcall	.+418    	; 0x71e <setZMwrite>
 57c:	06 e0       	ldi	r16, 0x06	; 6
 57e:	ac d0       	rcall	.+344    	; 0x6d8 <noRestoreBL>
 580:	31 30       	cpi	r19, 0x01	; 1
 582:	09 f4       	brne	.+2      	; 0x586 <notMwrite>
 584:	02 c0       	rjmp	.+4      	; 0x58a <isMwrite>

00000586 <notMwrite>:
 586:	d4 d0       	rcall	.+424    	; 0x730 <restoreBL>
 588:	db cf       	rjmp	.-74     	; 0x540 <notVariableLength>

0000058a <isMwrite>:
 58a:	d2 d0       	rcall	.+420    	; 0x730 <restoreBL>
 58c:	06 30       	cpi	r16, 0x06	; 6
 58e:	09 f4       	brne	.+2      	; 0x592 <mwriteNot6>
 590:	89 c0       	rjmp	.+274    	; 0x6a4 <invalidArgument>

00000592 <mwriteNot6>:
 592:	07 30       	cpi	r16, 0x07	; 7
 594:	39 f4       	brne	.+14     	; 0x5a4 <mwriteNot7>
 596:	c9 d0       	rcall	.+402    	; 0x72a <setZSpace>
 598:	01 e0       	ldi	r16, 0x01	; 1
 59a:	9f d0       	rcall	.+318    	; 0x6da <check>
 59c:	31 30       	cpi	r19, 0x01	; 1
 59e:	09 f0       	breq	.+2      	; 0x5a2 <mwrite7Valid>
 5a0:	a8 c0       	rjmp	.+336    	; 0x6f2 <invalidCommand>

000005a2 <mwrite7Valid>:
 5a2:	80 c0       	rjmp	.+256    	; 0x6a4 <invalidArgument>

000005a4 <mwriteNot7>:
 5a4:	c2 d0       	rcall	.+388    	; 0x72a <setZSpace>
 5a6:	01 e0       	ldi	r16, 0x01	; 1
 5a8:	98 d0       	rcall	.+304    	; 0x6da <check>
 5aa:	09 f0       	breq	.+2      	; 0x5ae <mwrite0>
 5ac:	a2 c0       	rjmp	.+324    	; 0x6f2 <invalidCommand>

000005ae <mwrite0>:
 5ae:	12 e0       	ldi	r17, 0x02	; 2
 5b0:	e3 d1       	rcall	.+966    	; 0x978 <ahtoi>
 5b2:	33 23       	and	r19, r19
 5b4:	09 f4       	brne	.+2      	; 0x5b8 <mwriteADDRInvalid>
 5b6:	01 c0       	rjmp	.+2      	; 0x5ba <mwriteRange>

000005b8 <mwriteADDRInvalid>:
 5b8:	75 c0       	rjmp	.+234    	; 0x6a4 <invalidArgument>

000005ba <mwriteRange>:
 5ba:	d9 30       	cpi	r29, 0x09	; 9
 5bc:	08 f0       	brcs	.+2      	; 0x5c0 <mwriteADDRValid>
 5be:	72 c0       	rjmp	.+228    	; 0x6a4 <invalidArgument>

000005c0 <mwriteADDRValid>:
 5c0:	b4 d0       	rcall	.+360    	; 0x72a <setZSpace>
 5c2:	01 e0       	ldi	r16, 0x01	; 1
 5c4:	8a d0       	rcall	.+276    	; 0x6da <check>
 5c6:	31 30       	cpi	r19, 0x01	; 1
 5c8:	09 f0       	breq	.+2      	; 0x5cc <mwriteADDRValid0>
 5ca:	6c c0       	rjmp	.+216    	; 0x6a4 <invalidArgument>

000005cc <mwriteADDRValid0>:
 5cc:	cc 2e       	mov	r12, r28
 5ce:	dd 2e       	mov	r13, r29
 5d0:	11 e0       	ldi	r17, 0x01	; 1
 5d2:	d2 d1       	rcall	.+932    	; 0x978 <ahtoi>
 5d4:	cc 2d       	mov	r28, r12
 5d6:	dd 2d       	mov	r29, r13
 5d8:	33 23       	and	r19, r19
 5da:	09 f4       	brne	.+2      	; 0x5de <mwriteADDR0VALUEInvalid>
 5dc:	7a c0       	rjmp	.+244    	; 0x6d2 <done>

000005de <mwriteADDR0VALUEInvalid>:
 5de:	62 c0       	rjmp	.+196    	; 0x6a4 <invalidArgument>

000005e0 <isMread>:
 5e0:	a7 d0       	rcall	.+334    	; 0x730 <restoreBL>
 5e2:	05 30       	cpi	r16, 0x05	; 5
 5e4:	09 f4       	brne	.+2      	; 0x5e8 <mreadNot5>
 5e6:	5e c0       	rjmp	.+188    	; 0x6a4 <invalidArgument>

000005e8 <mreadNot5>:
 5e8:	06 30       	cpi	r16, 0x06	; 6
 5ea:	39 f4       	brne	.+14     	; 0x5fa <mreadNot6>
 5ec:	9e d0       	rcall	.+316    	; 0x72a <setZSpace>
 5ee:	01 e0       	ldi	r16, 0x01	; 1
 5f0:	74 d0       	rcall	.+232    	; 0x6da <check>
 5f2:	31 30       	cpi	r19, 0x01	; 1
 5f4:	09 f0       	breq	.+2      	; 0x5f8 <mread6Valid>
 5f6:	7d c0       	rjmp	.+250    	; 0x6f2 <invalidCommand>

000005f8 <mread6Valid>:
 5f8:	55 c0       	rjmp	.+170    	; 0x6a4 <invalidArgument>

000005fa <mreadNot6>:
 5fa:	0a 30       	cpi	r16, 0x0A	; 10
 5fc:	31 f4       	brne	.+12     	; 0x60a <mreadNot10>
 5fe:	95 d0       	rcall	.+298    	; 0x72a <setZSpace>
 600:	01 e0       	ldi	r16, 0x01	; 1
 602:	6b d0       	rcall	.+214    	; 0x6da <check>
 604:	31 30       	cpi	r19, 0x01	; 1
 606:	11 f0       	breq	.+4      	; 0x60c <mreadADDR>
 608:	74 c0       	rjmp	.+232    	; 0x6f2 <invalidCommand>

0000060a <mreadNot10>:
 60a:	4c c0       	rjmp	.+152    	; 0x6a4 <invalidArgument>

0000060c <mreadADDR>:
 60c:	12 e0       	ldi	r17, 0x02	; 2
 60e:	b4 d1       	rcall	.+872    	; 0x978 <ahtoi>
 610:	33 23       	and	r19, r19
 612:	09 f4       	brne	.+2      	; 0x616 <mreadADDRInvalid>
 614:	01 c0       	rjmp	.+2      	; 0x618 <mreadRange>

00000616 <mreadADDRInvalid>:
 616:	46 c0       	rjmp	.+140    	; 0x6a4 <invalidArgument>

00000618 <mreadRange>:
 618:	d9 30       	cpi	r29, 0x09	; 9
 61a:	08 f0       	brcs	.+2      	; 0x61e <mreadValid>
 61c:	43 c0       	rjmp	.+134    	; 0x6a4 <invalidArgument>

0000061e <mreadValid>:
 61e:	59 c0       	rjmp	.+178    	; 0x6d2 <done>

00000620 <isIjmp>:
 620:	87 d0       	rcall	.+270    	; 0x730 <restoreBL>
 622:	04 30       	cpi	r16, 0x04	; 4
 624:	09 f4       	brne	.+2      	; 0x628 <ijmpNot4>
 626:	3e c0       	rjmp	.+124    	; 0x6a4 <invalidArgument>

00000628 <ijmpNot4>:
 628:	05 30       	cpi	r16, 0x05	; 5
 62a:	39 f4       	brne	.+14     	; 0x63a <ijmpNot5>
 62c:	7e d0       	rcall	.+252    	; 0x72a <setZSpace>
 62e:	01 e0       	ldi	r16, 0x01	; 1
 630:	54 d0       	rcall	.+168    	; 0x6da <check>
 632:	31 30       	cpi	r19, 0x01	; 1
 634:	09 f0       	breq	.+2      	; 0x638 <ijmp5Valid>
 636:	5d c0       	rjmp	.+186    	; 0x6f2 <invalidCommand>

00000638 <ijmp5Valid>:
 638:	35 c0       	rjmp	.+106    	; 0x6a4 <invalidArgument>

0000063a <ijmpNot5>:
 63a:	09 30       	cpi	r16, 0x09	; 9
 63c:	31 f4       	brne	.+12     	; 0x64a <ijmpNot9>
 63e:	75 d0       	rcall	.+234    	; 0x72a <setZSpace>
 640:	01 e0       	ldi	r16, 0x01	; 1
 642:	4b d0       	rcall	.+150    	; 0x6da <check>
 644:	31 30       	cpi	r19, 0x01	; 1
 646:	11 f0       	breq	.+4      	; 0x64c <ijmpADDR>
 648:	54 c0       	rjmp	.+168    	; 0x6f2 <invalidCommand>

0000064a <ijmpNot9>:
 64a:	2c c0       	rjmp	.+88     	; 0x6a4 <invalidArgument>

0000064c <ijmpADDR>:
 64c:	12 e0       	ldi	r17, 0x02	; 2
 64e:	94 d1       	rcall	.+808    	; 0x978 <ahtoi>
 650:	33 23       	and	r19, r19
 652:	11 f4       	brne	.+4      	; 0x658 <ijmpADDRInvalid>
 654:	fe 01       	movw	r30, r28
 656:	01 c0       	rjmp	.+2      	; 0x65a <ijmpRange>

00000658 <ijmpADDRInvalid>:
 658:	25 c0       	rjmp	.+74     	; 0x6a4 <invalidArgument>

0000065a <ijmpRange>:
 65a:	f0 38       	cpi	r31, 0x80	; 128
 65c:	08 f0       	brcs	.+2      	; 0x660 <ijmpValid>
 65e:	22 c0       	rjmp	.+68     	; 0x6a4 <invalidArgument>

00000660 <ijmpValid>:
 660:	f6 95       	lsr	r31
 662:	e7 95       	ror	r30
 664:	36 c0       	rjmp	.+108    	; 0x6d2 <done>

00000666 <isEcho>:
 666:	64 d0       	rcall	.+200    	; 0x730 <restoreBL>
 668:	04 30       	cpi	r16, 0x04	; 4
 66a:	09 f4       	brne	.+2      	; 0x66e <echoNot4>
 66c:	32 c0       	rjmp	.+100    	; 0x6d2 <done>

0000066e <echoNot4>:
 66e:	5d d0       	rcall	.+186    	; 0x72a <setZSpace>
 670:	01 e0       	ldi	r16, 0x01	; 1
 672:	33 d0       	rcall	.+102    	; 0x6da <check>
 674:	31 30       	cpi	r19, 0x01	; 1
 676:	09 f0       	breq	.+2      	; 0x67a <correctSyn>
 678:	3c c0       	rjmp	.+120    	; 0x6f2 <invalidCommand>

0000067a <correctSyn>:
 67a:	2b c0       	rjmp	.+86     	; 0x6d2 <done>

0000067c <mwriteADDR>:
 67c:	12 e0       	ldi	r17, 0x02	; 2
 67e:	7c d1       	rcall	.+760    	; 0x978 <ahtoi>
 680:	30 30       	cpi	r19, 0x00	; 0
 682:	81 f4       	brne	.+32     	; 0x6a4 <invalidArgument>
 684:	00 c0       	rjmp	.+0      	; 0x686 <mwriteADDR0>

00000686 <mwriteADDR0>:
 686:	51 d0       	rcall	.+162    	; 0x72a <setZSpace>
 688:	01 e0       	ldi	r16, 0x01	; 1
 68a:	27 d0       	rcall	.+78     	; 0x6da <check>
 68c:	31 30       	cpi	r19, 0x01	; 1
 68e:	51 f4       	brne	.+20     	; 0x6a4 <invalidArgument>
 690:	00 c0       	rjmp	.+0      	; 0x692 <mwriteADDR0VV>

00000692 <mwriteADDR0VV>:
 692:	cd 2e       	mov	r12, r29
 694:	dc 2e       	mov	r13, r28
 696:	11 e0       	ldi	r17, 0x01	; 1
 698:	6f d1       	rcall	.+734    	; 0x978 <ahtoi>
 69a:	30 30       	cpi	r19, 0x00	; 0
 69c:	19 f4       	brne	.+6      	; 0x6a4 <invalidArgument>
 69e:	dc 2d       	mov	r29, r12
 6a0:	cd 2d       	mov	r28, r13
 6a2:	17 c0       	rjmp	.+46     	; 0x6d2 <done>

000006a4 <invalidArgument>:
 6a4:	4d ef       	ldi	r20, 0xFD	; 253
 6a6:	04 2e       	mov	r0, r20
 6a8:	08 95       	ret

000006aa <char5>:
 6aa:	40 e3       	ldi	r20, 0x30	; 48
 6ac:	2f d0       	rcall	.+94     	; 0x70c <setZClear>
 6ae:	13 d0       	rcall	.+38     	; 0x6d6 <compareString>
 6b0:	31 30       	cpi	r19, 0x01	; 1
 6b2:	79 f0       	breq	.+30     	; 0x6d2 <done>
 6b4:	1e c0       	rjmp	.+60     	; 0x6f2 <invalidCommand>

000006b6 <char4>:
 6b6:	40 e2       	ldi	r20, 0x20	; 32
 6b8:	20 d0       	rcall	.+64     	; 0x6fa <setZHelp>
 6ba:	0d d0       	rcall	.+26     	; 0x6d6 <compareString>
 6bc:	31 30       	cpi	r19, 0x01	; 1
 6be:	49 f0       	breq	.+18     	; 0x6d2 <done>
 6c0:	1f d0       	rcall	.+62     	; 0x700 <setZInfo>
 6c2:	09 d0       	rcall	.+18     	; 0x6d6 <compareString>
 6c4:	31 30       	cpi	r19, 0x01	; 1
 6c6:	29 f0       	breq	.+10     	; 0x6d2 <done>
 6c8:	1e d0       	rcall	.+60     	; 0x706 <setZRegs>
 6ca:	05 d0       	rcall	.+10     	; 0x6d6 <compareString>
 6cc:	31 30       	cpi	r19, 0x01	; 1
 6ce:	09 f0       	breq	.+2      	; 0x6d2 <done>
 6d0:	10 c0       	rjmp	.+32     	; 0x6f2 <invalidCommand>

000006d2 <done>:
 6d2:	04 2e       	mov	r0, r20
 6d4:	08 95       	ret

000006d6 <compareString>:
 6d6:	2c d0       	rcall	.+88     	; 0x730 <restoreBL>

000006d8 <noRestoreBL>:
 6d8:	0b df       	rcall	.-490    	; 0x4f0 <resetXBuffer>

000006da <check>:
 6da:	1d 91       	ld	r17, X+
 6dc:	25 91       	lpm	r18, Z+
 6de:	12 17       	cp	r17, r18
 6e0:	29 f4       	brne	.+10     	; 0x6ec <notMatch>
 6e2:	0a 95       	dec	r16
 6e4:	00 23       	and	r16, r16
 6e6:	c9 f7       	brne	.-14     	; 0x6da <check>

000006e8 <match>:
 6e8:	31 e0       	ldi	r19, 0x01	; 1
 6ea:	08 95       	ret

000006ec <notMatch>:
 6ec:	30 e0       	ldi	r19, 0x00	; 0
 6ee:	43 95       	inc	r20
 6f0:	08 95       	ret

000006f2 <invalidCommand>:
 6f2:	fe de       	rcall	.-516    	; 0x4f0 <resetXBuffer>
 6f4:	1f ef       	ldi	r17, 0xFF	; 255
 6f6:	01 2e       	mov	r0, r17
 6f8:	08 95       	ret

000006fa <setZHelp>:
 6fa:	f7 e0       	ldi	r31, 0x07	; 7
 6fc:	e6 e3       	ldi	r30, 0x36	; 54
 6fe:	08 95       	ret

00000700 <setZInfo>:
 700:	f7 e0       	ldi	r31, 0x07	; 7
 702:	ea e3       	ldi	r30, 0x3A	; 58
 704:	08 95       	ret

00000706 <setZRegs>:
 706:	f7 e0       	ldi	r31, 0x07	; 7
 708:	ee e3       	ldi	r30, 0x3E	; 62
 70a:	08 95       	ret

0000070c <setZClear>:
 70c:	f7 e0       	ldi	r31, 0x07	; 7
 70e:	e2 e4       	ldi	r30, 0x42	; 66
 710:	08 95       	ret

00000712 <setZEcho>:
 712:	f7 e0       	ldi	r31, 0x07	; 7
 714:	e7 e4       	ldi	r30, 0x47	; 71
 716:	08 95       	ret

00000718 <setZIndirectJump>:
 718:	f7 e0       	ldi	r31, 0x07	; 7
 71a:	e7 e5       	ldi	r30, 0x57	; 87
 71c:	08 95       	ret

0000071e <setZMwrite>:
 71e:	f7 e0       	ldi	r31, 0x07	; 7
 720:	e0 e5       	ldi	r30, 0x50	; 80
 722:	08 95       	ret

00000724 <setZMread>:
 724:	f7 e0       	ldi	r31, 0x07	; 7
 726:	eb e4       	ldi	r30, 0x4B	; 75
 728:	08 95       	ret

0000072a <setZSpace>:
 72a:	f7 e0       	ldi	r31, 0x07	; 7
 72c:	e6 e5       	ldi	r30, 0x56	; 86
 72e:	08 95       	ret

00000730 <restoreBL>:
 730:	e2 de       	rcall	.-572    	; 0x4f6 <setYBL>
 732:	08 81       	ld	r16, Y
 734:	08 95       	ret

00000736 <help>:
 736:	68 65       	ori	r22, 0x58	; 88
 738:	6c 70       	andi	r22, 0x0C	; 12

0000073a <info>:
 73a:	69 6e       	ori	r22, 0xE9	; 233
 73c:	66 6f       	ori	r22, 0xF6	; 246

0000073e <regs>:
 73e:	72 65       	ori	r23, 0x52	; 82
 740:	67 73       	andi	r22, 0x37	; 55

00000742 <clear>:
 742:	63 6c       	ori	r22, 0xC3	; 195
 744:	65 61       	ori	r22, 0x15	; 21
 746:	72        	ori	r23, 0x52	; 82

00000747 <echo>:
 747:	65 63       	ori	r22, 0x35	; 53
 749:	68 6f       	ori	r22, 0xF8	; 248

0000074b <mread>:
 74b:	6d 72       	andi	r22, 0x2D	; 45
 74d:	65 61       	ori	r22, 0x15	; 21
 74f:	64        	ori	r22, 0xD4	; 212

00000750 <mwrite>:
 750:	6d 77       	andi	r22, 0x7D	; 125
 752:	72 69       	ori	r23, 0x92	; 146
 754:	74 65       	ori	r23, 0x54	; 84

00000756 <space>:
 756:	20        	ori	r18, 0x90	; 144

00000757 <indirectJump>:
 757:	69 6a       	ori	r22, 0xA9	; 169
 759:	6d 70       	andi	r22, 0x0D	; 13
	...

0000075c <regsCommand>:
 75c:	00 27       	eor	r16, r16
 75e:	86 d0       	rcall	.+268    	; 0x86c <setZRegs>
 760:	ef 01       	movw	r28, r30

00000762 <loop1>:
 762:	fe 01       	movw	r30, r28
 764:	95 91       	lpm	r25, Z+
 766:	ef 01       	movw	r28, r30
 768:	99 23       	and	r25, r25
 76a:	31 f0       	breq	.+12     	; 0x778 <done1>
 76c:	9d 30       	cpi	r25, 0x0D	; 13
 76e:	29 f0       	breq	.+10     	; 0x77a <newLine>
 770:	9a 30       	cpi	r25, 0x0A	; 10
 772:	29 f0       	breq	.+10     	; 0x77e <printRegs>
 774:	df dc       	rcall	.-1602   	; 0x134 <uartSend>
 776:	f5 cf       	rjmp	.-22     	; 0x762 <loop1>

00000778 <done1>:
 778:	08 95       	ret

0000077a <newLine>:
 77a:	5b dd       	rcall	.-1354   	; 0x232 <terminalNewLine>
 77c:	f2 cf       	rjmp	.-28     	; 0x762 <loop1>

0000077e <printRegs>:
 77e:	ef 01       	movw	r28, r30
 780:	03 d0       	rcall	.+6      	; 0x788 <setZIjmpList>
 782:	e0 0f       	add	r30, r16
 784:	f1 1d       	adc	r31, r1
 786:	09 94       	ijmp

00000788 <setZIjmpList>:
 788:	f3 e0       	ldi	r31, 0x03	; 3
 78a:	e7 ec       	ldi	r30, 0xC7	; 199
 78c:	08 95       	ret

0000078e <ijmpList>:
 78e:	21 c0       	rjmp	.+66     	; 0x7d2 <r0>
 790:	22 c0       	rjmp	.+68     	; 0x7d6 <r1>
 792:	23 c0       	rjmp	.+70     	; 0x7da <r2>
 794:	24 c0       	rjmp	.+72     	; 0x7de <r3>
 796:	25 c0       	rjmp	.+74     	; 0x7e2 <r4>
 798:	26 c0       	rjmp	.+76     	; 0x7e6 <r5>
 79a:	27 c0       	rjmp	.+78     	; 0x7ea <r6>
 79c:	28 c0       	rjmp	.+80     	; 0x7ee <r7>
 79e:	29 c0       	rjmp	.+82     	; 0x7f2 <r8>
 7a0:	2a c0       	rjmp	.+84     	; 0x7f6 <r9>
 7a2:	2b c0       	rjmp	.+86     	; 0x7fa <r10>
 7a4:	2c c0       	rjmp	.+88     	; 0x7fe <r11>
 7a6:	2d c0       	rjmp	.+90     	; 0x802 <r12>
 7a8:	2e c0       	rjmp	.+92     	; 0x806 <r13>
 7aa:	2f c0       	rjmp	.+94     	; 0x80a <r14>
 7ac:	30 c0       	rjmp	.+96     	; 0x80e <r15>
 7ae:	31 c0       	rjmp	.+98     	; 0x812 <r16>
 7b0:	32 c0       	rjmp	.+100    	; 0x816 <r17>
 7b2:	33 c0       	rjmp	.+102    	; 0x81a <r18>
 7b4:	34 c0       	rjmp	.+104    	; 0x81e <r19>
 7b6:	35 c0       	rjmp	.+106    	; 0x822 <r20>
 7b8:	36 c0       	rjmp	.+108    	; 0x826 <r21>
 7ba:	36 c0       	rjmp	.+108    	; 0x828 <r22>
 7bc:	37 c0       	rjmp	.+110    	; 0x82c <r23>
 7be:	38 c0       	rjmp	.+112    	; 0x830 <r24>
 7c0:	39 c0       	rjmp	.+114    	; 0x834 <r25>
 7c2:	3a c0       	rjmp	.+116    	; 0x838 <X>
 7c4:	3d c0       	rjmp	.+122    	; 0x840 <Y>
 7c6:	40 c0       	rjmp	.+128    	; 0x848 <Z>
 7c8:	43 c0       	rjmp	.+134    	; 0x850 <PC>
 7ca:	49 c0       	rjmp	.+146    	; 0x85e <SP>

000007cc <shortcut>:
 7cc:	cc dc       	rcall	.-1640   	; 0x166 <uartSendHex>
 7ce:	03 95       	inc	r16
 7d0:	c8 cf       	rjmp	.-112    	; 0x762 <loop1>

000007d2 <r0>:
 7d2:	50 2d       	mov	r21, r0
 7d4:	fb cf       	rjmp	.-10     	; 0x7cc <shortcut>

000007d6 <r1>:
 7d6:	51 2d       	mov	r21, r1
 7d8:	f9 cf       	rjmp	.-14     	; 0x7cc <shortcut>

000007da <r2>:
 7da:	52 2d       	mov	r21, r2
 7dc:	f7 cf       	rjmp	.-18     	; 0x7cc <shortcut>

000007de <r3>:
 7de:	53 2d       	mov	r21, r3
 7e0:	f5 cf       	rjmp	.-22     	; 0x7cc <shortcut>

000007e2 <r4>:
 7e2:	54 2d       	mov	r21, r4
 7e4:	f3 cf       	rjmp	.-26     	; 0x7cc <shortcut>

000007e6 <r5>:
 7e6:	55 2d       	mov	r21, r5
 7e8:	f1 cf       	rjmp	.-30     	; 0x7cc <shortcut>

000007ea <r6>:
 7ea:	56 2d       	mov	r21, r6
 7ec:	ef cf       	rjmp	.-34     	; 0x7cc <shortcut>

000007ee <r7>:
 7ee:	57 2d       	mov	r21, r7
 7f0:	ed cf       	rjmp	.-38     	; 0x7cc <shortcut>

000007f2 <r8>:
 7f2:	58 2d       	mov	r21, r8
 7f4:	eb cf       	rjmp	.-42     	; 0x7cc <shortcut>

000007f6 <r9>:
 7f6:	59 2d       	mov	r21, r9
 7f8:	e9 cf       	rjmp	.-46     	; 0x7cc <shortcut>

000007fa <r10>:
 7fa:	5a 2d       	mov	r21, r10
 7fc:	e7 cf       	rjmp	.-50     	; 0x7cc <shortcut>

000007fe <r11>:
 7fe:	5b 2d       	mov	r21, r11
 800:	e5 cf       	rjmp	.-54     	; 0x7cc <shortcut>

00000802 <r12>:
 802:	5c 2d       	mov	r21, r12
 804:	e3 cf       	rjmp	.-58     	; 0x7cc <shortcut>

00000806 <r13>:
 806:	5d 2d       	mov	r21, r13
 808:	e1 cf       	rjmp	.-62     	; 0x7cc <shortcut>

0000080a <r14>:
 80a:	5e 2d       	mov	r21, r14
 80c:	df cf       	rjmp	.-66     	; 0x7cc <shortcut>

0000080e <r15>:
 80e:	5f 2d       	mov	r21, r15
 810:	dd cf       	rjmp	.-70     	; 0x7cc <shortcut>

00000812 <r16>:
 812:	50 2f       	mov	r21, r16
 814:	db cf       	rjmp	.-74     	; 0x7cc <shortcut>

00000816 <r17>:
 816:	51 2f       	mov	r21, r17
 818:	d9 cf       	rjmp	.-78     	; 0x7cc <shortcut>

0000081a <r18>:
 81a:	52 2f       	mov	r21, r18
 81c:	d7 cf       	rjmp	.-82     	; 0x7cc <shortcut>

0000081e <r19>:
 81e:	53 2f       	mov	r21, r19
 820:	d5 cf       	rjmp	.-86     	; 0x7cc <shortcut>

00000822 <r20>:
 822:	54 2f       	mov	r21, r20
 824:	d3 cf       	rjmp	.-90     	; 0x7cc <shortcut>

00000826 <r21>:
 826:	d2 cf       	rjmp	.-92     	; 0x7cc <shortcut>

00000828 <r22>:
 828:	56 2f       	mov	r21, r22
 82a:	d0 cf       	rjmp	.-96     	; 0x7cc <shortcut>

0000082c <r23>:
 82c:	57 2f       	mov	r21, r23
 82e:	ce cf       	rjmp	.-100    	; 0x7cc <shortcut>

00000830 <r24>:
 830:	58 2f       	mov	r21, r24
 832:	cc cf       	rjmp	.-104    	; 0x7cc <shortcut>

00000834 <r25>:
 834:	59 2f       	mov	r21, r25
 836:	ca cf       	rjmp	.-108    	; 0x7cc <shortcut>

00000838 <X>:
 838:	5b 2f       	mov	r21, r27
 83a:	95 dc       	rcall	.-1750   	; 0x166 <uartSendHex>
 83c:	5a 2f       	mov	r21, r26
 83e:	c6 cf       	rjmp	.-116    	; 0x7cc <shortcut>

00000840 <Y>:
 840:	5d 2f       	mov	r21, r29
 842:	91 dc       	rcall	.-1758   	; 0x166 <uartSendHex>
 844:	5c 2f       	mov	r21, r28
 846:	c2 cf       	rjmp	.-124    	; 0x7cc <shortcut>

00000848 <Z>:
 848:	5f 2f       	mov	r21, r31
 84a:	8d dc       	rcall	.-1766   	; 0x166 <uartSendHex>
 84c:	5e 2f       	mov	r21, r30
 84e:	be cf       	rjmp	.-132    	; 0x7cc <shortcut>

00000850 <PC>:
 850:	00 d0       	rcall	.+0      	; 0x852 <L0^A>

00000852 <L0^A>:
 852:	1f 91       	pop	r17
 854:	2f 91       	pop	r18
 856:	52 2f       	mov	r21, r18
 858:	86 dc       	rcall	.-1780   	; 0x166 <uartSendHex>
 85a:	51 2f       	mov	r21, r17
 85c:	b7 cf       	rjmp	.-146    	; 0x7cc <shortcut>

0000085e <SP>:
 85e:	50 91 5e 00 	lds	r21, 0x005E	; 0x80005e <__TEXT_REGION_LENGTH__+0x7e005e>
 862:	81 dc       	rcall	.-1790   	; 0x166 <uartSendHex>
 864:	50 91 5d 00 	lds	r21, 0x005D	; 0x80005d <__TEXT_REGION_LENGTH__+0x7e005d>
 868:	7e dc       	rcall	.-1796   	; 0x166 <uartSendHex>
 86a:	86 cf       	rjmp	.-244    	; 0x778 <done1>

0000086c <setZRegs>:
 86c:	f8 e0       	ldi	r31, 0x08	; 8
 86e:	e2 e7       	ldi	r30, 0x72	; 114
 870:	08 95       	ret

00000872 <regsMessage>:
 872:	72 30       	cpi	r23, 0x02	; 2
 874:	3a 30       	cpi	r19, 0x0A	; 10
 876:	78 0a       	sbc	r7, r24
 878:	20 72       	andi	r18, 0x20	; 32
 87a:	31 3a       	cpi	r19, 0xA1	; 161
 87c:	30 78       	andi	r19, 0x80	; 128
 87e:	0a 20       	and	r0, r10
 880:	72 32       	cpi	r23, 0x22	; 34
 882:	3a 30       	cpi	r19, 0x0A	; 10
 884:	78 0a       	sbc	r7, r24
 886:	20 72       	andi	r18, 0x20	; 32
 888:	33 3a       	cpi	r19, 0xA3	; 163
 88a:	30 78       	andi	r19, 0x80	; 128
 88c:	0a 20       	and	r0, r10
 88e:	72 34       	cpi	r23, 0x42	; 66
 890:	3a 30       	cpi	r19, 0x0A	; 10
 892:	78 0a       	sbc	r7, r24
 894:	20 72       	andi	r18, 0x20	; 32
 896:	35 3a       	cpi	r19, 0xA5	; 165
 898:	30 78       	andi	r19, 0x80	; 128
 89a:	0a 0d       	add	r16, r10
 89c:	72 36       	cpi	r23, 0x62	; 98
 89e:	3a 30       	cpi	r19, 0x0A	; 10
 8a0:	78 0a       	sbc	r7, r24
 8a2:	20 72       	andi	r18, 0x20	; 32
 8a4:	37 3a       	cpi	r19, 0xA7	; 167
 8a6:	30 78       	andi	r19, 0x80	; 128
 8a8:	0a 20       	and	r0, r10
 8aa:	72 38       	cpi	r23, 0x82	; 130
 8ac:	3a 30       	cpi	r19, 0x0A	; 10
 8ae:	78 0a       	sbc	r7, r24
 8b0:	20 72       	andi	r18, 0x20	; 32
 8b2:	39 3a       	cpi	r19, 0xA9	; 169
 8b4:	30 78       	andi	r19, 0x80	; 128
 8b6:	0a 20       	and	r0, r10
 8b8:	72 31       	cpi	r23, 0x12	; 18
 8ba:	30 3a       	cpi	r19, 0xA0	; 160
 8bc:	30 78       	andi	r19, 0x80	; 128
 8be:	0a 20       	and	r0, r10
 8c0:	72 31       	cpi	r23, 0x12	; 18
 8c2:	31 3a       	cpi	r19, 0xA1	; 161
 8c4:	30 78       	andi	r19, 0x80	; 128
 8c6:	0a 0d       	add	r16, r10
 8c8:	72 31       	cpi	r23, 0x12	; 18
 8ca:	32 3a       	cpi	r19, 0xA2	; 162
 8cc:	30 78       	andi	r19, 0x80	; 128
 8ce:	0a 20       	and	r0, r10
 8d0:	72 31       	cpi	r23, 0x12	; 18
 8d2:	33 3a       	cpi	r19, 0xA3	; 163
 8d4:	30 78       	andi	r19, 0x80	; 128
 8d6:	0a 20       	and	r0, r10
 8d8:	72 31       	cpi	r23, 0x12	; 18
 8da:	34 3a       	cpi	r19, 0xA4	; 164
 8dc:	30 78       	andi	r19, 0x80	; 128
 8de:	0a 20       	and	r0, r10
 8e0:	72 31       	cpi	r23, 0x12	; 18
 8e2:	35 3a       	cpi	r19, 0xA5	; 165
 8e4:	30 78       	andi	r19, 0x80	; 128
 8e6:	0a 20       	and	r0, r10
 8e8:	72 31       	cpi	r23, 0x12	; 18
 8ea:	36 3a       	cpi	r19, 0xA6	; 166
 8ec:	30 78       	andi	r19, 0x80	; 128
 8ee:	0a 20       	and	r0, r10
 8f0:	72 31       	cpi	r23, 0x12	; 18
 8f2:	37 3a       	cpi	r19, 0xA7	; 167
 8f4:	30 78       	andi	r19, 0x80	; 128
 8f6:	0a 0d       	add	r16, r10
 8f8:	72 31       	cpi	r23, 0x12	; 18
 8fa:	38 3a       	cpi	r19, 0xA8	; 168
 8fc:	30 78       	andi	r19, 0x80	; 128
 8fe:	0a 20       	and	r0, r10
 900:	72 31       	cpi	r23, 0x12	; 18
 902:	39 3a       	cpi	r19, 0xA9	; 169
 904:	30 78       	andi	r19, 0x80	; 128
 906:	0a 20       	and	r0, r10
 908:	72 32       	cpi	r23, 0x22	; 34
 90a:	30 3a       	cpi	r19, 0xA0	; 160
 90c:	30 78       	andi	r19, 0x80	; 128
 90e:	0a 20       	and	r0, r10
 910:	72 32       	cpi	r23, 0x22	; 34
 912:	31 3a       	cpi	r19, 0xA1	; 161
 914:	30 78       	andi	r19, 0x80	; 128
 916:	0a 20       	and	r0, r10
 918:	72 32       	cpi	r23, 0x22	; 34
 91a:	32 3a       	cpi	r19, 0xA2	; 162
 91c:	30 78       	andi	r19, 0x80	; 128
 91e:	0a 20       	and	r0, r10
 920:	72 32       	cpi	r23, 0x22	; 34
 922:	33 3a       	cpi	r19, 0xA3	; 163
 924:	30 78       	andi	r19, 0x80	; 128
 926:	0a 0d       	add	r16, r10
 928:	72 32       	cpi	r23, 0x22	; 34
 92a:	34 3a       	cpi	r19, 0xA4	; 164
 92c:	30 78       	andi	r19, 0x80	; 128
 92e:	0a 20       	and	r0, r10
 930:	72 32       	cpi	r23, 0x22	; 34
 932:	35 3a       	cpi	r19, 0xA5	; 165
 934:	30 78       	andi	r19, 0x80	; 128
 936:	0a 20       	and	r0, r10
 938:	58 3a       	cpi	r21, 0xA8	; 168
 93a:	30 78       	andi	r19, 0x80	; 128
 93c:	0a 20       	and	r0, r10
 93e:	59 3a       	cpi	r21, 0xA9	; 169
 940:	30 78       	andi	r19, 0x80	; 128
 942:	0a 20       	and	r0, r10
 944:	5a 3a       	cpi	r21, 0xAA	; 170
 946:	30 78       	andi	r19, 0x80	; 128
 948:	0a 20       	and	r0, r10
 94a:	50 43       	sbci	r21, 0x30	; 48
 94c:	3a 30       	cpi	r19, 0x0A	; 10
 94e:	78 0a       	sbc	r7, r24
 950:	0d 53       	subi	r16, 0x3D	; 61
 952:	50 3a       	cpi	r21, 0xA0	; 160
 954:	30 78       	andi	r19, 0x80	; 128
 956:	0a 00       	.word	0x000a	; ????

00000958 <echoCommand>:
 958:	ce dd       	rcall	.-1124   	; 0x4f6 <setYBL>
 95a:	08 81       	ld	r16, Y
 95c:	04 30       	cpi	r16, 0x04	; 4
 95e:	09 f4       	brne	.+2      	; 0x962 <argumentProvided>
 960:	0a c0       	rjmp	.+20     	; 0x976 <noArg>

00000962 <argumentProvided>:
 962:	c6 dd       	rcall	.-1140   	; 0x4f0 <resetXBuffer>
 964:	15 96       	adiw	r26, 0x05	; 5
 966:	05 50       	subi	r16, 0x05	; 5

00000968 <loop1>:
 968:	00 23       	and	r16, r16
 96a:	21 f0       	breq	.+8      	; 0x974 <done1>
 96c:	9d 91       	ld	r25, X+
 96e:	e2 db       	rcall	.-2108   	; 0x134 <uartSend>
 970:	0a 95       	dec	r16
 972:	fa cf       	rjmp	.-12     	; 0x968 <loop1>

00000974 <done1>:
 974:	08 95       	ret

00000976 <noArg>:
 976:	08 95       	ret

00000978 <ahtoi>:
 978:	33 27       	eor	r19, r19
 97a:	cc 27       	eor	r28, r28
 97c:	dd 27       	eor	r29, r29
 97e:	ee 27       	eor	r30, r30
 980:	ff 27       	eor	r31, r31
 982:	12 30       	cpi	r17, 0x02	; 2
 984:	09 f0       	breq	.+2      	; 0x988 <ahtoiword>
 986:	25 c0       	rjmp	.+74     	; 0x9d2 <ahtoibyte>

00000988 <ahtoiword>:
 988:	2d 91       	ld	r18, X+
 98a:	2f d0       	rcall	.+94     	; 0x9ea <isValidChar>
 98c:	31 30       	cpi	r19, 0x01	; 1
 98e:	f1 f0       	breq	.+60     	; 0x9cc <abort>
 990:	c2 2f       	mov	r28, r18
 992:	48 d0       	rcall	.+144    	; 0xa24 <Yx16>
 994:	47 d0       	rcall	.+142    	; 0xa24 <Yx16>
 996:	46 d0       	rcall	.+140    	; 0xa24 <Yx16>

00000998 <char2>:
 998:	2d 91       	ld	r18, X+
 99a:	27 d0       	rcall	.+78     	; 0x9ea <isValidChar>
 99c:	31 30       	cpi	r19, 0x01	; 1
 99e:	b1 f0       	breq	.+44     	; 0x9cc <abort>
 9a0:	e2 2f       	mov	r30, r18
 9a2:	49 d0       	rcall	.+146    	; 0xa36 <Zx16>
 9a4:	48 d0       	rcall	.+144    	; 0xa36 <Zx16>
 9a6:	ce 0f       	add	r28, r30
 9a8:	df 1f       	adc	r29, r31

000009aa <char3>:
 9aa:	2d 91       	ld	r18, X+
 9ac:	1e d0       	rcall	.+60     	; 0x9ea <isValidChar>
 9ae:	31 30       	cpi	r19, 0x01	; 1
 9b0:	69 f0       	breq	.+26     	; 0x9cc <abort>
 9b2:	ee 27       	eor	r30, r30
 9b4:	ff 27       	eor	r31, r31
 9b6:	e2 2f       	mov	r30, r18
 9b8:	3e d0       	rcall	.+124    	; 0xa36 <Zx16>
 9ba:	ce 0f       	add	r28, r30
 9bc:	df 1f       	adc	r29, r31

000009be <char4>:
 9be:	2d 91       	ld	r18, X+
 9c0:	14 d0       	rcall	.+40     	; 0x9ea <isValidChar>
 9c2:	31 30       	cpi	r19, 0x01	; 1
 9c4:	19 f0       	breq	.+6      	; 0x9cc <abort>
 9c6:	c2 0f       	add	r28, r18
 9c8:	d1 1d       	adc	r29, r1
 9ca:	08 95       	ret

000009cc <abort>:
 9cc:	2d ef       	ldi	r18, 0xFD	; 253
 9ce:	02 2e       	mov	r0, r18
 9d0:	08 95       	ret

000009d2 <ahtoibyte>:
 9d2:	2d 91       	ld	r18, X+
 9d4:	0a d0       	rcall	.+20     	; 0x9ea <isValidChar>
 9d6:	31 30       	cpi	r19, 0x01	; 1
 9d8:	c9 f3       	breq	.-14     	; 0x9cc <abort>
 9da:	1f d0       	rcall	.+62     	; 0xa1a <bytex16>
 9dc:	22 2e       	mov	r2, r18

000009de <char2b>:
 9de:	2d 91       	ld	r18, X+
 9e0:	04 d0       	rcall	.+8      	; 0x9ea <isValidChar>
 9e2:	31 30       	cpi	r19, 0x01	; 1
 9e4:	99 f3       	breq	.-26     	; 0x9cc <abort>
 9e6:	22 0e       	add	r2, r18
 9e8:	08 95       	ret

000009ea <isValidChar>:
 9ea:	21 36       	cpi	r18, 0x61	; 97
 9ec:	40 f4       	brcc	.+16     	; 0x9fe <lowerLetterRangeLowercase>
 9ee:	21 34       	cpi	r18, 0x41	; 65
 9f0:	48 f4       	brcc	.+18     	; 0xa04 <lowerLetterRangeUppercase>
 9f2:	20 33       	cpi	r18, 0x30	; 48
 9f4:	08 f4       	brcc	.+2      	; 0x9f8 <lowerDigitRange>
 9f6:	0f c0       	rjmp	.+30     	; 0xa16 <invalidChar>

000009f8 <lowerDigitRange>:
 9f8:	2a 33       	cpi	r18, 0x3A	; 58
 9fa:	38 f0       	brcs	.+14     	; 0xa0a <validDigit>
 9fc:	0c c0       	rjmp	.+24     	; 0xa16 <invalidChar>

000009fe <lowerLetterRangeLowercase>:
 9fe:	27 36       	cpi	r18, 0x67	; 103
 a00:	40 f0       	brcs	.+16     	; 0xa12 <validLetterLowercase>
 a02:	09 c0       	rjmp	.+18     	; 0xa16 <invalidChar>

00000a04 <lowerLetterRangeUppercase>:
 a04:	27 34       	cpi	r18, 0x47	; 71
 a06:	18 f0       	brcs	.+6      	; 0xa0e <validLetterUppercase>
 a08:	06 c0       	rjmp	.+12     	; 0xa16 <invalidChar>

00000a0a <validDigit>:
 a0a:	20 53       	subi	r18, 0x30	; 48
 a0c:	08 95       	ret

00000a0e <validLetterUppercase>:
 a0e:	27 53       	subi	r18, 0x37	; 55
 a10:	08 95       	ret

00000a12 <validLetterLowercase>:
 a12:	27 55       	subi	r18, 0x57	; 87
 a14:	08 95       	ret

00000a16 <invalidChar>:
 a16:	31 e0       	ldi	r19, 0x01	; 1
 a18:	08 95       	ret

00000a1a <bytex16>:
 a1a:	22 0f       	add	r18, r18
 a1c:	22 0f       	add	r18, r18
 a1e:	22 0f       	add	r18, r18
 a20:	22 0f       	add	r18, r18
 a22:	08 95       	ret

00000a24 <Yx16>:
 a24:	cc 0f       	add	r28, r28
 a26:	dd 1f       	adc	r29, r29
 a28:	cc 0f       	add	r28, r28
 a2a:	dd 1f       	adc	r29, r29
 a2c:	cc 0f       	add	r28, r28
 a2e:	dd 1f       	adc	r29, r29
 a30:	cc 0f       	add	r28, r28
 a32:	dd 1f       	adc	r29, r29
 a34:	08 95       	ret

00000a36 <Zx16>:
 a36:	ee 0f       	add	r30, r30
 a38:	ff 1f       	adc	r31, r31
 a3a:	ee 0f       	add	r30, r30
 a3c:	ff 1f       	adc	r31, r31
 a3e:	ee 0f       	add	r30, r30
 a40:	ff 1f       	adc	r31, r31
 a42:	ee 0f       	add	r30, r30
 a44:	ff 1f       	adc	r31, r31
 a46:	08 95       	ret

00000a48 <mwrite>:
 a48:	28 82       	st	Y, r2
 a4a:	1d d0       	rcall	.+58     	; 0xa86 <setZWriteMessage>

00000a4c <loop2>:
 a4c:	95 91       	lpm	r25, Z+
 a4e:	9a 30       	cpi	r25, 0x0A	; 10
 a50:	21 f0       	breq	.+8      	; 0xa5a <valuer2>
 a52:	9d 30       	cpi	r25, 0x0D	; 13
 a54:	39 f0       	breq	.+14     	; 0xa64 <addressY>
 a56:	6e db       	rcall	.-2340   	; 0x134 <uartSend>
 a58:	f9 cf       	rjmp	.-14     	; 0xa4c <loop2>

00000a5a <valuer2>:
 a5a:	52 2d       	mov	r21, r2
 a5c:	84 db       	rcall	.-2296   	; 0x166 <uartSendHex>
 a5e:	13 d0       	rcall	.+38     	; 0xa86 <setZWriteMessage>
 a60:	71 96       	adiw	r30, 0x11	; 17
 a62:	f4 cf       	rjmp	.-24     	; 0xa4c <loop2>

00000a64 <addressY>:
 a64:	5d 2f       	mov	r21, r29
 a66:	7f db       	rcall	.-2306   	; 0x166 <uartSendHex>
 a68:	5c 2f       	mov	r21, r28
 a6a:	7d db       	rcall	.-2310   	; 0x166 <uartSendHex>
 a6c:	08 95       	ret

00000a6e <mread>:
 a6e:	08 d0       	rcall	.+16     	; 0xa80 <setZReadMessage>

00000a70 <loop1>:
 a70:	95 91       	lpm	r25, Z+
 a72:	9a 30       	cpi	r25, 0x0A	; 10
 a74:	11 f0       	breq	.+4      	; 0xa7a <printValue>
 a76:	5e db       	rcall	.-2372   	; 0x134 <uartSend>
 a78:	fb cf       	rjmp	.-10     	; 0xa70 <loop1>

00000a7a <printValue>:
 a7a:	58 81       	ld	r21, Y
 a7c:	74 db       	rcall	.-2328   	; 0x166 <uartSendHex>
 a7e:	08 95       	ret

00000a80 <setZReadMessage>:
 a80:	fa e0       	ldi	r31, 0x0A	; 10
 a82:	ec e8       	ldi	r30, 0x8C	; 140
 a84:	08 95       	ret

00000a86 <setZWriteMessage>:
 a86:	fa e0       	ldi	r31, 0x0A	; 10
 a88:	e1 ea       	ldi	r30, 0xA1	; 161
 a8a:	08 95       	ret

00000a8c <readMessage>:
 a8c:	56 61       	ori	r21, 0x16	; 22
 a8e:	6c 75       	andi	r22, 0x5C	; 92
 a90:	65 20       	and	r6, r5
 a92:	6f 66       	ori	r22, 0x6F	; 111
 a94:	20 61       	ori	r18, 0x10	; 16
 a96:	64 64       	ori	r22, 0x44	; 68
 a98:	72 65       	ori	r23, 0x52	; 82
 a9a:	73 73       	andi	r23, 0x33	; 51
 a9c:	3a 20       	and	r3, r10
 a9e:	30 78       	andi	r19, 0x80	; 128
 aa0:	0a        	subi	r16, 0x7A	; 122

00000aa1 <writeMessage>:
 aa1:	57 72       	andi	r21, 0x27	; 39
 aa3:	69 74       	andi	r22, 0x49	; 73
 aa5:	74 65       	ori	r23, 0x54	; 84
 aa7:	6e 20       	and	r6, r14
 aa9:	76 61       	ori	r23, 0x16	; 22
 aab:	6c 75       	andi	r22, 0x5C	; 92
 aad:	65 20       	and	r6, r5
 aaf:	30 78       	andi	r19, 0x80	; 128
 ab1:	0a 20       	and	r0, r10
 ab3:	74 6f       	ori	r23, 0xF4	; 244
 ab5:	20 61       	ori	r18, 0x10	; 16
 ab7:	64 64       	ori	r22, 0x44	; 68
 ab9:	72 65       	ori	r23, 0x52	; 82
 abb:	73 73       	andi	r23, 0x33	; 51
 abd:	20 30       	cpi	r18, 0x00	; 0
 abf:	78 0d       	add	r23, r8
	...

Disassembly of section .avr.prop:

00000000 <__eeprom_end-0x810000>:
   0:	01 00       	.word	0x0001	; ????
   2:	02 00       	.word	0x0002	; ????
   4:	14 01       	movw	r2, r8
   6:	00 00       	nop
   8:	02 01       	movw	r0, r4
   a:	00 00       	nop
   c:	00 14       	cp	r0, r0
   e:	01 00       	.word	0x0001	; ????
  10:	00 02       	muls	r16, r16
  12:	01 00       	.word	0x0001	; ????
  14:	00 00       	nop
  16:	01 00       	.word	0x0001	; ????
  18:	02 00       	.word	0x0002	; ????
  1a:	9e 03       	fmulsu	r17, r22
  1c:	00 00       	nop
  1e:	02 01       	movw	r0, r4
  20:	00 00       	nop
  22:	00 9e       	mul	r0, r16
  24:	03 00       	.word	0x0003	; ????
  26:	00 02       	muls	r16, r16
  28:	01 00       	.word	0x0001	; ????
  2a:	00 00       	nop
  2c:	01 00       	.word	0x0001	; ????
  2e:	02 00       	.word	0x0002	; ????
  30:	c2 04       	cpc	r12, r2
  32:	00 00       	nop
  34:	02 01       	movw	r0, r4
  36:	00 00       	nop
  38:	00 c2       	rjmp	.+1024   	; 0x43a <__FUSE_REGION_LENGTH__+0x3a>
  3a:	04 00       	.word	0x0004	; ????
  3c:	00 02       	muls	r16, r16
  3e:	01 00       	.word	0x0001	; ????
  40:	00 00       	nop
  42:	01 00       	.word	0x0001	; ????
  44:	02 00       	.word	0x0002	; ????
  46:	58 09       	sbc	r21, r8
  48:	00 00       	nop
  4a:	02 01       	movw	r0, r4
  4c:	00 00       	nop
  4e:	00 58       	subi	r16, 0x80	; 128
  50:	09 00       	.word	0x0009	; ????
  52:	00 02       	muls	r16, r16
  54:	01 00       	.word	0x0001	; ????
	...
