
debug.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__ctors_end>:
   0:	70 d0       	rcall	.+224    	; 0xe2 <uartInit>
   2:	da d0       	rcall	.+436    	; 0x1b8 <terminalInit>

00000004 <shellInit>:
   4:	5b d2       	rcall	.+1206   	; 0x4bc <bufferReset>

00000006 <shellRun>:
   6:	8c d0       	rcall	.+280    	; 0x120 <uartRecv>
   8:	9d 30       	cpi	r25, 0x0D	; 13
   a:	71 f0       	breq	.+28     	; 0x28 <shellHandleEnter>
   c:	9f 37       	cpi	r25, 0x7F	; 127
   e:	31 f0       	breq	.+12     	; 0x1c <shellHandleBackspace>
  10:	43 d2       	rcall	.+1158   	; 0x498 <bufferAdd>
  12:	74 d0       	rcall	.+232    	; 0xfc <uartSend>
  14:	f8 cf       	rjmp	.-16     	; 0x6 <shellRun>

00000016 <getBL>:
  16:	5a d2       	rcall	.+1204   	; 0x4cc <setYBL>
  18:	08 81       	ld	r16, Y
  1a:	08 95       	ret

0000001c <shellHandleBackspace>:
  1c:	fc df       	rcall	.-8      	; 0x16 <getBL>
  1e:	00 30       	cpi	r16, 0x00	; 0
  20:	91 f3       	breq	.-28     	; 0x6 <shellRun>
  22:	3f d2       	rcall	.+1150   	; 0x4a2 <bufferDel>
  24:	ce d0       	rcall	.+412    	; 0x1c2 <terminalBackspace>
  26:	ef cf       	rjmp	.-34     	; 0x6 <shellRun>

00000028 <shellHandleEnter>:
  28:	f6 df       	rcall	.-20     	; 0x16 <getBL>
  2a:	00 30       	cpi	r16, 0x00	; 0
  2c:	31 f0       	breq	.+12     	; 0x3a <emptyLine>
  2e:	e5 d0       	rcall	.+458    	; 0x1fa <terminalNewLine>
  30:	70 d2       	rcall	.+1248   	; 0x512 <parseCommand>
  32:	05 d0       	rcall	.+10     	; 0x3e <shellExecute>
  34:	43 d2       	rcall	.+1158   	; 0x4bc <bufferReset>
  36:	de d0       	rcall	.+444    	; 0x1f4 <terminalEnter>
  38:	e6 cf       	rjmp	.-52     	; 0x6 <shellRun>

0000003a <emptyLine>:
  3a:	dc d0       	rcall	.+440    	; 0x1f4 <terminalEnter>
  3c:	e4 cf       	rjmp	.-56     	; 0x6 <shellRun>

0000003e <shellExecute>:
  3e:	10 e2       	ldi	r17, 0x20	; 32
  40:	01 16       	cp	r0, r17
  42:	d1 f0       	breq	.+52     	; 0x78 <callHelpCommand>
  44:	11 e2       	ldi	r17, 0x21	; 33
  46:	01 16       	cp	r0, r17
  48:	c9 f0       	breq	.+50     	; 0x7c <callInfoCommand>
  4a:	12 e2       	ldi	r17, 0x22	; 34
  4c:	01 16       	cp	r0, r17
  4e:	c1 f0       	breq	.+48     	; 0x80 <callRegsCommand>
  50:	10 e3       	ldi	r17, 0x30	; 48
  52:	01 16       	cp	r0, r17
  54:	b9 f0       	breq	.+46     	; 0x84 <callClearCommand>
  56:	10 e7       	ldi	r17, 0x70	; 112
  58:	01 16       	cp	r0, r17
  5a:	e1 f0       	breq	.+56     	; 0x94 <callIjmp>
  5c:	10 e8       	ldi	r17, 0x80	; 128
  5e:	01 16       	cp	r0, r17
  60:	a9 f0       	breq	.+42     	; 0x8c <callMread>
  62:	10 ec       	ldi	r17, 0xC0	; 192
  64:	01 16       	cp	r0, r17
  66:	a1 f0       	breq	.+40     	; 0x90 <callMwrite>
  68:	10 ef       	ldi	r17, 0xF0	; 240
  6a:	01 16       	cp	r0, r17
  6c:	69 f0       	breq	.+26     	; 0x88 <callEchoCommand>
  6e:	1e ef       	ldi	r17, 0xFE	; 254
  70:	01 16       	cp	r0, r17
  72:	09 f0       	breq	.+2      	; 0x76 <returnCase>
  74:	13 c0       	rjmp	.+38     	; 0x9c <invalidCommand>

00000076 <returnCase>:
  76:	08 95       	ret

00000078 <callHelpCommand>:
  78:	e4 d0       	rcall	.+456    	; 0x242 <helpCommand>
  7a:	08 95       	ret

0000007c <callInfoCommand>:
  7c:	82 d1       	rcall	.+772    	; 0x382 <infoCommand>
  7e:	08 95       	ret

00000080 <callRegsCommand>:
  80:	06 d3       	rcall	.+1548   	; 0x68e <regsCommand>
  82:	08 95       	ret

00000084 <callClearCommand>:
  84:	79 d1       	rcall	.+754    	; 0x378 <clearCommand>
  86:	08 95       	ret

00000088 <callEchoCommand>:
  88:	07 d4       	rcall	.+2062   	; 0x898 <echoCommand>
  8a:	08 95       	ret

0000008c <callMread>:
  8c:	a4 d4       	rcall	.+2376   	; 0x9d6 <mread>
  8e:	08 95       	ret

00000090 <callMwrite>:
  90:	8f d4       	rcall	.+2334   	; 0x9b0 <mwrite>
  92:	08 95       	ret

00000094 <callIjmp>:
  94:	09 94       	ijmp

00000096 <setZCommandNotFound>:
  96:	f0 e0       	ldi	r31, 0x00	; 0
  98:	e0 ec       	ldi	r30, 0xC0	; 192
  9a:	08 95       	ret

0000009c <invalidCommand>:
  9c:	fc df       	rcall	.-8      	; 0x96 <setZCommandNotFound>

0000009e <loop2>:
  9e:	95 91       	lpm	r25, Z+
  a0:	90 30       	cpi	r25, 0x00	; 0
  a2:	11 f0       	breq	.+4      	; 0xa8 <done2>
  a4:	2b d0       	rcall	.+86     	; 0xfc <uartSend>
  a6:	fb cf       	rjmp	.-10     	; 0x9e <loop2>

000000a8 <done2>:
  a8:	02 d0       	rcall	.+4      	; 0xae <printBuffer>
  aa:	08 d2       	rcall	.+1040   	; 0x4bc <bufferReset>
  ac:	08 95       	ret

000000ae <printBuffer>:
  ae:	0b d2       	rcall	.+1046   	; 0x4c6 <resetXBuffer>
  b0:	b2 df       	rcall	.-156    	; 0x16 <getBL>

000000b2 <loop1>:
  b2:	00 30       	cpi	r16, 0x00	; 0
  b4:	21 f0       	breq	.+8      	; 0xbe <done1>
  b6:	9d 91       	ld	r25, X+
  b8:	21 d0       	rcall	.+66     	; 0xfc <uartSend>
  ba:	0a 95       	dec	r16
  bc:	fa cf       	rjmp	.-12     	; 0xb2 <loop1>

000000be <done1>:
  be:	08 95       	ret

000000c0 <commandNotFound>:
  c0:	45 52       	subi	r20, 0x25	; 37
  c2:	52 4f       	sbci	r21, 0xF2	; 242
  c4:	52 3a       	cpi	r21, 0xA2	; 162
  c6:	20 43       	sbci	r18, 0x30	; 48
  c8:	6f 6d       	ori	r22, 0xDF	; 223
  ca:	6d 61       	ori	r22, 0x1D	; 29
  cc:	6e 64       	ori	r22, 0x4E	; 78
  ce:	20 6e       	ori	r18, 0xE0	; 224
  d0:	6f 74       	andi	r22, 0x4F	; 79
  d2:	20 66       	ori	r18, 0x60	; 96
  d4:	6f 75       	andi	r22, 0x5F	; 95
  d6:	6e 64       	ori	r22, 0x4E	; 78
  d8:	3a 20       	and	r3, r10
	...

000000dc <resetZHex>:
  dc:	f1 e0       	ldi	r31, 0x01	; 1
  de:	e8 ea       	ldi	r30, 0xA8	; 168
  e0:	08 95       	ret

000000e2 <uartInit>:
  e2:	08 e1       	ldi	r16, 0x18	; 24
  e4:	00 93 c1 00 	sts	0x00C1, r16	; 0x8000c1 <__DATA_REGION_ORIGIN__+0x61>
  e8:	06 e0       	ldi	r16, 0x06	; 6
  ea:	00 93 c2 00 	sts	0x00C2, r16	; 0x8000c2 <__DATA_REGION_ORIGIN__+0x62>
  ee:	03 e0       	ldi	r16, 0x03	; 3
  f0:	00 93 c4 00 	sts	0x00C4, r16	; 0x8000c4 <__DATA_REGION_ORIGIN__+0x64>
  f4:	00 e0       	ldi	r16, 0x00	; 0
  f6:	00 93 c5 00 	sts	0x00C5, r16	; 0x8000c5 <__DATA_REGION_ORIGIN__+0x65>
  fa:	08 95       	ret

000000fc <uartSend>:
  fc:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__DATA_REGION_ORIGIN__+0x60>
 100:	85 ff       	sbrs	r24, 5
 102:	fc cf       	rjmp	.-8      	; 0xfc <uartSend>
 104:	70 91 c0 00 	lds	r23, 0x00C0	; 0x8000c0 <__DATA_REGION_ORIGIN__+0x60>
 108:	70 64       	ori	r23, 0x40	; 64
 10a:	70 93 c0 00 	sts	0x00C0, r23	; 0x8000c0 <__DATA_REGION_ORIGIN__+0x60>
 10e:	90 93 c6 00 	sts	0x00C6, r25	; 0x8000c6 <__DATA_REGION_ORIGIN__+0x66>
 112:	01 d0       	rcall	.+2      	; 0x116 <confirm_send>
 114:	08 95       	ret

00000116 <confirm_send>:
 116:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__DATA_REGION_ORIGIN__+0x60>
 11a:	86 ff       	sbrs	r24, 6
 11c:	fc cf       	rjmp	.-8      	; 0x116 <confirm_send>
 11e:	08 95       	ret

00000120 <uartRecv>:
 120:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__DATA_REGION_ORIGIN__+0x60>
 124:	87 ff       	sbrs	r24, 7
 126:	fc cf       	rjmp	.-8      	; 0x120 <uartRecv>
 128:	90 91 c6 00 	lds	r25, 0x00C6	; 0x8000c6 <__DATA_REGION_ORIGIN__+0x66>
 12c:	08 95       	ret

0000012e <uartSendHex>:
 12e:	11 24       	eor	r1, r1
 130:	04 d0       	rcall	.+8      	; 0x13a <high_hex>
 132:	d4 df       	rcall	.-88     	; 0xdc <resetZHex>
 134:	0b d0       	rcall	.+22     	; 0x14c <low_hex>
 136:	d2 df       	rcall	.-92     	; 0xdc <resetZHex>
 138:	08 95       	ret

