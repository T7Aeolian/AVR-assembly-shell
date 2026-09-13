# AVR-Assembly-Shell

A simple interactive shell made in bare-metal AVR assembly for the ATmega328p

## OVERVIEW

The project is written entirely in AVR assembly and comunicates with a computer via UART.

Rather than having any safety this project gives the user direct register manipulation and control over the execution flow of the program.

The goal of the project is to learn how processors work on the low-level and to understand and control what the hardware is doing.

## FEATURES

-Interactive UART terminal
-Command parser with argument validation
-Data memory manipulation(read/write)
-Control over the execution flow
-GPIO configuration
-Hexadecimal input/output
-32 character input buffer
-Written entirely in assembly

## COMMANDS

No arguments:

help    |   displays list of all comands
info    |   displays general system info
regs    |   displays value of all registers + SP & CP
clear   |   clears display

Support arguments:

echo    |   prints back text to the terminal
mread   |   read value of an address in data memory
mwrite  |   write value to an address in data memory
ijmp    |   indirect jump to instruction address and flash(control PC)

### Echo

Syntax:     echo <arg1>
Example:    echo hello
Output:     hello
            
### Mread

Syntax:     mread <arg1>,where arg1 is the address you wish to read is written in hexadecimal(0000 - 08ff. must be 4 chracters). Supports both lower and uppercase characters.

Example:    mread 0100
Output:     Value of address: 0x6D

### Mwrite

Syntax:     mwrite <arg1> <arg2>, whre arg1 is the address you wish to write to in hexadecimal(0000 - 08ff. must be 4 characters) and arg2 is the value you wish to write(00-ff. must be 2 characters). Supports both lower and uppercase characters.

Example:    mwrite 0100 ff
Output:     Written value 0xFF to address 0x0100

Interesting:    Can be used to control GPIO registers so for example if you do "mwrite 0024 20"(set bit 5 in DDRB | make pin 13 output) and "mwrite 0025 20"(set bit 5 in PORTB | set pin 13 HIGH). I reccomend checking out the official ATmega328p manual to see how else this can be used. Writing to the wrong address can cause the shell to stop working.

### Ijmp

Syntax:     ijmp <arg1>, where arg1 is the address you wish to jump to in hexadecimal byte format(gets converted to word format). Supports both lower and uppercase characters.

Example:    ijmp 0100
Output:     (Very dependant on address you jump to)

Interesting:    "ijmp 0000" essentially works as a command that resets the shell. Check MEMORY_MAP.md or OBJDUMP.md for the address of individual functions/instructions. I recommend checking out the official ATmega328p manual. Jumping to some addresses can cause the shell to stop working.

## ARCHITECTURE

This project is divided into several modules:

- uart/ - contains setup for uart conf and essential functions
- terminal/ - contains functions that coontrol the terminal
- buffer/ - contains logic behind the input buffer + error handling
- parser/ - contains logic behind command parsing, argument validation, error handling and id assigning
- shell/ - contains main shell logic, backspace + enter handling
- conversions/ - contains function ahtoi(ascii hexadecimal to intiger)
- commands/ - contains the functions for individual commands

## HARDWARE

To use this project you need:

- Arduino Uno R3/ATmega328p
- USB connection to computer
- Terminal emulator - picocom
- Program to flash code - avrdude
- .hex file found in build/
- Serial device for the Arduino Uno R3 - arduino-cli

To find the serial device: 'arduino-cli board list' look for one with the board name: ARDUINO UNO(in my case /dev/ttyACM0).

To flash the file: 'avr-dude -v -p atmega328p -c arduino -P YOUR_SERIAL_DEVICE -b 115200 -U "flash:w:FILE:i"', where FILE is the name of the .hex file.

To start terminal emulator: 'picocom -b 250000 YOUR_SERIAL_DEVICE'

## ROADMAP

- [x] UART DRIVER
- [x] Interactive shell
- [x] Command parser
- [x] read/write data memory
- [ ] username + password validation with EEPROM
- [ ] Interrupt support
- [ ] Tiny File system

## WHY?

I was bored and decided to try to make something challending in assembly plus ive always been curious how computers work on the hardware level so i decided to make this. Im sure the code is far from optimal but this is the first ever version and i plan on redesigning a lot. I decided to do it bare-metal becase might as well.

