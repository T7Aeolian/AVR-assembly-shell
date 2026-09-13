.global echoCommand

.text


echoCommand:
rcall setYBL
ld r16, Y
cpi r16, 4
brne argumentProvided
rjmp noArg
argumentProvided:
rcall resetXBuffer
adiw X, 5
subi r16, 5
loop1:
tst r16
breq done1
ld r25, X+
rcall uartSend
dec r16
rjmp loop1
done1:
ret


noArg:
ret
