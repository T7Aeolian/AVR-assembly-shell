.equ UDR0, 0xC6 	; declare uart stuff
.equ UCSR0A, 0xC0
.equ UCSR0B, 0xC1
.equ UCSR0C, 0xC2
.equ UBRR0H, 0xC5
.equ UBRR0L, 0xC4


.global uartInit	; add functions as global symbols
.global uartSend
.global uartRecv
.global uartSendHex
.global uartSendDec


.text
.org 0


; r25 send / receive byte
; r24 temporary UCSR0A/status value
; r23 temporary UCSR0A value
; r22 temporary value for uartSendHex & uartSendHex
; r21 byte to be sent in uartSendHex & byte to be sent in uartSendDec


resetZHex:			; reset Y pointer
ldi ZH, hi8(hex_list)
ldi ZL, lo8(hex_list)
ret


uartInit:		; configure
ldi r16, 24
sts UCSR0B, r16 	; enable TX & RX

ldi r16, 6
sts UCSR0C, r16		; 8N1

ldi r16, 3
sts UBRR0L, r16		; set baudrate low byte (250K)

ldi r16, 0
sts UBRR0H, r16		; set baudrate high byte
ret


uartSend:		; send byte r25
lds r24, UCSR0A
sbrs r24, 5
rjmp uartSend
lds r23, UCSR0A
sbr r23, (1 << 6)
sts UCSR0A, r23
sts UDR0, r25
rcall confirm_send
ret


confirm_send:
lds r24, UCSR0A
sbrs r24, 6
rjmp confirm_send
ret


uartRecv:	; store received byte in r25
lds r24, UCSR0A
sbrs r24, 7
rjmp uartRecv
lds r25, UDR0
ret


uartSendHex:		; send r21 byte as hex string
clr r1
rcall high_hex
rcall resetZHex
rcall low_hex
rcall resetZHex
ret


high_hex:		; send high half 
mov r22, r21
rcall resetZHex
swap r22
andi r22, 0x0F
add r30, r22
adc r31, r1
lpm r25, Z
rcall uartSend
ret


low_hex:		; send low half
mov r22, r21
rcall resetZHex
andi r22, 0x0F
add r30, r22
adc r31, r1
lpm r25, Z
rcall uartSend
ret


uartSendDec:	; send r21 as decimal
rcall if_zero
continue:
rcall send_decimal
ldi r25, ' '
rcall uartSend
ret


hundreds:		; send digit in hundreds
cpi r21, 100
brlo decimal_send
inc r22
subi r21, 100
rjmp hundreds


tens:			; send digit in tens
cpi r21, 10
brlo decimal_send
inc r22
subi r21, 10
rjmp tens


ones:			; send ones
cpi r21, 1
brlo decimal_send
inc r22
subi r21, 1
rjmp ones


if_zero:		; check for empty byte
tst r21
breq is_zero
rjmp continue


is_zero:		; case for empty byte
ldi r25, '0'
rcall uartSend
rjmp continue


decimal_send:		; convert value to ascii and send
subi r22, -'0'
mov r25, r22
rcall uartSend
eor r22, r22
rjmp send_decimal


send_decimal:		; main loop for uartSendDec
cpi r21, 100
brsh hundreds
cpi r21, 10
brsh tens
cpi r21, 1
brsh ones
ret


hex_list: .ascii "0123456789ABCDEF"