0000013a <high_hex>:
 13a:	65 2f       	mov	r22, r21
 13c:	cf df       	rcall	.-98     	; 0xdc <resetZHex>
 13e:	62 95       	swap	r22
 140:	6f 70       	andi	r22, 0x0F	; 15
 142:	e6 0f       	add	r30, r22
 144:	f1 1d       	adc	r31, r1
 146:	94 91       	lpm	r25, Z
 148:	d9 df       	rcall	.-78     	; 0xfc <uartSend>
 14a:	08 95       	ret

0000014c <low_hex>:
 14c:	65 2f       	mov	r22, r21
 14e:	c6 df       	rcall	.-116    	; 0xdc <resetZHex>
 150:	6f 70       	andi	r22, 0x0F	; 15
 152:	e6 0f       	add	r30, r22
 154:	f1 1d       	adc	r31, r1
 156:	94 91       	lpm	r25, Z
 158:	d1 df       	rcall	.-94     	; 0xfc <uartSend>
 15a:	08 95       	ret

0000015c <uartSendDec>:
 15c:	13 d0       	rcall	.+38     	; 0x184 <if_zero>

0000015e <continue>:
 15e:	1d d0       	rcall	.+58     	; 0x19a <send_decimal>
 160:	90 e2       	ldi	r25, 0x20	; 32
 162:	cc df       	rcall	.-104    	; 0xfc <uartSend>
 164:	08 95       	ret

00000166 <hundreds>:
 166:	54 36       	cpi	r21, 0x64	; 100
 168:	98 f0       	brcs	.+38     	; 0x190 <decimal_send>
 16a:	63 95       	inc	r22
 16c:	54 56       	subi	r21, 0x64	; 100
 16e:	fb cf       	rjmp	.-10     	; 0x166 <hundreds>

00000170 <tens>:
 170:	5a 30       	cpi	r21, 0x0A	; 10
 172:	70 f0       	brcs	.+28     	; 0x190 <decimal_send>
 174:	63 95       	inc	r22
 176:	5a 50       	subi	r21, 0x0A	; 10
 178:	fb cf       	rjmp	.-10     	; 0x170 <tens>

0000017a <ones>:
 17a:	51 30       	cpi	r21, 0x01	; 1
 17c:	48 f0       	brcs	.+18     	; 0x190 <decimal_send>
 17e:	63 95       	inc	r22
 180:	51 50       	subi	r21, 0x01	; 1
 182:	fb cf       	rjmp	.-10     	; 0x17a <ones>

00000184 <if_zero>:
 184:	55 23       	and	r21, r21
 186:	09 f0       	breq	.+2      	; 0x18a <is_zero>
 188:	ea cf       	rjmp	.-44     	; 0x15e <continue>

0000018a <is_zero>:
 18a:	90 e3       	ldi	r25, 0x30	; 48
 18c:	b7 df       	rcall	.-146    	; 0xfc <uartSend>
 18e:	e7 cf       	rjmp	.-50     	; 0x15e <continue>

00000190 <decimal_send>:
 190:	60 5d       	subi	r22, 0xD0	; 208
 192:	96 2f       	mov	r25, r22
 194:	b3 df       	rcall	.-154    	; 0xfc <uartSend>
 196:	66 27       	eor	r22, r22
 198:	00 c0       	rjmp	.+0      	; 0x19a <send_decimal>

0000019a <send_decimal>:
 19a:	54 36       	cpi	r21, 0x64	; 100
 19c:	20 f7       	brcc	.-56     	; 0x166 <hundreds>
 19e:	5a 30       	cpi	r21, 0x0A	; 10
 1a0:	38 f7       	brcc	.-50     	; 0x170 <tens>
 1a2:	51 30       	cpi	r21, 0x01	; 1
 1a4:	50 f7       	brcc	.-44     	; 0x17a <ones>
 1a6:	08 95       	ret

000001a8 <hex_list>:
 1a8:	30 31       	cpi	r19, 0x10	; 16
 1aa:	32 33       	cpi	r19, 0x32	; 50
 1ac:	34 35       	cpi	r19, 0x54	; 84
 1ae:	36 37       	cpi	r19, 0x76	; 118
 1b0:	38 39       	cpi	r19, 0x98	; 152
 1b2:	41 42       	sbci	r20, 0x21	; 33
 1b4:	43 44       	sbci	r20, 0x43	; 67
 1b6:	45 46       	sbci	r20, 0x65	; 101

000001b8 <terminalInit>:
 1b8:	2b d0       	rcall	.+86     	; 0x210 <terminalColorBG>
 1ba:	35 d0       	rcall	.+106    	; 0x226 <terminalColorTXT>
 1bc:	09 d0       	rcall	.+18     	; 0x1d0 <terminalClear>
 1be:	11 d0       	rcall	.+34     	; 0x1e2 <terminalPrompt>
 1c0:	08 95       	ret

000001c2 <terminalBackspace>:
 1c2:	98 e0       	ldi	r25, 0x08	; 8
 1c4:	9b df       	rcall	.-202    	; 0xfc <uartSend>
 1c6:	90 e2       	ldi	r25, 0x20	; 32
 1c8:	99 df       	rcall	.-206    	; 0xfc <uartSend>
 1ca:	98 e0       	ldi	r25, 0x08	; 8
 1cc:	97 df       	rcall	.-210    	; 0xfc <uartSend>
 1ce:	08 95       	ret

000001d0 <terminalClear>:
 1d0:	9b e1       	ldi	r25, 0x1B	; 27
 1d2:	94 df       	rcall	.-216    	; 0xfc <uartSend>
 1d4:	9b e5       	ldi	r25, 0x5B	; 91
 1d6:	92 df       	rcall	.-220    	; 0xfc <uartSend>
 1d8:	92 e3       	ldi	r25, 0x32	; 50
 1da:	90 df       	rcall	.-224    	; 0xfc <uartSend>
 1dc:	9a e4       	ldi	r25, 0x4A	; 74
 1de:	8e df       	rcall	.-228    	; 0xfc <uartSend>
 1e0:	08 95       	ret

000001e2 <terminalPrompt>:
 1e2:	91 e6       	ldi	r25, 0x61	; 97
 1e4:	8b df       	rcall	.-234    	; 0xfc <uartSend>
 1e6:	96 e7       	ldi	r25, 0x76	; 118
 1e8:	89 df       	rcall	.-238    	; 0xfc <uartSend>
 1ea:	92 e7       	ldi	r25, 0x72	; 114
 1ec:	87 df       	rcall	.-242    	; 0xfc <uartSend>
 1ee:	9e e3       	ldi	r25, 0x3E	; 62
 1f0:	85 df       	rcall	.-246    	; 0xfc <uartSend>
 1f2:	08 95       	ret

000001f4 <terminalEnter>:
 1f4:	02 d0       	rcall	.+4      	; 0x1fa <terminalNewLine>
 1f6:	f5 df       	rcall	.-22     	; 0x1e2 <terminalPrompt>
 1f8:	08 95       	ret

000001fa <terminalNewLine>:
 1fa:	9a e0       	ldi	r25, 0x0A	; 10
 1fc:	7f df       	rcall	.-258    	; 0xfc <uartSend>
 1fe:	9d e0       	ldi	r25, 0x0D	; 13
 200:	7d df       	rcall	.-262    	; 0xfc <uartSend>
 202:	9b e1       	ldi	r25, 0x1B	; 27
 204:	7b df       	rcall	.-266    	; 0xfc <uartSend>
 206:	9b e5       	ldi	r25, 0x5B	; 91
 208:	79 df       	rcall	.-270    	; 0xfc <uartSend>
 20a:	9b e4       	ldi	r25, 0x4B	; 75
 20c:	77 df       	rcall	.-274    	; 0xfc <uartSend>
 20e:	08 95       	ret

00000210 <terminalColorBG>:
 210:	9b e1       	ldi	r25, 0x1B	; 27
 212:	74 df       	rcall	.-280    	; 0xfc <uartSend>
 214:	9b e5       	ldi	r25, 0x5B	; 91
 216:	72 df       	rcall	.-284    	; 0xfc <uartSend>
 218:	94 e3       	ldi	r25, 0x34	; 52
 21a:	70 df       	rcall	.-288    	; 0xfc <uartSend>
 21c:	94 e3       	ldi	r25, 0x34	; 52
 21e:	6e df       	rcall	.-292    	; 0xfc <uartSend>
 220:	9d e6       	ldi	r25, 0x6D	; 109
 222:	6c df       	rcall	.-296    	; 0xfc <uartSend>
 224:	08 95       	ret

00000226 <terminalColorTXT>:
 226:	9b e1       	ldi	r25, 0x1B	; 27
 228:	69 df       	rcall	.-302    	; 0xfc <uartSend>
 22a:	9b e5       	ldi	r25, 0x5B	; 91
 22c:	67 df       	rcall	.-306    	; 0xfc <uartSend>
 22e:	99 e3       	ldi	r25, 0x39	; 57
 230:	65 df       	rcall	.-310    	; 0xfc <uartSend>
 232:	97 e3       	ldi	r25, 0x37	; 55
 234:	63 df       	rcall	.-314    	; 0xfc <uartSend>
 236:	9d e6       	ldi	r25, 0x6D	; 109
 238:	61 df       	rcall	.-318    	; 0xfc <uartSend>
 23a:	08 95       	ret

0000023c <setZHelpMessage>:
 23c:	f2 e0       	ldi	r31, 0x02	; 2
 23e:	e8 e5       	ldi	r30, 0x58	; 88
 240:	08 95       	ret

00000242 <helpCommand>:
 242:	fc df       	rcall	.-8      	; 0x23c <setZHelpMessage>

00000244 <loop1>:
 244:	95 91       	lpm	r25, Z+
 246:	90 30       	cpi	r25, 0x00	; 0
 248:	21 f0       	breq	.+8      	; 0x252 <done1>
 24a:	9d 30       	cpi	r25, 0x0D	; 13
 24c:	19 f0       	breq	.+6      	; 0x254 <newLine1>
 24e:	56 df       	rcall	.-340    	; 0xfc <uartSend>
 250:	f9 cf       	rjmp	.-14     	; 0x244 <loop1>

00000252 <done1>:
 252:	08 95       	ret

00000254 <newLine1>:
 254:	d2 df       	rcall	.-92     	; 0x1fa <terminalNewLine>
 256:	f6 cf       	rjmp	.-20     	; 0x244 <loop1>

