.global terminalInit		; add functions as global symbols
.global terminalBackspace
.global terminalClear
.global terminalPrompt
.global terminalEnter
.global terminalNewLine


.text


terminalInit:			; prepare terminal
rcall terminalColorBG
rcall terminalColorTXT
rcall terminalClear
rcall terminalPrompt
ret


terminalBackspace:		; move left 1, send ' ', move left 1
ldi r25, 0x08
rcall uartSend
ldi r25, ' '
rcall uartSend
ldi r25, 0x08
rcall uartSend
ret


terminalClear:			; clear entire screen
ldi r25, 0x1B
rcall uartSend
ldi r25, 0x5B
rcall uartSend
ldi r25, 0x32
rcall uartSend
ldi r25, 0x4A
rcall uartSend
ret


terminalPrompt:			; display prompt
ldi r25, 'a'
rcall uartSend
ldi r25, 'v'
rcall uartSend
ldi r25, 'r'
rcall uartSend
ldi r25, '>'
rcall uartSend
ret


terminalEnter:			; go to new line + disp prompt
rcall terminalNewLine
rcall terminalPrompt
ret


terminalNewLine:		; go to new line
ldi r25, 0x0A
rcall uartSend
ldi r25, 0x0D
rcall uartSend
ldi r25, 0x1B
rcall uartSend
ldi r25, 0x5B
rcall uartSend
ldi r25, 0x4B
rcall uartSend
ret


terminalColorBG:		; change BG color 
ldi r25, 0x1B
rcall uartSend
ldi r25, 0x5B
rcall uartSend
ldi r25, 0x34
rcall uartSend
ldi r25, 0x34
rcall uartSend
ldi r25, 0x6D
rcall uartSend
ret


terminalColorTXT:		; change TXT color
ldi r25, 0x1B
rcall uartSend
ldi r25, 0x5B
rcall uartSend
ldi r25, 0x39
rcall uartSend
ldi r25, 0x37
rcall uartSend
ldi r25, 0x6D
rcall uartSend
ret
