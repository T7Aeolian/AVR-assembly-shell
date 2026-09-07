.global sramRead

; sramRead - display value of address Y in sram

.text


sramRead:
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


readMessage: .ascii "Value of address: 0x\n"