00000258 <helpMessage>:
 258:	68 65       	ori	r22, 0x58	; 88
 25a:	6c 70       	andi	r22, 0x0C	; 12
 25c:	20 2d       	mov	r18, r0
 25e:	20 64       	ori	r18, 0x40	; 64
 260:	69 73       	andi	r22, 0x39	; 57
 262:	70 6c       	ori	r23, 0xC0	; 192
 264:	61 79       	andi	r22, 0x91	; 145
 266:	20 74       	andi	r18, 0x40	; 64
 268:	68 69       	ori	r22, 0x98	; 152
 26a:	73 20       	and	r7, r3
 26c:	6c 69       	ori	r22, 0x9C	; 156
 26e:	73 74       	andi	r23, 0x43	; 67
 270:	0d 69       	ori	r16, 0x9D	; 157
 272:	6e 66       	ori	r22, 0x6E	; 110
 274:	6f 20       	and	r6, r15
 276:	2d 20       	and	r2, r13
 278:	64 69       	ori	r22, 0x94	; 148
 27a:	73 70       	andi	r23, 0x03	; 3
 27c:	6c 61       	ori	r22, 0x1C	; 28
 27e:	79 20       	and	r7, r9
 280:	73 79       	andi	r23, 0x93	; 147
 282:	73 74       	andi	r23, 0x43	; 67
 284:	65 6d       	ori	r22, 0xD5	; 213
 286:	20 69       	ori	r18, 0x90	; 144
 288:	6e 66       	ori	r22, 0x6E	; 110
 28a:	6f 0d       	add	r22, r15
 28c:	72 65       	ori	r23, 0x52	; 82
 28e:	67 73       	andi	r22, 0x37	; 55
 290:	20 2d       	mov	r18, r0
 292:	20 64       	ori	r18, 0x40	; 64
 294:	69 73       	andi	r22, 0x39	; 57
 296:	70 6c       	ori	r23, 0xC0	; 192
 298:	61 79       	andi	r22, 0x91	; 145
 29a:	20 61       	ori	r18, 0x10	; 16
 29c:	6c 6c       	ori	r22, 0xCC	; 204
 29e:	20 72       	andi	r18, 0x20	; 32
 2a0:	65 67       	ori	r22, 0x75	; 117
 2a2:	69 73       	andi	r22, 0x39	; 57
 2a4:	74 65       	ori	r23, 0x54	; 84
 2a6:	72 20       	and	r7, r2
 2a8:	76 61       	ori	r23, 0x16	; 22
 2aa:	6c 75       	andi	r22, 0x5C	; 92
 2ac:	65 73       	andi	r22, 0x35	; 53
 2ae:	0d 63       	ori	r16, 0x3D	; 61
 2b0:	6c 65       	ori	r22, 0x5C	; 92
 2b2:	61 72       	andi	r22, 0x21	; 33
 2b4:	20 2d       	mov	r18, r0
 2b6:	20 63       	ori	r18, 0x30	; 48
 2b8:	6c 65       	ori	r22, 0x5C	; 92
 2ba:	61 72       	andi	r22, 0x21	; 33
 2bc:	20 64       	ori	r18, 0x40	; 64
 2be:	69 73       	andi	r22, 0x39	; 57
 2c0:	70 6c       	ori	r23, 0xC0	; 192
 2c2:	61 79       	andi	r22, 0x91	; 145
 2c4:	0d 65       	ori	r16, 0x5D	; 93
 2c6:	63 68       	ori	r22, 0x83	; 131
 2c8:	6f 20       	and	r6, r15
 2ca:	2d 20       	and	r2, r13
 2cc:	70 72       	andi	r23, 0x20	; 32
 2ce:	69 6e       	ori	r22, 0xE9	; 233
 2d0:	74 20       	and	r7, r4
 2d2:	61 72       	andi	r22, 0x21	; 33
 2d4:	67 75       	andi	r22, 0x57	; 87
 2d6:	6d 65       	ori	r22, 0x5D	; 93
 2d8:	6e 74       	andi	r22, 0x4E	; 78
 2da:	0d 6d       	ori	r16, 0xDD	; 221
 2dc:	72 65       	ori	r23, 0x52	; 82
 2de:	61 64       	ori	r22, 0x41	; 65
 2e0:	20 2d       	mov	r18, r0
 2e2:	20 72       	andi	r18, 0x20	; 32
 2e4:	65 61       	ori	r22, 0x15	; 21
 2e6:	64 20       	and	r6, r4
 2e8:	64 61       	ori	r22, 0x14	; 20
 2ea:	74 61       	ori	r23, 0x14	; 20
 2ec:	20 6d       	ori	r18, 0xD0	; 208
 2ee:	65 6d       	ori	r22, 0xD5	; 213
 2f0:	6f 72       	andi	r22, 0x2F	; 47
 2f2:	79 28       	or	r7, r9
 2f4:	63 68       	ori	r22, 0x83	; 131
 2f6:	65 63       	ori	r22, 0x35	; 53
 2f8:	6b 20       	and	r6, r11
 2fa:	49 4e       	sbci	r20, 0xE9	; 233
 2fc:	53 54       	subi	r21, 0x43	; 67
 2fe:	52 55       	subi	r21, 0x52	; 82
 300:	43 54       	subi	r20, 0x43	; 67
 302:	49 4f       	sbci	r20, 0xF9	; 249
 304:	4e 53       	subi	r20, 0x3E	; 62
 306:	2e 6d       	ori	r18, 0xDE	; 222
 308:	64 29       	or	r22, r4
 30a:	0d 6d       	ori	r16, 0xDD	; 221
 30c:	77 72       	andi	r23, 0x27	; 39
 30e:	69 74       	andi	r22, 0x49	; 73
 310:	65 20       	and	r6, r5
 312:	2d 20       	and	r2, r13
 314:	77 72       	andi	r23, 0x27	; 39
 316:	69 74       	andi	r22, 0x49	; 73
 318:	65 20       	and	r6, r5
 31a:	74 6f       	ori	r23, 0xF4	; 244
 31c:	20 64       	ori	r18, 0x40	; 64
 31e:	61 74       	andi	r22, 0x41	; 65
 320:	61 20       	and	r6, r1
 322:	6d 65       	ori	r22, 0x5D	; 93
 324:	6d 6f       	ori	r22, 0xFD	; 253
 326:	72 79       	andi	r23, 0x92	; 146
 328:	28 63       	ori	r18, 0x38	; 56
 32a:	68 65       	ori	r22, 0x58	; 88
 32c:	63 6b       	ori	r22, 0xB3	; 179
 32e:	20 49       	sbci	r18, 0x90	; 144
 330:	4e 53       	subi	r20, 0x3E	; 62
 332:	54 52       	subi	r21, 0x24	; 36
 334:	55 43       	sbci	r21, 0x35	; 53
 336:	54 49       	sbci	r21, 0x94	; 148
 338:	4f 4e       	sbci	r20, 0xEF	; 239
 33a:	53 2e       	mov	r5, r19
 33c:	6d 64       	ori	r22, 0x4D	; 77
 33e:	29 0d       	add	r18, r9
 340:	69 6a       	ori	r22, 0xA9	; 169
 342:	6d 70       	andi	r22, 0x0D	; 13
 344:	20 2d       	mov	r18, r0
 346:	20 69       	ori	r18, 0x90	; 144
 348:	6e 64       	ori	r22, 0x4E	; 78
 34a:	69 72       	andi	r22, 0x29	; 41
 34c:	65 63       	ori	r22, 0x35	; 53
 34e:	74 20       	and	r7, r4
 350:	6a 75       	andi	r22, 0x5A	; 90
 352:	6d 70       	andi	r22, 0x0D	; 13
 354:	20 74       	andi	r18, 0x40	; 64
 356:	6f 20       	and	r6, r15
 358:	61 64       	ori	r22, 0x41	; 65
 35a:	64 72       	andi	r22, 0x24	; 36
 35c:	65 73       	andi	r22, 0x35	; 53
 35e:	73 20       	and	r7, r3
 360:	28 63       	ori	r18, 0x38	; 56
 362:	68 65       	ori	r22, 0x58	; 88
 364:	63 6b       	ori	r22, 0xB3	; 179
 366:	20 49       	sbci	r18, 0x90	; 144
 368:	4e 53       	subi	r20, 0x3E	; 62
 36a:	54 52       	subi	r21, 0x24	; 36
 36c:	55 43       	sbci	r21, 0x35	; 53
 36e:	54 49       	sbci	r21, 0x94	; 148
 370:	4f 4e       	sbci	r20, 0xEF	; 239
 372:	53 2e       	mov	r5, r19
 374:	6d 64       	ori	r22, 0x4D	; 77
 376:	29 00       	.word	0x0029	; ????

00000378 <clearCommand>:
 378:	2b df       	rcall	.-426    	; 0x1d0 <terminalClear>
 37a:	08 95       	ret

0000037c <setZInfoMessage>:
 37c:	f3 e0       	ldi	r31, 0x03	; 3
 37e:	e8 e9       	ldi	r30, 0x98	; 152
 380:	08 95       	ret

00000382 <infoCommand>:
 382:	fc df       	rcall	.-8      	; 0x37c <setZInfoMessage>

00000384 <loop1>:
 384:	95 91       	lpm	r25, Z+
 386:	90 30       	cpi	r25, 0x00	; 0
 388:	21 f0       	breq	.+8      	; 0x392 <done1>
 38a:	9d 30       	cpi	r25, 0x0D	; 13
 38c:	19 f0       	breq	.+6      	; 0x394 <newLine>
 38e:	b6 de       	rcall	.-660    	; 0xfc <uartSend>
 390:	f9 cf       	rjmp	.-14     	; 0x384 <loop1>

00000392 <done1>:
 392:	08 95       	ret

00000394 <newLine>:
 394:	32 df       	rcall	.-412    	; 0x1fa <terminalNewLine>
 396:	f6 cf       	rjmp	.-20     	; 0x384 <loop1>

