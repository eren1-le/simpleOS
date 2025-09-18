ENTRY(loader)
OUTPUT_FORMAT(elf32-i386)
OUTPUT_ARCH(i386:i386)

SECTIONS
{
    . = 0x0100000;
    .text (READONLY):       
    {
        *(.multiboot)
        *(.text*)
        *(.rodata)
    }

    .data (READONLY):
    {
        _start_ctors = .;
        KEEP(*( .init_array));
        KEEP(*(SORT_BY_INIT_PRIORITY( .init_array.* )));
        _end_ctors = .;

        *(.data)
    }
    .bss (READONLY):
    {
        *(.bss)
    }
    /DISCARD/ (READONLY):
    {
        *(.fini_array*)
        *(.comment)
    }
}



