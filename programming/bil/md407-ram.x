/* 
    Default linker script for MD407 (STM32F407)
    All code and data goes to RAM
*/

/* Memory Spaces Definitions */
MEMORY
{
    RAM (xrw) : ORIGIN = 0x20000000, LENGTH = 112K
}

SECTIONS
{
    .text :
    {
        . = ALIGN(4);
        *(.start_section)   /* startup code */
        *(.text)            /* remaining code */
        *(.text.*)
        *(.data)            /* initialized data */
        *(.data.*)
        *(.rodata)          /* read-only data (constants) */
        *(.rodata.*)
        *(.bss)             /* uninitialized data */
        *(COMMON)
        . = ALIGN(4);
    } >RAM
}