00000398 <infoMessage>:
 398:	20 20       	and	r2, r0
 39a:	20 20       	and	r2, r0
 39c:	20 20       	and	r2, r0
 39e:	5f 09       	sbc	r21, r15
 3a0:	20 20       	and	r2, r0
 3a2:	20 20       	and	r2, r0
 3a4:	20 20       	and	r2, r0
 3a6:	20 20       	and	r2, r0
 3a8:	5f 5f       	subi	r21, 0xFF	; 255
 3aa:	5f 5f       	subi	r21, 0xFF	; 255
 3ac:	5f 5f       	subi	r21, 0xFF	; 255
 3ae:	5f 2e       	mov	r5, r31
 3b0:	09 43       	sbci	r16, 0x39	; 57
 3b2:	50 55       	subi	r21, 0x50	; 80
 3b4:	3a 20       	and	r3, r10
 3b6:	41 54       	subi	r20, 0x41	; 65
 3b8:	6d 65       	ori	r22, 0x5D	; 93
 3ba:	67 61       	ori	r22, 0x17	; 23
 3bc:	33 32       	cpi	r19, 0x23	; 35
 3be:	38 70       	andi	r19, 0x08	; 8
 3c0:	0d 20       	and	r0, r13
 3c2:	20 20       	and	r2, r0
 3c4:	20 20       	and	r2, r0
 3c6:	2f 40       	sbci	r18, 0x0F	; 15
 3c8:	2e 20       	and	r2, r14
 3ca:	20 20       	and	r2, r0
 3cc:	20 20       	and	r2, r0
 3ce:	20 20       	and	r2, r0
 3d0:	2f 40       	sbci	r18, 0x0F	; 15
 3d2:	40 40       	sbci	r20, 0x00	; 0
 3d4:	40 40       	sbci	r20, 0x00	; 0
 3d6:	40 40       	sbci	r20, 0x00	; 0
 3d8:	40 2e       	mov	r4, r16
 3da:	09 53       	subi	r16, 0x39	; 57
 3dc:	52 41       	sbci	r21, 0x12	; 18
 3de:	4d 3a       	cpi	r20, 0xAD	; 173
 3e0:	20 32       	cpi	r18, 0x20	; 32
 3e2:	4b 42       	sbci	r20, 0x2B	; 43
 3e4:	0d 20       	and	r0, r13
 3e6:	20 20       	and	r2, r0
 3e8:	20 2f       	mov	r18, r16
 3ea:	40 5e       	subi	r20, 0xE0	; 224
 3ec:	40 2e       	mov	r4, r16
 3ee:	20 20       	and	r2, r0
 3f0:	20 20       	and	r2, r0
 3f2:	20 2f       	mov	r18, r16
 3f4:	40 2f       	mov	r20, r16
 3f6:	60 60       	ori	r22, 0x00	; 0
 3f8:	60 60       	ori	r22, 0x00	; 0
 3fa:	60 60       	ori	r22, 0x00	; 0
 3fc:	40 40       	sbci	r20, 0x00	; 0
 3fe:	2e 09       	sbc	r18, r14
 400:	46 4c       	sbci	r20, 0xC6	; 198
 402:	41 53       	subi	r20, 0x31	; 49
 404:	48 3a       	cpi	r20, 0xA8	; 168
 406:	20 33       	cpi	r18, 0x30	; 48
 408:	32 4b       	sbci	r19, 0xB2	; 178
 40a:	42 0d       	add	r20, r2
 40c:	20 20       	and	r2, r0
 40e:	20 2f       	mov	r18, r16
 410:	40 2f       	mov	r20, r16
 412:	5f 60       	ori	r21, 0x0F	; 15
 414:	40 2e       	mov	r4, r16
 416:	20 20       	and	r2, r0
 418:	20 2f       	mov	r18, r16
 41a:	40 40       	sbci	r20, 0x00	; 0
 41c:	40 40       	sbci	r20, 0x00	; 0
 41e:	40 40       	sbci	r20, 0x00	; 0
 420:	40 40       	sbci	r20, 0x00	; 0
 422:	40 40       	sbci	r20, 0x00	; 0
 424:	2f 09       	sbc	r18, r15
 426:	45 45       	sbci	r20, 0x55	; 85
 428:	50 52       	subi	r21, 0x20	; 32
 42a:	4f 4d       	sbci	r20, 0xDF	; 223
 42c:	3a 20       	and	r3, r10
 42e:	31 4b       	sbci	r19, 0xB1	; 177
 430:	42 0d       	add	r20, r2
 432:	20 20       	and	r2, r0
 434:	2f 40       	sbci	r18, 0x0F	; 15
 436:	40 40       	sbci	r20, 0x00	; 0
 438:	40 40       	sbci	r20, 0x00	; 0
 43a:	40 40       	sbci	r20, 0x00	; 0
 43c:	2e 20       	and	r2, r14
 43e:	2f 40       	sbci	r18, 0x0F	; 15
 440:	40 40       	sbci	r20, 0x00	; 0
 442:	40 2e       	mov	r4, r16
 444:	60 60       	ori	r22, 0x00	; 0
 446:	60 60       	ori	r22, 0x00	; 0
 448:	60 60       	ori	r22, 0x00	; 0
 44a:	09 41       	sbci	r16, 0x19	; 25
 44c:	56 52       	subi	r21, 0x26	; 38
 44e:	3a 20       	and	r3, r10
 450:	31 30       	cpi	r19, 0x01	; 1
 452:	30 25       	eor	r19, r0
 454:	0d 20       	and	r0, r13
 456:	2f 40       	sbci	r18, 0x0F	; 15
 458:	2f 60       	ori	r18, 0x0F	; 15
 45a:	60 60       	ori	r22, 0x00	; 0
 45c:	60 60       	ori	r22, 0x00	; 0
 45e:	40 40       	sbci	r20, 0x00	; 0
 460:	56 40       	sbci	r21, 0x06	; 6
 462:	2f 60       	ori	r18, 0x0F	; 15
 464:	40 40       	sbci	r20, 0x00	; 0
 466:	40 40       	sbci	r20, 0x00	; 0
 468:	2e 09       	sbc	r18, r14
 46a:	09 56       	subi	r16, 0x69	; 105
 46c:	45 52       	subi	r20, 0x25	; 37
 46e:	53 49       	sbci	r21, 0x93	; 147
 470:	4f 4e       	sbci	r20, 0xEF	; 239
 472:	3a 20       	and	r3, r10
 474:	30 2e       	mov	r3, r16
 476:	31 2e       	mov	r3, r17
 478:	30 2d       	mov	r19, r0
 47a:	61 6c       	ori	r22, 0xC1	; 193
 47c:	70 68       	ori	r23, 0x80	; 128
 47e:	61 0d       	add	r22, r1
 480:	2f 40       	sbci	r18, 0x0F	; 15
 482:	2f 20       	and	r2, r15
 484:	20 20       	and	r2, r0
 486:	20 20       	and	r2, r0
 488:	20 60       	ori	r18, 0x00	; 0
 48a:	40 40       	sbci	r20, 0x00	; 0
 48c:	2f 20       	and	r2, r15
 48e:	20 20       	and	r2, r0
 490:	20 60       	ori	r18, 0x00	; 0
 492:	40 40       	sbci	r20, 0x00	; 0
 494:	40 40       	sbci	r20, 0x00	; 0
 496:	2e 00       	.word	0x002e	; ????

00000498 <bufferAdd>:
 498:	07 d0       	rcall	.+14     	; 0x4a8 <incBL>
 49a:	01 32       	cpi	r16, 0x21	; 33
 49c:	e9 f0       	breq	.+58     	; 0x4d8 <overflow>
 49e:	9d 93       	st	X+, r25
 4a0:	08 95       	ret

000004a2 <bufferDel>:
 4a2:	07 d0       	rcall	.+14     	; 0x4b2 <decBL>
 4a4:	11 97       	sbiw	r26, 0x01	; 1
 4a6:	08 95       	ret

000004a8 <incBL>:
 4a8:	11 d0       	rcall	.+34     	; 0x4cc <setYBL>
 4aa:	08 81       	ld	r16, Y
 4ac:	03 95       	inc	r16
 4ae:	08 83       	st	Y, r16
 4b0:	08 95       	ret

000004b2 <decBL>:
 4b2:	0c d0       	rcall	.+24     	; 0x4cc <setYBL>
 4b4:	08 81       	ld	r16, Y
 4b6:	0a 95       	dec	r16
 4b8:	08 83       	st	Y, r16
 4ba:	08 95       	ret

000004bc <bufferReset>:
 4bc:	04 d0       	rcall	.+8      	; 0x4c6 <resetXBuffer>
 4be:	06 d0       	rcall	.+12     	; 0x4cc <setYBL>
 4c0:	00 e0       	ldi	r16, 0x00	; 0
 4c2:	08 83       	st	Y, r16
 4c4:	08 95       	ret

000004c6 <resetXBuffer>:
 4c6:	b1 e0       	ldi	r27, 0x01	; 1
 4c8:	a0 e0       	ldi	r26, 0x00	; 0
 4ca:	08 95       	ret

000004cc <setYBL>:
 4cc:	d1 e0       	ldi	r29, 0x01	; 1
 4ce:	c0 e2       	ldi	r28, 0x20	; 32
 4d0:	08 95       	ret

000004d2 <setZErrorOverflow>:
 4d2:	f4 e0       	ldi	r31, 0x04	; 4
 4d4:	ee ee       	ldi	r30, 0xEE	; 238
 4d6:	08 95       	ret

000004d8 <overflow>:
 4d8:	f1 df       	rcall	.-30     	; 0x4bc <bufferReset>
 4da:	fb df       	rcall	.-10     	; 0x4d2 <setZErrorOverflow>
 4dc:	8e de       	rcall	.-740    	; 0x1fa <terminalNewLine>

000004de <loop1>:
 4de:	95 91       	lpm	r25, Z+
 4e0:	99 23       	and	r25, r25
 4e2:	11 f0       	breq	.+4      	; 0x4e8 <done1>
 4e4:	0b de       	rcall	.-1002   	; 0xfc <uartSend>
 4e6:	fb cf       	rjmp	.-10     	; 0x4de <loop1>

000004e8 <done1>:
 4e8:	85 de       	rcall	.-758    	; 0x1f4 <terminalEnter>
 4ea:	99 27       	eor	r25, r25
 4ec:	08 95       	ret

000004ee <errorOverflow>:
 4ee:	45 52       	subi	r20, 0x25	; 37
 4f0:	52 4f       	sbci	r21, 0xF2	; 242
 4f2:	52 3a       	cpi	r21, 0xA2	; 162
 4f4:	20 4f       	sbci	r18, 0xF0	; 240
 4f6:	56 45       	sbci	r21, 0x56	; 86
 4f8:	52 46       	sbci	r21, 0x62	; 98
 4fa:	4c 4f       	sbci	r20, 0xFC	; 252
 4fc:	57 20       	and	r5, r7
 4fe:	33 32       	cpi	r19, 0x23	; 35
 500:	20 63       	ori	r18, 0x30	; 48
 502:	68 61       	ori	r22, 0x18	; 24
 504:	72 61       	ori	r23, 0x12	; 18
 506:	63 74       	andi	r22, 0x43	; 67
 508:	65 72       	andi	r22, 0x25	; 37
 50a:	20 6c       	ori	r18, 0xC0	; 192
 50c:	69 6d       	ori	r22, 0xD9	; 217
 50e:	69 74       	andi	r22, 0x49	; 73
 510:	21 00       	.word	0x0021	; ????

00000512 <parseCommand>:
 512:	a3 d0       	rcall	.+326    	; 0x65a <restoreBL>
 514:	04 30       	cpi	r16, 0x04	; 4
 516:	09 f4       	brne	.+2      	; 0x51a <notChar4>
 518:	58 c0       	rjmp	.+176    	; 0x5ca <char4>

0000051a <notChar4>:
 51a:	05 30       	cpi	r16, 0x05	; 5
 51c:	09 f4       	brne	.+2      	; 0x520 <notChar5>
 51e:	4b c0       	rjmp	.+150    	; 0x5b6 <char5>

00000520 <notChar5>:
 520:	09 30       	cpi	r16, 0x09	; 9
 522:	09 f4       	brne	.+2      	; 0x526 <notChar9>
 524:	41 c0       	rjmp	.+130    	; 0x5a8 <char9>

00000526 <notChar9>:
 526:	0a 30       	cpi	r16, 0x0A	; 10
 528:	09 f4       	brne	.+2      	; 0x52c <notChar10>
 52a:	37 c0       	rjmp	.+110    	; 0x59a <char10>

0000052c <notChar10>:
 52c:	0e 30       	cpi	r16, 0x0E	; 14
 52e:	09 f4       	brne	.+2      	; 0x532 <notChar14>
 530:	2d c0       	rjmp	.+90     	; 0x58c <char14>

00000532 <notChar14>:
 532:	00 c0       	rjmp	.+0      	; 0x534 <variableLength>

