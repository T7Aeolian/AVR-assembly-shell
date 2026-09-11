;ahtoi - ascii hex to int
;set r17 to 1(byte hex) or 2(word hex)
;load first ascii to r18(comes from X)
;result stored in Y(for word) or r2(for byte)
;r19 if 1 = error -> abort


.global ahtoi

.text

ahtoi:
eor r19, r19
eor r28, r28
eor r29, r29
eor r30, r30
eor r31, r31
cpi r17, 2
breq ahtoiword
rjmp ahtoibyte


ahtoiword:
char1:
ld r18, X+
rcall isValidChar
cpi r19, 1
breq abort
mov r28, r18
rcall Yx16
rcall Yx16
rcall Yx16
char2:
ld r18, X+
rcall isValidChar
cpi r19, 1
breq abort
mov r30, r18
rcall Zx16
rcall Zx16
add YL, ZL
adc YH, ZH
char3:
ld r18, X+
rcall isValidChar
cpi r19, 1
breq abort
eor r30, r30
eor r31, r31
mov r30, r18
rcall Zx16
add YL, ZL
adc YH, ZH
char4:
ld r18, X+
rcall isValidChar
cpi r19, 1
breq abort
add YL, r18
adc YH, r1
ret


abort:
ldi r18, 253
mov r0, r18
ret


ahtoibyte:
char1b:
ld r18, X+
rcall isValidChar
cpi r19, 1
breq abort
rcall bytex16
mov r2, r18
char2b:
ld r18, X+
rcall isValidChar
cpi r19, 1
breq abort
add r2, r18
ret


isValidChar:
cpi r18, 0x61
brsh lowerLetterRangeLowercase
cpi r18, 0x30
brsh lowerDigitRange
cpi r18, 0x41
brsh lowerLetterRangeUppercase
rjmp invalidChar
lowerDigitRange:
cpi r18, 0x3A
brlo validDigit
rjmp invalidChar
lowerLetterRangeLowercase:
cpi r18, 0x67
brlo validLetterLowercase
rjmp invalidChar
lowerLetterRangeUppercase:
cpi r18, 0x47
brlo validLetterUppercase
rjmp invalidChar


validDigit:
subi r18, 0x30
ret

validLetterUppercase:
subi r18, 0x37
ret


validLetterLowercase:
subi r18, 0x57
ret


invalidChar:			; set command id for wrong argument
ldi r19, 1
ret


bytex16:			; r18 x 16 only when hex is 1 byte
lsl r18
lsl r18
lsl r18
lsl r18
ret

Yx16:			; Y x 16
lsl YL
rol YH
lsl YL
rol YH
lsl YL
rol YH
lsl YL
rol YH
ret


Zx16:			; Z x 16
lsl ZL
rol ZH
lsl ZL
rol ZH
lsl ZL
rol ZH
lsl ZL
rol ZH
ret
