.global bufferReset
.global bufferAdd
.global bufferDel
.global resetXBuffer
.global setYBL
.global incBL
.global decBL


; X buffer position
; Y can be used freely
; Z freely / lpm stuff
; r16 - temporary value 
; might be worth saving the value of X in sram eventually?

.text


bufferAdd:			; add value of r25 to X. Inc X & BL & handle overflow
rcall incBL
cpi r16, 33
breq overflow
st X+, r25
ret


bufferDel:			; move back X 1 & dec BL by 1
rcall decBL
sbiw X, 1
ret


incBL:				; inc BL by 1
rcall setYBL
ld r16, Y
inc r16
st Y, r16
ret


decBL:				; dec BL by 1
rcall setYBL
ld r16, Y
dec r16
st Y, r16
ret


bufferReset:			; setting BL to 0 and reseting X
rcall resetXBuffer
rcall setYBL
ldi r16, 0x00
st Y, r16
ret


resetXBuffer:			; set pointer X to start of buffer
ldi XH, hi8(buffer)
ldi XL, lo8(buffer)
ret


setYBL:				; set pointer Y to BL 
ldi YH, hi8(bufferLength)
ldi YL, lo8(bufferLength)
ret


setZErrorOverflow:
ldi ZH, hi8(errorOverflow)
ldi ZL, lo8(errorOverflow)
ret


overflow:
rcall bufferReset
rcall setZErrorOverflow
rcall terminalNewLine
loop1:
lpm r25, Z+
tst r25
breq done1
rcall uartSend
rjmp loop1
done1:
rcall terminalEnter
eor r25, r25
ret


errorOverflow: .asciz "ERROR: OVERFLOW 32 character limit!"


.bss
buffer: .space 32
bufferLength: .space 1