00000534 <variableLength>:
 534:	40 ef       	ldi	r20, 0xF0	; 240
 536:	7f d0       	rcall	.+254    	; 0x636 <setZEcho0>
 538:	05 e0       	ldi	r16, 0x05	; 5
 53a:	60 d0       	rcall	.+192    	; 0x5fc <noRestoreBL>
 53c:	31 30       	cpi	r19, 0x01	; 1
 53e:	09 f4       	brne	.+2      	; 0x542 <notEcho>
 540:	5a c0       	rjmp	.+180    	; 0x5f6 <done>

00000542 <notEcho>:
 542:	69 c0       	rjmp	.+210    	; 0x616 <invalidCommand>

00000544 <mreadADDR>:
 544:	12 e0       	ldi	r17, 0x02	; 2
 546:	cc d1       	rcall	.+920    	; 0x8e0 <ahtoi>
 548:	30 30       	cpi	r19, 0x00	; 0
 54a:	e9 f4       	brne	.+58     	; 0x586 <invalidArgument>
 54c:	54 c0       	rjmp	.+168    	; 0x5f6 <done>

0000054e <mwriteADDR>:
 54e:	12 e0       	ldi	r17, 0x02	; 2
 550:	c7 d1       	rcall	.+910    	; 0x8e0 <ahtoi>
 552:	30 30       	cpi	r19, 0x00	; 0
 554:	c1 f4       	brne	.+48     	; 0x586 <invalidArgument>
 556:	00 c0       	rjmp	.+0      	; 0x558 <mwriteADDR0>

00000558 <mwriteADDR0>:
 558:	7d d0       	rcall	.+250    	; 0x654 <setZSpace>
 55a:	01 e0       	ldi	r16, 0x01	; 1
 55c:	50 d0       	rcall	.+160    	; 0x5fe <check>
 55e:	31 30       	cpi	r19, 0x01	; 1
 560:	91 f4       	brne	.+36     	; 0x586 <invalidArgument>
 562:	00 c0       	rjmp	.+0      	; 0x564 <mwriteADDR0VV>

00000564 <mwriteADDR0VV>:
 564:	cd 2e       	mov	r12, r29
 566:	dc 2e       	mov	r13, r28
 568:	11 e0       	ldi	r17, 0x01	; 1
 56a:	ba d1       	rcall	.+884    	; 0x8e0 <ahtoi>
 56c:	30 30       	cpi	r19, 0x00	; 0
 56e:	59 f4       	brne	.+22     	; 0x586 <invalidArgument>
 570:	dc 2d       	mov	r29, r12
 572:	cd 2d       	mov	r28, r13
 574:	40 c0       	rjmp	.+128    	; 0x5f6 <done>

00000576 <ijmpADDR>:
 576:	12 e0       	ldi	r17, 0x02	; 2
 578:	b3 d1       	rcall	.+870    	; 0x8e0 <ahtoi>
 57a:	30 30       	cpi	r19, 0x00	; 0
 57c:	21 f4       	brne	.+8      	; 0x586 <invalidArgument>
 57e:	fe 01       	movw	r30, r28
 580:	f6 95       	lsr	r31
 582:	e7 95       	ror	r30
 584:	38 c0       	rjmp	.+112    	; 0x5f6 <done>

00000586 <invalidArgument>:
 586:	4d ef       	ldi	r20, 0xFD	; 253
 588:	04 2e       	mov	r0, r20
 58a:	08 95       	ret

0000058c <char14>:
 58c:	40 ec       	ldi	r20, 0xC0	; 192
 58e:	5c d0       	rcall	.+184    	; 0x648 <setZMwrite>
 590:	07 e0       	ldi	r16, 0x07	; 7
 592:	34 d0       	rcall	.+104    	; 0x5fc <noRestoreBL>
 594:	31 30       	cpi	r19, 0x01	; 1
 596:	d9 f2       	breq	.-74     	; 0x54e <mwriteADDR>
 598:	3e c0       	rjmp	.+124    	; 0x616 <invalidCommand>

0000059a <char10>:
 59a:	40 e8       	ldi	r20, 0x80	; 128
 59c:	58 d0       	rcall	.+176    	; 0x64e <setZMread>
 59e:	06 e0       	ldi	r16, 0x06	; 6
 5a0:	2d d0       	rcall	.+90     	; 0x5fc <noRestoreBL>
 5a2:	31 30       	cpi	r19, 0x01	; 1
 5a4:	79 f2       	breq	.-98     	; 0x544 <mreadADDR>
 5a6:	37 c0       	rjmp	.+110    	; 0x616 <invalidCommand>

000005a8 <char9>:
 5a8:	40 e7       	ldi	r20, 0x70	; 112
 5aa:	4b d0       	rcall	.+150    	; 0x642 <setZIndirectJump>
 5ac:	05 e0       	ldi	r16, 0x05	; 5
 5ae:	26 d0       	rcall	.+76     	; 0x5fc <noRestoreBL>
 5b0:	31 30       	cpi	r19, 0x01	; 1
 5b2:	09 f3       	breq	.-62     	; 0x576 <ijmpADDR>
 5b4:	30 c0       	rjmp	.+96     	; 0x616 <invalidCommand>

000005b6 <char5>:
 5b6:	40 e3       	ldi	r20, 0x30	; 48
 5b8:	3b d0       	rcall	.+118    	; 0x630 <setZClear>
 5ba:	1f d0       	rcall	.+62     	; 0x5fa <compareString>
 5bc:	31 30       	cpi	r19, 0x01	; 1
 5be:	d9 f0       	breq	.+54     	; 0x5f6 <done>
 5c0:	3a d0       	rcall	.+116    	; 0x636 <setZEcho0>
 5c2:	1b d0       	rcall	.+54     	; 0x5fa <compareString>
 5c4:	31 30       	cpi	r19, 0x01	; 1
 5c6:	99 f0       	breq	.+38     	; 0x5ee <handleEchoNoARG>
 5c8:	26 c0       	rjmp	.+76     	; 0x616 <invalidCommand>

000005ca <char4>:
 5ca:	40 e2       	ldi	r20, 0x20	; 32
 5cc:	28 d0       	rcall	.+80     	; 0x61e <setZHelp>
 5ce:	15 d0       	rcall	.+42     	; 0x5fa <compareString>
 5d0:	31 30       	cpi	r19, 0x01	; 1
 5d2:	89 f0       	breq	.+34     	; 0x5f6 <done>
 5d4:	27 d0       	rcall	.+78     	; 0x624 <setZInfo>
 5d6:	11 d0       	rcall	.+34     	; 0x5fa <compareString>
 5d8:	31 30       	cpi	r19, 0x01	; 1
 5da:	69 f0       	breq	.+26     	; 0x5f6 <done>
 5dc:	26 d0       	rcall	.+76     	; 0x62a <setZRegs>
 5de:	0d d0       	rcall	.+26     	; 0x5fa <compareString>
 5e0:	31 30       	cpi	r19, 0x01	; 1
 5e2:	49 f0       	breq	.+18     	; 0x5f6 <done>
 5e4:	2b d0       	rcall	.+86     	; 0x63c <setZEcho>
 5e6:	09 d0       	rcall	.+18     	; 0x5fa <compareString>
 5e8:	31 30       	cpi	r19, 0x01	; 1
 5ea:	09 f0       	breq	.+2      	; 0x5ee <handleEchoNoARG>
 5ec:	14 c0       	rjmp	.+40     	; 0x616 <invalidCommand>

000005ee <handleEchoNoARG>:
 5ee:	4e ef       	ldi	r20, 0xFE	; 254
 5f0:	04 2e       	mov	r0, r20
 5f2:	5e d1       	rcall	.+700    	; 0x8b0 <echoNoARG>
 5f4:	08 95       	ret

000005f6 <done>:
 5f6:	04 2e       	mov	r0, r20
 5f8:	08 95       	ret

000005fa <compareString>:
 5fa:	2f d0       	rcall	.+94     	; 0x65a <restoreBL>

000005fc <noRestoreBL>:
 5fc:	64 df       	rcall	.-312    	; 0x4c6 <resetXBuffer>

000005fe <check>:
 5fe:	1d 91       	ld	r17, X+
 600:	25 91       	lpm	r18, Z+
 602:	12 17       	cp	r17, r18
 604:	29 f4       	brne	.+10     	; 0x610 <notMatch>
 606:	0a 95       	dec	r16
 608:	00 23       	and	r16, r16
 60a:	c9 f7       	brne	.-14     	; 0x5fe <check>

0000060c <match>:
 60c:	31 e0       	ldi	r19, 0x01	; 1
 60e:	08 95       	ret

00000610 <notMatch>:
 610:	30 e0       	ldi	r19, 0x00	; 0
 612:	43 95       	inc	r20
 614:	08 95       	ret

00000616 <invalidCommand>:
 616:	57 df       	rcall	.-338    	; 0x4c6 <resetXBuffer>
 618:	1f ef       	ldi	r17, 0xFF	; 255
 61a:	01 2e       	mov	r0, r17
 61c:	08 95       	ret

0000061e <setZHelp>:
 61e:	f6 e0       	ldi	r31, 0x06	; 6
 620:	e0 e6       	ldi	r30, 0x60	; 96
 622:	08 95       	ret

00000624 <setZInfo>:
 624:	f6 e0       	ldi	r31, 0x06	; 6
 626:	e4 e6       	ldi	r30, 0x64	; 100
 628:	08 95       	ret

0000062a <setZRegs>:
 62a:	f6 e0       	ldi	r31, 0x06	; 6
 62c:	e8 e6       	ldi	r30, 0x68	; 104
 62e:	08 95       	ret

00000630 <setZClear>:
 630:	f6 e0       	ldi	r31, 0x06	; 6
 632:	ec e6       	ldi	r30, 0x6C	; 108
 634:	08 95       	ret

00000636 <setZEcho0>:
 636:	f6 e0       	ldi	r31, 0x06	; 6
 638:	e1 e7       	ldi	r30, 0x71	; 113
 63a:	08 95       	ret

0000063c <setZEcho>:
 63c:	f6 e0       	ldi	r31, 0x06	; 6
 63e:	e6 e7       	ldi	r30, 0x76	; 118
 640:	08 95       	ret

00000642 <setZIndirectJump>:
 642:	f6 e0       	ldi	r31, 0x06	; 6
 644:	e8 e8       	ldi	r30, 0x88	; 136
 646:	08 95       	ret

00000648 <setZMwrite>:
 648:	f6 e0       	ldi	r31, 0x06	; 6
 64a:	e0 e8       	ldi	r30, 0x80	; 128
 64c:	08 95       	ret

0000064e <setZMread>:
 64e:	f6 e0       	ldi	r31, 0x06	; 6
 650:	ea e7       	ldi	r30, 0x7A	; 122
 652:	08 95       	ret

00000654 <setZSpace>:
 654:	f6 e0       	ldi	r31, 0x06	; 6
 656:	e7 e8       	ldi	r30, 0x87	; 135
 658:	08 95       	ret

0000065a <restoreBL>:
 65a:	38 df       	rcall	.-400    	; 0x4cc <setYBL>
 65c:	08 81       	ld	r16, Y
 65e:	08 95       	ret

00000660 <help>:
 660:	68 65       	ori	r22, 0x58	; 88
 662:	6c 70       	andi	r22, 0x0C	; 12

