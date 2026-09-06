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


setZSramHelp:
ldi ZH, hi8(sramHelpMessage)
ldi ZL, lo8(sramHelpMessage)
ret


sramHelp:
rcall setZSramHelp
loop2:
lpm r25, Z+
cpi r25, 0x00
breq done2
cpi r25, '\r'
breq newLine2
rcall uartSend
rjmp loop2
done2:
ret


newLine2:
rcall terminalNewLine
rjmp loop2


helpMessage: .asciz 	"help - display this list\rinfo - display system info\rregs - display all register values\rclear - clear display\recho - print argument\rsram - read / write in sram(try 'help sram')"
sramHelpMessage: .asciz	"sram write 0xAAAA 0xbb\rWrite value bb(0x00-0xFF) to address AAAA(0x0000-0x7FF) in sram\rsram read 0xAAAA\rDisplay the value of address AAAA(0x0000 - 0x07FF) in sram"


.align 1
