.global helpCommand
.global sramHelp

.text


setZHelpMessage:
ldi ZH, hi8(helpMessage)
ldi ZL, lo8(helpMessage)
ret

helpCommand:
rcall setZHelpMessage
loop1:
lpm r25, Z+
cpi r25, 0x00
breq done1
cpi r25, '\r'
breq newLine1
rcall uartSend
rjmp loop1
done1:
ret


newLine1:
rcall terminalNewLine
rjmp loop1


helpMessage: .asciz 	"help - display this list\rinfo - display system info\rregs - display all register values\rclear - clear display\recho - print argument\rmread - read data memory(check INSTRUCTIONS.md)\rmwrite - write to data memory(check INSTRUCTIONS.md)\rijmp - indirect jump to address (check INSTRUCTIONS.md)"



.align 1