00000664 <info>:
 664:	69 6e       	ori	r22, 0xE9	; 233
 666:	66 6f       	ori	r22, 0xF6	; 246

00000668 <regs>:
 668:	72 65       	ori	r23, 0x52	; 82
 66a:	67 73       	andi	r22, 0x37	; 55

0000066c <clear>:
 66c:	63 6c       	ori	r22, 0xC3	; 195
 66e:	65 61       	ori	r22, 0x15	; 21
 670:	Address 0x670 is out of bounds.


00000671 <echo0>:
 671:	65 63       	ori	r22, 0x35	; 53
 673:	68 6f       	ori	r22, 0xF8	; 248
 675:	Address 0x675 is out of bounds.


00000676 <echo>:
 676:	65 63       	ori	r22, 0x35	; 53
 678:	68 6f       	ori	r22, 0xF8	; 248

0000067a <mread>:
 67a:	6d 72       	andi	r22, 0x2D	; 45
 67c:	65 61       	ori	r22, 0x15	; 21
 67e:	64 20       	and	r6, r4

00000680 <mwrite>:
 680:	6d 77       	andi	r22, 0x7D	; 125
 682:	72 69       	ori	r23, 0x92	; 146
 684:	74 65       	ori	r23, 0x54	; 84
 686:	Address 0x686 is out of bounds.


00000687 <space>:
 687:	Address 0x687 is out of bounds.


00000688 <indirectJump>:
 688:	69 6a       	ori	r22, 0xA9	; 169
 68a:	6d 70       	andi	r22, 0x0D	; 13
 68c:	20 00       	.word	0x0020	; ????

0000068e <regsCommand>:
 68e:	00 27       	eor	r16, r16
 690:	81 d0       	rcall	.+258    	; 0x794 <setZRegs>
 692:	ef 01       	movw	r28, r30

00000694 <loop1>:
 694:	fe 01       	movw	r30, r28
 696:	95 91       	lpm	r25, Z+
 698:	ef 01       	movw	r28, r30
 69a:	99 23       	and	r25, r25
 69c:	31 f0       	breq	.+12     	; 0x6aa <done1>
 69e:	9d 30       	cpi	r25, 0x0D	; 13
 6a0:	29 f0       	breq	.+10     	; 0x6ac <newLine>
 6a2:	9a 30       	cpi	r25, 0x0A	; 10
 6a4:	29 f0       	breq	.+10     	; 0x6b0 <printRegs>
 6a6:	2a dd       	rcall	.-1452   	; 0xfc <uartSend>
 6a8:	f5 cf       	rjmp	.-22     	; 0x694 <loop1>

000006aa <done1>:
 6aa:	08 95       	ret

000006ac <newLine>:
 6ac:	a6 dd       	rcall	.-1204   	; 0x1fa <terminalNewLine>
 6ae:	f2 cf       	rjmp	.-28     	; 0x694 <loop1>

000006b0 <printRegs>:
 6b0:	ef 01       	movw	r28, r30
 6b2:	03 d0       	rcall	.+6      	; 0x6ba <setZIjmpList>
 6b4:	e0 0f       	add	r30, r16
 6b6:	f1 1d       	adc	r31, r1
 6b8:	09 94       	ijmp

000006ba <setZIjmpList>:
 6ba:	f3 e0       	ldi	r31, 0x03	; 3
 6bc:	e0 e6       	ldi	r30, 0x60	; 96
 6be:	08 95       	ret

000006c0 <ijmpList>:
 6c0:	23 c0       	rjmp	.+70     	; 0x708 <r0>
 6c2:	24 c0       	rjmp	.+72     	; 0x70c <r1>
 6c4:	25 c0       	rjmp	.+74     	; 0x710 <r2>
 6c6:	26 c0       	rjmp	.+76     	; 0x714 <r3>
 6c8:	27 c0       	rjmp	.+78     	; 0x718 <r4>
 6ca:	28 c0       	rjmp	.+80     	; 0x71c <r5>
 6cc:	29 c0       	rjmp	.+82     	; 0x720 <r6>
 6ce:	2a c0       	rjmp	.+84     	; 0x724 <r7>
 6d0:	2b c0       	rjmp	.+86     	; 0x728 <r8>
 6d2:	2c c0       	rjmp	.+88     	; 0x72c <r9>
 6d4:	2d c0       	rjmp	.+90     	; 0x730 <r10>
 6d6:	2e c0       	rjmp	.+92     	; 0x734 <r11>
 6d8:	2f c0       	rjmp	.+94     	; 0x738 <r12>
 6da:	30 c0       	rjmp	.+96     	; 0x73c <r13>
 6dc:	31 c0       	rjmp	.+98     	; 0x740 <r14>
 6de:	32 c0       	rjmp	.+100    	; 0x744 <r15>
 6e0:	33 c0       	rjmp	.+102    	; 0x748 <r16>
 6e2:	34 c0       	rjmp	.+104    	; 0x74c <r17>
 6e4:	35 c0       	rjmp	.+106    	; 0x750 <r18>
 6e6:	36 c0       	rjmp	.+108    	; 0x754 <r19>
 6e8:	37 c0       	rjmp	.+110    	; 0x758 <r20>
 6ea:	38 c0       	rjmp	.+112    	; 0x75c <r21>
 6ec:	38 c0       	rjmp	.+112    	; 0x75e <r22>
 6ee:	39 c0       	rjmp	.+114    	; 0x762 <r23>
 6f0:	3a c0       	rjmp	.+116    	; 0x766 <r24>
 6f2:	3b c0       	rjmp	.+118    	; 0x76a <r25>
 6f4:	3c c0       	rjmp	.+120    	; 0x76e <r26>
 6f6:	3d c0       	rjmp	.+122    	; 0x772 <r27>
 6f8:	3e c0       	rjmp	.+124    	; 0x776 <r28>
 6fa:	3f c0       	rjmp	.+126    	; 0x77a <r29>
 6fc:	40 c0       	rjmp	.+128    	; 0x77e <r30>
 6fe:	41 c0       	rjmp	.+130    	; 0x782 <r31>
 700:	42 c0       	rjmp	.+132    	; 0x786 <SP>

00000702 <shortcut>:
 702:	15 dd       	rcall	.-1494   	; 0x12e <uartSendHex>
 704:	03 95       	inc	r16
 706:	c6 cf       	rjmp	.-116    	; 0x694 <loop1>

00000708 <r0>:
 708:	50 2d       	mov	r21, r0
 70a:	fb cf       	rjmp	.-10     	; 0x702 <shortcut>

0000070c <r1>:
 70c:	51 2d       	mov	r21, r1
 70e:	f9 cf       	rjmp	.-14     	; 0x702 <shortcut>

00000710 <r2>:
 710:	52 2d       	mov	r21, r2
 712:	f7 cf       	rjmp	.-18     	; 0x702 <shortcut>

00000714 <r3>:
 714:	53 2d       	mov	r21, r3
 716:	f5 cf       	rjmp	.-22     	; 0x702 <shortcut>

00000718 <r4>:
 718:	54 2d       	mov	r21, r4
 71a:	f3 cf       	rjmp	.-26     	; 0x702 <shortcut>

0000071c <r5>:
 71c:	55 2d       	mov	r21, r5
 71e:	f1 cf       	rjmp	.-30     	; 0x702 <shortcut>

00000720 <r6>:
 720:	56 2d       	mov	r21, r6
 722:	ef cf       	rjmp	.-34     	; 0x702 <shortcut>

00000724 <r7>:
 724:	57 2d       	mov	r21, r7
 726:	ed cf       	rjmp	.-38     	; 0x702 <shortcut>

00000728 <r8>:
 728:	58 2d       	mov	r21, r8
 72a:	eb cf       	rjmp	.-42     	; 0x702 <shortcut>

0000072c <r9>:
 72c:	59 2d       	mov	r21, r9
 72e:	e9 cf       	rjmp	.-46     	; 0x702 <shortcut>

00000730 <r10>:
 730:	5a 2d       	mov	r21, r10
 732:	e7 cf       	rjmp	.-50     	; 0x702 <shortcut>

00000734 <r11>:
 734:	5b 2d       	mov	r21, r11
 736:	e5 cf       	rjmp	.-54     	; 0x702 <shortcut>

00000738 <r12>:
 738:	5c 2d       	mov	r21, r12
 73a:	e3 cf       	rjmp	.-58     	; 0x702 <shortcut>

0000073c <r13>:
 73c:	5d 2d       	mov	r21, r13
 73e:	e1 cf       	rjmp	.-62     	; 0x702 <shortcut>

00000740 <r14>:
 740:	5e 2d       	mov	r21, r14
 742:	df cf       	rjmp	.-66     	; 0x702 <shortcut>

00000744 <r15>:
 744:	5f 2d       	mov	r21, r15
 746:	dd cf       	rjmp	.-70     	; 0x702 <shortcut>

00000748 <r16>:
 748:	50 2f       	mov	r21, r16
 74a:	db cf       	rjmp	.-74     	; 0x702 <shortcut>

0000074c <r17>:
 74c:	51 2f       	mov	r21, r17
 74e:	d9 cf       	rjmp	.-78     	; 0x702 <shortcut>

00000750 <r18>:
 750:	52 2f       	mov	r21, r18
 752:	d7 cf       	rjmp	.-82     	; 0x702 <shortcut>

00000754 <r19>:
 754:	53 2f       	mov	r21, r19
 756:	d5 cf       	rjmp	.-86     	; 0x702 <shortcut>

00000758 <r20>:
 758:	54 2f       	mov	r21, r20
 75a:	d3 cf       	rjmp	.-90     	; 0x702 <shortcut>

0000075c <r21>:
 75c:	d2 cf       	rjmp	.-92     	; 0x702 <shortcut>

0000075e <r22>:
 75e:	56 2f       	mov	r21, r22
 760:	d0 cf       	rjmp	.-96     	; 0x702 <shortcut>

00000762 <r23>:
 762:	57 2f       	mov	r21, r23
 764:	ce cf       	rjmp	.-100    	; 0x702 <shortcut>

00000766 <r24>:
 766:	58 2f       	mov	r21, r24
 768:	cc cf       	rjmp	.-104    	; 0x702 <shortcut>

0000076a <r25>:
 76a:	59 2f       	mov	r21, r25
 76c:	ca cf       	rjmp	.-108    	; 0x702 <shortcut>

0000076e <r26>:
 76e:	5a 2f       	mov	r21, r26
 770:	c8 cf       	rjmp	.-112    	; 0x702 <shortcut>

00000772 <r27>:
 772:	5b 2f       	mov	r21, r27
 774:	c6 cf       	rjmp	.-116    	; 0x702 <shortcut>

00000776 <r28>:
 776:	5c 2f       	mov	r21, r28
 778:	c4 cf       	rjmp	.-120    	; 0x702 <shortcut>

0000077a <r29>:
 77a:	5d 2f       	mov	r21, r29
 77c:	c2 cf       	rjmp	.-124    	; 0x702 <shortcut>

0000077e <r30>:
 77e:	5e 2f       	mov	r21, r30
 780:	c0 cf       	rjmp	.-128    	; 0x702 <shortcut>

