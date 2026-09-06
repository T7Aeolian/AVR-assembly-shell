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


infoMessage: .asciz "      _	        _______.	CPU: ATmega328p\r     /@.       /@@@@@@@@.	SRAM: 2Kb\r    /@^@.     /@/``````@@.	FLASH: 32Kb\r   /@/_`@.   /@@@@@@@@@@/	EEPROM: 1Kb\r  /@@@@@@@. /@@@@.``````	AVR: 100%\r /@/`````@@V@/`@@@@.		VERSION: 1.0.0v\r/@/      `@@/    `@@@@."


.align 1
