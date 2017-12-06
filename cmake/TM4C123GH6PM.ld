/*
 * TM4C123GH6PM.ld
 * Linker script for TM4C123GH6PM microcontroller
 * Author: akowalew
*/

MEMORY
{
    FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 0x00040000 /* 256KB */
    SRAM (rwx) : ORIGIN = 0x20000000, LENGTH = 0x00008000 /* 32KB */
}

SECTIONS
{
    /* code */
    .text :
    {
        _text = .;
        KEEP(*(.stackBegin))
        KEEP(*(.isrVector))
        *(.text*)
        *(.rodata*)
        _etext = .;
    } > FLASH

    /* static data */
    .data : AT(ADDR(.text) + SIZEOF(.text))
    {
        _data = .;
        *(vtable)
        *(.data*)
        _edata = .;
    } > SRAM

    /* static uninitialized data */
    .bss :
    {
        _bss = .;
        *(.bss*)
        *(COMMON)
        _ebss = .;
    } > SRAM
}