00000782 <r31>:
 782:	5f 2f       	mov	r21, r31
 784:	be cf       	rjmp	.-132    	; 0x702 <shortcut>

00000786 <SP>:
 786:	50 91 5e 00 	lds	r21, 0x005E	; 0x80005e <__TEXT_REGION_LENGTH__+0x7e005e>
 78a:	d1 dc       	rcall	.-1630   	; 0x12e <uartSendHex>
 78c:	50 91 5d 00 	lds	r21, 0x005D	; 0x80005d <__TEXT_REGION_LENGTH__+0x7e005d>
 790:	ce dc       	rcall	.-1636   	; 0x12e <uartSendHex>
 792:	8b cf       	rjmp	.-234    	; 0x6aa <done1>

00000794 <setZRegs>:
 794:	f7 e0       	ldi	r31, 0x07	; 7
 796:	ea e9       	ldi	r30, 0x9A	; 154
 798:	08 95       	ret

0000079a <regsMessage>:
 79a:	72 30       	cpi	r23, 0x02	; 2
 79c:	3a 30       	cpi	r19, 0x0A	; 10
 79e:	78 0a       	sbc	r7, r24
 7a0:	20 72       	andi	r18, 0x20	; 32
 7a2:	31 3a       	cpi	r19, 0xA1	; 161
 7a4:	30 78       	andi	r19, 0x80	; 128
 7a6:	0a 20       	and	r0, r10
 7a8:	72 32       	cpi	r23, 0x22	; 34
 7aa:	3a 30       	cpi	r19, 0x0A	; 10
 7ac:	78 0a       	sbc	r7, r24
 7ae:	20 72       	andi	r18, 0x20	; 32
 7b0:	33 3a       	cpi	r19, 0xA3	; 163
 7b2:	30 78       	andi	r19, 0x80	; 128
 7b4:	0a 20       	and	r0, r10
 7b6:	72 34       	cpi	r23, 0x42	; 66
 7b8:	3a 30       	cpi	r19, 0x0A	; 10
 7ba:	78 0a       	sbc	r7, r24
 7bc:	20 72       	andi	r18, 0x20	; 32
 7be:	35 3a       	cpi	r19, 0xA5	; 165
 7c0:	30 78       	andi	r19, 0x80	; 128
 7c2:	0a 0d       	add	r16, r10
 7c4:	72 36       	cpi	r23, 0x62	; 98
 7c6:	3a 30       	cpi	r19, 0x0A	; 10
 7c8:	78 0a       	sbc	r7, r24
 7ca:	20 72       	andi	r18, 0x20	; 32
 7cc:	37 3a       	cpi	r19, 0xA7	; 167
 7ce:	30 78       	andi	r19, 0x80	; 128
 7d0:	0a 20       	and	r0, r10
 7d2:	72 38       	cpi	r23, 0x82	; 130
 7d4:	3a 30       	cpi	r19, 0x0A	; 10
 7d6:	78 0a       	sbc	r7, r24
 7d8:	20 72       	andi	r18, 0x20	; 32
 7da:	39 3a       	cpi	r19, 0xA9	; 169
 7dc:	30 78       	andi	r19, 0x80	; 128
 7de:	0a 20       	and	r0, r10
 7e0:	72 31       	cpi	r23, 0x12	; 18
 7e2:	30 3a       	cpi	r19, 0xA0	; 160
 7e4:	30 78       	andi	r19, 0x80	; 128
 7e6:	0a 20       	and	r0, r10
 7e8:	72 31       	cpi	r23, 0x12	; 18
 7ea:	31 3a       	cpi	r19, 0xA1	; 161
 7ec:	30 78       	andi	r19, 0x80	; 128
 7ee:	0a 0d       	add	r16, r10
 7f0:	72 31       	cpi	r23, 0x12	; 18
 7f2:	32 3a       	cpi	r19, 0xA2	; 162
 7f4:	30 78       	andi	r19, 0x80	; 128
 7f6:	0a 20       	and	r0, r10
 7f8:	72 31       	cpi	r23, 0x12	; 18
 7fa:	33 3a       	cpi	r19, 0xA3	; 163
 7fc:	30 78       	andi	r19, 0x80	; 128
 7fe:	0a 20       	and	r0, r10
 800:	72 31       	cpi	r23, 0x12	; 18
 802:	34 3a       	cpi	r19, 0xA4	; 164
 804:	30 78       	andi	r19, 0x80	; 128
 806:	0a 20       	and	r0, r10
 808:	72 31       	cpi	r23, 0x12	; 18
 80a:	35 3a       	cpi	r19, 0xA5	; 165
 80c:	30 78       	andi	r19, 0x80	; 128
 80e:	0a 20       	and	r0, r10
 810:	72 31       	cpi	r23, 0x12	; 18
 812:	36 3a       	cpi	r19, 0xA6	; 166
 814:	30 78       	andi	r19, 0x80	; 128
 816:	0a 20       	and	r0, r10
 818:	72 31       	cpi	r23, 0x12	; 18
 81a:	37 3a       	cpi	r19, 0xA7	; 167
 81c:	30 78       	andi	r19, 0x80	; 128
 81e:	0a 0d       	add	r16, r10
 820:	72 31       	cpi	r23, 0x12	; 18
 822:	38 3a       	cpi	r19, 0xA8	; 168
 824:	30 78       	andi	r19, 0x80	; 128
 826:	0a 20       	and	r0, r10
 828:	72 31       	cpi	r23, 0x12	; 18
 82a:	39 3a       	cpi	r19, 0xA9	; 169
 82c:	30 78       	andi	r19, 0x80	; 128
 82e:	0a 20       	and	r0, r10
 830:	72 32       	cpi	r23, 0x22	; 34
 832:	30 3a       	cpi	r19, 0xA0	; 160
 834:	30 78       	andi	r19, 0x80	; 128
 836:	0a 20       	and	r0, r10
 838:	72 32       	cpi	r23, 0x22	; 34
 83a:	31 3a       	cpi	r19, 0xA1	; 161
 83c:	30 78       	andi	r19, 0x80	; 128
 83e:	0a 20       	and	r0, r10
 840:	72 32       	cpi	r23, 0x22	; 34
 842:	32 3a       	cpi	r19, 0xA2	; 162
 844:	30 78       	andi	r19, 0x80	; 128
 846:	0a 20       	and	r0, r10
 848:	72 32       	cpi	r23, 0x22	; 34
 84a:	33 3a       	cpi	r19, 0xA3	; 163
 84c:	30 78       	andi	r19, 0x80	; 128
 84e:	0a 0d       	add	r16, r10
 850:	72 32       	cpi	r23, 0x22	; 34
 852:	34 3a       	cpi	r19, 0xA4	; 164
 854:	30 78       	andi	r19, 0x80	; 128
 856:	0a 20       	and	r0, r10
 858:	72 32       	cpi	r23, 0x22	; 34
 85a:	35 3a       	cpi	r19, 0xA5	; 165
 85c:	30 78       	andi	r19, 0x80	; 128
 85e:	0a 20       	and	r0, r10
 860:	72 32       	cpi	r23, 0x22	; 34
 862:	36 3a       	cpi	r19, 0xA6	; 166
 864:	30 78       	andi	r19, 0x80	; 128
 866:	0a 20       	and	r0, r10
 868:	72 32       	cpi	r23, 0x22	; 34
 86a:	37 3a       	cpi	r19, 0xA7	; 167
 86c:	30 78       	andi	r19, 0x80	; 128
 86e:	0a 20       	and	r0, r10
 870:	72 32       	cpi	r23, 0x22	; 34
 872:	38 3a       	cpi	r19, 0xA8	; 168
 874:	30 78       	andi	r19, 0x80	; 128
 876:	0a 20       	and	r0, r10
 878:	72 32       	cpi	r23, 0x22	; 34
 87a:	39 3a       	cpi	r19, 0xA9	; 169
 87c:	30 78       	andi	r19, 0x80	; 128
 87e:	0a 0d       	add	r16, r10
 880:	72 33       	cpi	r23, 0x32	; 50
 882:	30 3a       	cpi	r19, 0xA0	; 160
 884:	30 78       	andi	r19, 0x80	; 128
 886:	0a 20       	and	r0, r10
 888:	72 33       	cpi	r23, 0x32	; 50
 88a:	31 3a       	cpi	r19, 0xA1	; 161
 88c:	30 78       	andi	r19, 0x80	; 128
 88e:	0a 20       	and	r0, r10
 890:	53 50       	subi	r21, 0x03	; 3
 892:	3a 30       	cpi	r19, 0x0A	; 10
 894:	78 0a       	sbc	r7, r24
	...

00000898 <echoCommand>:
 898:	19 de       	rcall	.-974    	; 0x4cc <setYBL>
 89a:	08 81       	ld	r16, Y
 89c:	14 de       	rcall	.-984    	; 0x4c6 <resetXBuffer>
 89e:	15 96       	adiw	r26, 0x05	; 5
 8a0:	05 50       	subi	r16, 0x05	; 5

000008a2 <loop1>:
 8a2:	00 23       	and	r16, r16
 8a4:	21 f0       	breq	.+8      	; 0x8ae <done1>
 8a6:	9d 91       	ld	r25, X+
 8a8:	29 dc       	rcall	.-1966   	; 0xfc <uartSend>
 8aa:	0a 95       	dec	r16
 8ac:	fa cf       	rjmp	.-12     	; 0x8a2 <loop1>

000008ae <done1>:
 8ae:	08 95       	ret

000008b0 <echoNoARG>:
 8b0:	06 d0       	rcall	.+12     	; 0x8be <setZNoARG>

000008b2 <loop2>:
 8b2:	95 91       	lpm	r25, Z+
 8b4:	90 30       	cpi	r25, 0x00	; 0
 8b6:	11 f0       	breq	.+4      	; 0x8bc <done2>
 8b8:	21 dc       	rcall	.-1982   	; 0xfc <uartSend>
 8ba:	fb cf       	rjmp	.-10     	; 0x8b2 <loop2>

000008bc <done2>:
 8bc:	08 95       	ret

000008be <setZNoARG>:
 8be:	f8 e0       	ldi	r31, 0x08	; 8
 8c0:	e4 ec       	ldi	r30, 0xC4	; 196
 8c2:	08 95       	ret

000008c4 <noARG>:
 8c4:	45 52       	subi	r20, 0x25	; 37
 8c6:	52 4f       	sbci	r21, 0xF2	; 242
 8c8:	52 3a       	cpi	r21, 0xA2	; 162
 8ca:	20 4e       	sbci	r18, 0xE0	; 224
 8cc:	6f 20       	and	r6, r15
 8ce:	61 72       	andi	r22, 0x21	; 33
 8d0:	67 75       	andi	r22, 0x57	; 87
 8d2:	6d 65       	ori	r22, 0x5D	; 93
 8d4:	6e 74       	andi	r22, 0x4E	; 78
 8d6:	20 70       	andi	r18, 0x00	; 0
 8d8:	72 6f       	ori	r23, 0xF2	; 242
 8da:	76 69       	ori	r23, 0x96	; 150
 8dc:	64 65       	ori	r22, 0x54	; 84
 8de:	64 00       	.word	0x0064	; ????

