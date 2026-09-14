# AVR-Assembly-Shell
v0.1.0-alpha

!WARNING!:  This project is experimental. Commands such as `mwrite` and `ijmp` intentionally provide low-level access and can put the MCU into an unusable state until reset.

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

Command |     Arguments     | Description
--------------------------------------------------
help    |         -         | Displays command list
info    |         -         | Displays system info
regs    |         -         | Displays value CPU registers, SP & CP
clear   |         -         | Clears terminal
echo    | <text>            | Print text
mread   | <address>         | Read data memory
mwrite  | <address> <value> | Write data memory
ijmp    | <address>         | Indirect jump

### Echo

**Syntax:**     `echo <text>`
**Example:**    echo hello
**Output:**     hello
            
### Mread

**Syntax:**     `mread <address>`

- `<address>` - 4 hexadecimal characters `0000`-`08FF`

Both uppercase and lowercase hexadecimal characters are supported.

**Example:**    mread 0100
**Output:**     Value of address: 0x6D

### Mwrite

!WARNING!: writing an incorrect value to a hardware register can cause the system to stop working.

**Syntax:**     `mwrite <address> <value>`

- `<address>` - 4 hexadecimal characters `0000`-`08FF`
- `<value>` - 2 hexadecimal characters `00`-`FF`

Both uppercase and lowercase hexadecimal characters are supported. 

**Example:**    mwrite 0100 ff
**Output:**     Written value 0xFF to address 0x0100

**Interesting:**    Because `mwrite` can manipulate all of the ATmega328p's data space it can be used to configure peripheral registers. I recommend reading the official ATmega328p manual to see, how else this could be used.

### Ijmp

**Syntax:**     ijmp <address>

- `<address>` - 4 hexadecimal characters(address in byte format. It gets converted to word format automatically) - `0000`-`7FFF`

**Example:**    ijmp 0100
**Output:**     (Outcome depends on address you jump to)

**Interesting:**    `ijmp 0000` essentially works as a command that resets the shell. Check MEMORY_MAP.md or OBJDUMP.md, found in build/version/ for the address of individual functions/instructions.

## ARCHITECTURE

This project is divided into several modules:

- uart/ - UART initialization and communication functions
- terminal/ - Terminal control functions
- buffer/ - Input buffer management and error handling
- parser/ - Command parsing, argument validation and ID assignment
- shell/ - Main shell loop and input handling
- conversions/ - ASCII/Hexadecimal conversion function
- commands/ - Individual shell command implementations

## HARDWARE

This project has currently only been tested on Linux. The serial-device and terminal instructions may require modification on Windows or other operating systems. Windows support is currently untested.

To use this project you need:

- Arduino Uno R3 / ATmega328p
- USB connection to a computer
- `picocom` for serial terminal
- `avrdude` for flashing
- .hex file found in build/version/
- `arduino-cli` for board / port detection

To find the serial device use: 'arduino-cli board list' look for one with the board name: ARDUINO UNO(in my case /dev/ttyACM0).

To flash the file: 'avrdude -v -p atmega328p -c arduino -P `YOUR_SERIAL_DEVICE` -b 115200 -U "flash:w:`FILE`:i"'

To start terminal emulator: 'picocom -b 250000 YOUR_SERIAL_DEVICE' and to exit picocom: Ctrl-A Ctrl-X

`avrdude` uses the bootloader's baudrate(115200), while the shell itself communicates at 250000 baud.


## ROADMAP

- [x] UART DRIVER
- [x] Interactive shell
- [x] Command parser
- [x] read/write data memory
- [ ] EEPROM interface
- [ ] Interrupt support
- [ ] Tiny File system
- [ ] Watchdog support
- [ ] User programs
- [ ] Privileges

## WHY?

I was bored and decided to try to make something challending in assembly. Ive always been curious how computers work on the hardware level, so i decided to make this. I decided to do it bare-metal becase might as well.

The code is far from optimal and the architecture will probably change as the project develops.

