.global infoCommand

.text


setZInfoMessage:
ldi ZH, hi8(infoMessage)
ldi ZL, lo8(infoMessage)
ret


infoCommand:
rcall setZInfoMessage
loop1:
lpm r25, Z+
cpi r25, 0x00
breq done1
cpi r25, '\r'
breq newLine
rcall uartSend
rjmp loop1
done1:
ret


newLine:
rcall terminalNewLine
rjmp loop1


infoMessage: .asciz "      _	        _______.	CPU: ATmega328p\r     /@.       /@@@@@@@@.	SRAM: 2KB\r    /@^@.     /@/``````@@.	FLASH: 32KB\r   /@/_`@.   /@@@@@@@@@@/	EEPROM: 1KB\r  /@@@@@@@. /@@@@.``````	AVR: 100%\r /@/`````@@V@/`@@@@.		VERSION: 0.1.0-alpha\r/@/      `@@/    `@@@@."


.align 1