000008e0 <ahtoi>:
 8e0:	33 27       	eor	r19, r19
 8e2:	cc 27       	eor	r28, r28
 8e4:	dd 27       	eor	r29, r29
 8e6:	ee 27       	eor	r30, r30
 8e8:	ff 27       	eor	r31, r31
 8ea:	12 30       	cpi	r17, 0x02	; 2
 8ec:	09 f0       	breq	.+2      	; 0x8f0 <ahtoiword>
 8ee:	25 c0       	rjmp	.+74     	; 0x93a <ahtoibyte>

000008f0 <ahtoiword>:
 8f0:	2d 91       	ld	r18, X+
 8f2:	2f d0       	rcall	.+94     	; 0x952 <isValidChar>
 8f4:	31 30       	cpi	r19, 0x01	; 1
 8f6:	f1 f0       	breq	.+60     	; 0x934 <abort>
 8f8:	c2 2f       	mov	r28, r18
 8fa:	48 d0       	rcall	.+144    	; 0x98c <Yx16>
 8fc:	47 d0       	rcall	.+142    	; 0x98c <Yx16>
 8fe:	46 d0       	rcall	.+140    	; 0x98c <Yx16>

00000900 <char2>:
 900:	2d 91       	ld	r18, X+
 902:	27 d0       	rcall	.+78     	; 0x952 <isValidChar>
 904:	31 30       	cpi	r19, 0x01	; 1
 906:	b1 f0       	breq	.+44     	; 0x934 <abort>
 908:	e2 2f       	mov	r30, r18
 90a:	49 d0       	rcall	.+146    	; 0x99e <Zx16>
 90c:	48 d0       	rcall	.+144    	; 0x99e <Zx16>
 90e:	ce 0f       	add	r28, r30
 910:	df 1f       	adc	r29, r31

00000912 <char3>:
 912:	2d 91       	ld	r18, X+
 914:	1e d0       	rcall	.+60     	; 0x952 <isValidChar>
 916:	31 30       	cpi	r19, 0x01	; 1
 918:	69 f0       	breq	.+26     	; 0x934 <abort>
 91a:	ee 27       	eor	r30, r30
 91c:	ff 27       	eor	r31, r31
 91e:	e2 2f       	mov	r30, r18
 920:	3e d0       	rcall	.+124    	; 0x99e <Zx16>
 922:	ce 0f       	add	r28, r30
 924:	df 1f       	adc	r29, r31

00000926 <char4>:
 926:	2d 91       	ld	r18, X+
 928:	14 d0       	rcall	.+40     	; 0x952 <isValidChar>
 92a:	31 30       	cpi	r19, 0x01	; 1
 92c:	19 f0       	breq	.+6      	; 0x934 <abort>
 92e:	c2 0f       	add	r28, r18
 930:	d1 1d       	adc	r29, r1
 932:	08 95       	ret

00000934 <abort>:
 934:	2d ef       	ldi	r18, 0xFD	; 253
 936:	02 2e       	mov	r0, r18
 938:	08 95       	ret

0000093a <ahtoibyte>:
 93a:	2d 91       	ld	r18, X+
 93c:	0a d0       	rcall	.+20     	; 0x952 <isValidChar>
 93e:	31 30       	cpi	r19, 0x01	; 1
 940:	c9 f3       	breq	.-14     	; 0x934 <abort>
 942:	1f d0       	rcall	.+62     	; 0x982 <bytex16>
 944:	22 2e       	mov	r2, r18

00000946 <char2b>:
 946:	2d 91       	ld	r18, X+
 948:	04 d0       	rcall	.+8      	; 0x952 <isValidChar>
 94a:	31 30       	cpi	r19, 0x01	; 1
 94c:	99 f3       	breq	.-26     	; 0x934 <abort>
 94e:	22 0e       	add	r2, r18
 950:	08 95       	ret

00000952 <isValidChar>:
 952:	21 36       	cpi	r18, 0x61	; 97
 954:	40 f4       	brcc	.+16     	; 0x966 <lowerLetterRangeLowercase>
 956:	20 33       	cpi	r18, 0x30	; 48
 958:	18 f4       	brcc	.+6      	; 0x960 <lowerDigitRange>
 95a:	21 34       	cpi	r18, 0x41	; 65
 95c:	38 f4       	brcc	.+14     	; 0x96c <lowerLetterRangeUppercase>
 95e:	0f c0       	rjmp	.+30     	; 0x97e <invalidChar>

00000960 <lowerDigitRange>:
 960:	2a 33       	cpi	r18, 0x3A	; 58
 962:	38 f0       	brcs	.+14     	; 0x972 <validDigit>
 964:	0c c0       	rjmp	.+24     	; 0x97e <invalidChar>

00000966 <lowerLetterRangeLowercase>:
 966:	27 36       	cpi	r18, 0x67	; 103
 968:	40 f0       	brcs	.+16     	; 0x97a <validLetterLowercase>
 96a:	09 c0       	rjmp	.+18     	; 0x97e <invalidChar>

0000096c <lowerLetterRangeUppercase>:
 96c:	27 34       	cpi	r18, 0x47	; 71
 96e:	18 f0       	brcs	.+6      	; 0x976 <validLetterUppercase>
 970:	06 c0       	rjmp	.+12     	; 0x97e <invalidChar>

00000972 <validDigit>:
 972:	20 53       	subi	r18, 0x30	; 48
 974:	08 95       	ret

00000976 <validLetterUppercase>:
 976:	27 53       	subi	r18, 0x37	; 55
 978:	08 95       	ret

0000097a <validLetterLowercase>:
 97a:	27 55       	subi	r18, 0x57	; 87
 97c:	08 95       	ret

0000097e <invalidChar>:
 97e:	31 e0       	ldi	r19, 0x01	; 1
 980:	08 95       	ret

00000982 <bytex16>:
 982:	22 0f       	add	r18, r18
 984:	22 0f       	add	r18, r18
 986:	22 0f       	add	r18, r18
 988:	22 0f       	add	r18, r18
 98a:	08 95       	ret

0000098c <Yx16>:
 98c:	cc 0f       	add	r28, r28
 98e:	dd 1f       	adc	r29, r29
 990:	cc 0f       	add	r28, r28
 992:	dd 1f       	adc	r29, r29
 994:	cc 0f       	add	r28, r28
 996:	dd 1f       	adc	r29, r29
 998:	cc 0f       	add	r28, r28
 99a:	dd 1f       	adc	r29, r29
 99c:	08 95       	ret

0000099e <Zx16>:
 99e:	ee 0f       	add	r30, r30
 9a0:	ff 1f       	adc	r31, r31
 9a2:	ee 0f       	add	r30, r30
 9a4:	ff 1f       	adc	r31, r31
 9a6:	ee 0f       	add	r30, r30
 9a8:	ff 1f       	adc	r31, r31
 9aa:	ee 0f       	add	r30, r30
 9ac:	ff 1f       	adc	r31, r31
 9ae:	08 95       	ret

000009b0 <mwrite>:
 9b0:	28 82       	st	Y, r2
 9b2:	1d d0       	rcall	.+58     	; 0x9ee <setZWriteMessage>

000009b4 <loop2>:
 9b4:	95 91       	lpm	r25, Z+
 9b6:	9a 30       	cpi	r25, 0x0A	; 10
 9b8:	21 f0       	breq	.+8      	; 0x9c2 <valuer2>
 9ba:	9d 30       	cpi	r25, 0x0D	; 13
 9bc:	39 f0       	breq	.+14     	; 0x9cc <addressY>
 9be:	9e db       	rcall	.-2244   	; 0xfc <uartSend>
 9c0:	f9 cf       	rjmp	.-14     	; 0x9b4 <loop2>

000009c2 <valuer2>:
 9c2:	52 2d       	mov	r21, r2
 9c4:	b4 db       	rcall	.-2200   	; 0x12e <uartSendHex>
 9c6:	13 d0       	rcall	.+38     	; 0x9ee <setZWriteMessage>
 9c8:	71 96       	adiw	r30, 0x11	; 17
 9ca:	f4 cf       	rjmp	.-24     	; 0x9b4 <loop2>

000009cc <addressY>:
 9cc:	5d 2f       	mov	r21, r29
 9ce:	af db       	rcall	.-2210   	; 0x12e <uartSendHex>
 9d0:	5c 2f       	mov	r21, r28
 9d2:	ad db       	rcall	.-2214   	; 0x12e <uartSendHex>
 9d4:	08 95       	ret

000009d6 <mread>:
 9d6:	08 d0       	rcall	.+16     	; 0x9e8 <setZReadMessage>

000009d8 <loop1>:
 9d8:	95 91       	lpm	r25, Z+
 9da:	9a 30       	cpi	r25, 0x0A	; 10
 9dc:	11 f0       	breq	.+4      	; 0x9e2 <printValue>
 9de:	8e db       	rcall	.-2276   	; 0xfc <uartSend>
 9e0:	fb cf       	rjmp	.-10     	; 0x9d8 <loop1>

000009e2 <printValue>:
 9e2:	58 81       	ld	r21, Y
 9e4:	a4 db       	rcall	.-2232   	; 0x12e <uartSendHex>
 9e6:	08 95       	ret

000009e8 <setZReadMessage>:
 9e8:	f9 e0       	ldi	r31, 0x09	; 9
 9ea:	e4 ef       	ldi	r30, 0xF4	; 244
 9ec:	08 95       	ret

000009ee <setZWriteMessage>:
 9ee:	fa e0       	ldi	r31, 0x0A	; 10
 9f0:	e9 e0       	ldi	r30, 0x09	; 9
 9f2:	08 95       	ret

000009f4 <readMessage>:
 9f4:	56 61       	ori	r21, 0x16	; 22
 9f6:	6c 75       	andi	r22, 0x5C	; 92
 9f8:	65 20       	and	r6, r5
 9fa:	6f 66       	ori	r22, 0x6F	; 111
 9fc:	20 61       	ori	r18, 0x10	; 16
 9fe:	64 64       	ori	r22, 0x44	; 68
 a00:	72 65       	ori	r23, 0x52	; 82
 a02:	73 73       	andi	r23, 0x33	; 51
 a04:	3a 20       	and	r3, r10
 a06:	30 78       	andi	r19, 0x80	; 128
 a08:	Address 0xa08 is out of bounds.


00000a09 <writeMessage>:
 a09:	57 72       	andi	r21, 0x27	; 39
 a0b:	69 74       	andi	r22, 0x49	; 73
 a0d:	74 65       	ori	r23, 0x54	; 84
 a0f:	6e 20       	and	r6, r14
 a11:	76 61       	ori	r23, 0x16	; 22
 a13:	6c 75       	andi	r22, 0x5C	; 92
 a15:	65 20       	and	r6, r5
 a17:	30 78       	andi	r19, 0x80	; 128
 a19:	0a 20       	and	r0, r10
 a1b:	74 6f       	ori	r23, 0xF4	; 244
 a1d:	20 61       	ori	r18, 0x10	; 16
 a1f:	64 64       	ori	r22, 0x44	; 68
 a21:	72 65       	ori	r23, 0x52	; 82
 a23:	73 73       	andi	r23, 0x33	; 51
 a25:	20 30       	cpi	r18, 0x00	; 0
 a27:	78 0d       	add	r23, r8
	...
