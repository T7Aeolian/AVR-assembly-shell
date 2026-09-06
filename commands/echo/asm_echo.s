.global echoCommand
.global echoNoARG

.text


echoCommand:
rcall setYBL
ld r16, Y
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


echoNoARG:
rcall setZNoARG
loop2:
lpm r25, Z+
cpi r25, 0
breq done2
rcall uartSend
rjmp loop2
done2:
ret


setZNoARG:
ldi ZH, hi8(noARG)
ldi ZL, lo8(noARG)
ret


noARG: .asciz "ERROR: No argument provided"
