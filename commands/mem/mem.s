.global mread
.global mwrite

; mread - display value of address Y in memory
; mwrite - write value of r2 to address Y in memory

.text


mwrite:
st Y, r2
rcall setZWriteMessage
loop2:
lpm r25, Z+
cpi r25, '\n'
breq valuer2
cpi r25, '\r'
breq addressY
rcall uartSend
rjmp loop2


valuer2:
mov r21, r2
rcall uartSendHex
rcall setZWriteMessage
adiw Z, 17
rjmp loop2


addressY:
mov r21, r29
rcall uartSendHex
mov r21, r28
rcall uartSendHex
ret


mread:
rcall setZReadMessage
loop1:
lpm r25, Z+
cpi r25, '\n'
breq printValue
rcall uartSend
rjmp loop1


printValue:
ld r21, Y
rcall uartSendHex
ret


setZReadMessage:
ldi ZH, hi8(readMessage)
ldi ZL, lo8(readMessage)
ret


setZWriteMessage:
ldi ZH, hi8(writeMessage)
ldi ZL, lo8(writeMessage)
ret


readMessage: .ascii "Value of address: 0x\n"
writeMessage: .ascii "Written value 0x\n to address 0x\r"
