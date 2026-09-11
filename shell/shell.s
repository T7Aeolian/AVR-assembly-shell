.text
.org 0


rcall uartInit
rcall terminalInit


shellInit:
rcall bufferReset

shellRun:
rcall uartRecv
cpi r25, 0x0D
breq shellHandleEnter
cpi r25, 0x7F
breq shellHandleBackspace
rcall bufferAdd
rcall uartSend
rjmp shellRun


getBL:
rcall setYBL
ld r16, Y
ret


shellHandleBackspace:
rcall getBL
cpi r16, 0
breq shellRun
rcall bufferDel
rcall terminalBackspace
rjmp shellRun


shellHandleEnter:
rcall getBL
cpi r16, 0
breq emptyLine
rcall terminalNewLine
rcall parseCommand
rcall shellExecute
rcall bufferReset
rcall terminalEnter
rjmp shellRun


emptyLine:
rcall terminalEnter
rjmp shellRun


shellExecute:
ldi r17, 32
cp r0, r17
breq callHelpCommand
ldi r17, 33
cp r0, r17
breq callInfoCommand
ldi r17, 34
cp r0, r17
breq callRegsCommand
ldi r17, 48
cp r0, r17
breq callClearCommand
ldi r17, 112
cp r0, r17
breq callSramHelp
ldi r17, 240
cp r0, r17
breq callEchoCommand
ldi r17, 128
cp r0, r17
breq callMread
ldi r17, 254
cp r0, r17
breq returnCase
rjmp invalidCommand


returnCase:
ret
callHelpCommand:
rcall helpCommand
ret
callInfoCommand:
rcall infoCommand
ret
callRegsCommand:
rcall regsCommand
ret
callClearCommand:
rcall clearCommand
ret
callEchoCommand:
rcall echoCommand
ret
callSramHelp:
rcall sramHelp
ret
callMread:
rcall mread
ret


setZCommandNotFound:
ldi ZH, hi8(commandNotFound)
ldi ZL, lo8(commandNotFound)
ret


invalidCommand:
rcall setZCommandNotFound
loop2:
lpm r25, Z+
cpi r25, 0x00
breq done2
rcall uartSend
rjmp loop2
done2:
rcall printBuffer
rcall bufferReset
ret


printBuffer:
rcall resetXBuffer
rcall getBL
loop1:
cpi r16, 0
breq done1
ld r25, X+
rcall uartSend
dec r16
rjmp loop1
done1:
ret


commandNotFound: .asciz "ERROR: Command not found: "


.align 1
