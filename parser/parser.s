.global parseCommand

; this code is a mess. Needs major redesign
; this code parses commands and assigns command id
; r0 - command id, check index

; load BL in r16, set X to buffer and flash string in Z
; r19 result (1 / 0), r20 counter, if match is ID


.text


parseCommand:		; select case based on command length
rcall restoreBL
cpi r16, 4
brne NotChar4
rjmp char4
NotChar4:
cpi r16, 5
brne NotChar5
rjmp char5
NotChar5:
cpi r16, 9
brne NotChar9
rjmp char9
NotChar9:
cpi r16, 10
brne NotChar10
rjmp char10
NotChar10:
rjmp variableLength


variableLength:		; variable length commands
ldi r20, 240
rcall setZEcho0
ldi r16, 5
rcall noRestoreBL
cpi r19, 1
brne notEcho
rjmp done
notEcho:
rjmp invalidCommand


mreadADDR:
ldi r17, 2
rcall ahtoi
cpi r19, 0
brne invalidArgument
rjmp done


invalidArgument:
ldi r20, 253
mov r0, r20
ret 


char10:
ldi r20, 128
rcall setZMread
ldi r16, 6
rcall noRestoreBL
cpi r19, 1
breq mreadADDR
rjmp invalidCommand

char9:
ldi r20, 112
rcall setZHelpSram
rcall compareString
cpi r19, 1
breq done
rjmp invalidCommand


char5:			; 5 character commands
ldi r20, 48
rcall setZClear
rcall compareString
cpi r19, 1
breq done
rcall setZEcho0
rcall compareString
cpi r19, 1
breq handleEchoNoARG
rjmp invalidCommand


char4:			; 4 character commands
ldi r20, 32
rcall setZHelp
rcall compareString
cpi r19, 1
breq done
rcall setZInfo
rcall compareString
cpi r19, 1
breq done
rcall setZRegs
rcall compareString
cpi r19, 1
breq done
rcall setZEcho
rcall compareString
cpi r19, 1
breq handleEchoNoARG
rjmp invalidCommand


handleEchoNoARG:
ldi r20, 254
mov r0, r20
rcall echoNoARG
ret


done:			; match. set cmd id
mov r0, r20
ret


compareString:		; compare string loop
rcall restoreBL
noRestoreBL:
rcall resetXBuffer
check:
ld r17, X+
lpm r18, Z+
cp r17, r18
brne notMatch
dec r16
tst r16
brne check
match:			; strings match. set r19 1
ldi r19, 1
ret
notMatch:		; strings dont match. set r19 0
ldi r19, 0
inc r20
ret


invalidCommand:		; invalid command case
rcall resetXBuffer
ldi r17, 255
mov r0, r17
ret


setZHelp:		; set pointers
ldi ZH, hi8(help)
ldi ZL, lo8(help)
ret


setZInfo:
ldi ZH, hi8(info)
ldi ZL, lo8(info)
ret


setZRegs:
ldi ZH, hi8(regs)
ldi ZL, lo8(regs)
ret


setZClear:
ldi ZH, hi8(clear)
ldi ZL, lo8(clear)
ret


setZEcho0:
ldi ZH, hi8(echo0)
ldi ZL, lo8(echo0)
ret


setZEcho:
ldi ZH, hi8(echo)
ldi ZL, lo8(echo)
ret


setZHelpSram:
ldi ZH, hi8(helpSram)
ldi ZL, lo8(helpSram)
ret


setZMwrite:
ldi ZH, hi8(mwrite)
ldi ZL, lo8(mwrite)
ret


setZMread:
ldi ZH, hi8(mread)
ldi ZL, lo8(mread)
ret


setZEmptyByte:
ldi ZH, hi8(emptyByte)
ldi ZL, lo8(emptyByte)
ret


restoreBL:		; restore string lenght in r16
rcall setYBL
ld r16, Y
ret


help: .ascii "help"
helpSram: .ascii "help sram"
info: .ascii "info"
regs: .ascii "regs"
clear: .ascii "clear"
echo0: .ascii "echo "
echo: .ascii "echo"
mread: .ascii "mread " 
mwrite: .ascii "mwrite"
emptyByte: .byte 0
