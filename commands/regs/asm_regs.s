.global regsCommand

; needs a redesign
; this destroys the values of Y & Z
; r16 - counter for ijmpList, r21 - value sent with uartSendHex

.text


regsCommand:
eor r16, r16
rcall setZRegs
movw Y, Z
loop1:
movw Z, Y
lpm r25, Z+
movw Y, Z
tst r25
breq done1
cpi r25, '\r'
breq newLine
cpi r25, '\n'
breq printRegs
rcall uartSend
rjmp loop1
done1:
ret


newLine:
rcall terminalNewLine
rjmp loop1


printRegs:
movw Y, Z
rcall setZIjmpList
add ZL, r16
adc ZH, r1
ijmp



setZIjmpList:
ldi ZH, hi8(pm(ijmpList))
ldi ZL, lo8(pm(ijmpList))
ret


ijmpList:
rjmp r0
rjmp r1
rjmp r2
rjmp r3
rjmp r4
rjmp r5
rjmp r6
rjmp r7
rjmp r8
rjmp r9
rjmp r10
rjmp r11
rjmp r12
rjmp r13
rjmp r14
rjmp r15
rjmp r16
rjmp r17
rjmp r18
rjmp r19
rjmp r20
rjmp r21
rjmp r22
rjmp r23
rjmp r24
rjmp r25
rjmp r26
rjmp r27
rjmp r28
rjmp r29
rjmp r30
rjmp r31
rjmp SP


shortcut:
rcall uartSendHex
inc r16
rjmp loop1


r0:
mov r21, r0
rjmp shortcut
r1:
mov r21, r1
rjmp shortcut
r2:
mov r21, r2
rjmp shortcut
r3:
mov r21, r3
rjmp shortcut
r4:
mov r21, r4
rjmp shortcut
r5:
mov r21, r5
rjmp shortcut
r6:
mov r21, r6
rjmp shortcut
r7:
mov r21, r7
rjmp shortcut
r8:
mov r21, r8
rjmp shortcut
r9:
mov r21, r9
rjmp shortcut
r10:
mov r21, r10
rjmp shortcut
r11:
mov r21, r11
rjmp shortcut
r12:
mov r21, r12
rjmp shortcut
r13:
mov r21, r13
rjmp shortcut
r14:
mov r21, r14
rjmp shortcut
r15:
mov r21, r15
rjmp shortcut
r16:
mov r21, r16
rjmp shortcut
r17:
mov r21, r17
rjmp shortcut
r18:
mov r21, r18
rjmp shortcut
r19:
mov r21, r19
rjmp shortcut
r20:
mov r21, r20
rjmp shortcut
r21:
rjmp shortcut
r22:
mov r21, r22
rjmp shortcut
r23:
mov r21, r23
rjmp shortcut
r24:
mov r21, r24
rjmp shortcut
r25:
mov r21, r25
rjmp shortcut
r26:
mov r21, r26
rjmp shortcut
r27:
mov r21, r27
rjmp shortcut
r28:
mov r21, r28
rjmp shortcut
r29:
mov r21, r29
rjmp shortcut
r30:
mov r21, r30
rjmp shortcut
r31:
mov r21, r31
rjmp shortcut
SP:
lds r21, 0x5E
rcall uartSendHex
lds r21, 0x5D
rcall uartSendHex
rjmp done1


setZRegs:
ldi ZH, hi8(regsMessage)
ldi ZL, lo8(regsMessage)
ret


regsMessage: .asciz "r0:0x\n r1:0x\n r2:0x\n r3:0x\n r4:0x\n r5:0x\n\rr6:0x\n r7:0x\n r8:0x\n r9:0x\n r10:0x\n r11:0x\n\rr12:0x\n r13:0x\n r14:0x\n r15:0x\n r16:0x\n r17:0x\n\rr18:0x\n r19:0x\n r20:0x\n r21:0x\n r22:0x\n r23:0x\n\rr24:0x\n r25:0x\n r26:0x\n r27:0x\n r28:0x\n r29:0x\n\rr30:0x\n r31:0x\n SP:0x\n"

.align 1
