

STACK_SIZE =  4096;

OUTPUT_ARCH(arm)

SECTIONS
{
    . = 0x80100000;

    __text_start = .;
    .text :
    {
        *(.vectors)
        *(.text)
        *(.text.*)

        /* section information for finsh shell */
        . = ALIGN(4);
        __isrtbl_idx_start = .;
        KEEP(*(.isrtbl.idx))
        __isrtbl_start = .;
        KEEP(*(.isrtbl))
        __isrtbl_end = .;
        . = ALIGN(4);
    }
    __text_end = .;

    __rodata_start = .;
    .rodata   : { *(.rodata) *(.rodata.*) }
    __rodata_end = .;

    . = ALIGN(4);
    .ctors :
    {
        PROVIDE(__ctors_start__ = .);
        KEEP(*(SORT(.ctors.*)))
        KEEP(*(.ctors))
        PROVIDE(__ctors_end__ = .);
    }

    .dtors :
    {
        PROVIDE(__dtors_start__ = .);
        KEEP(*(SORT(.dtors.*)))
        KEEP(*(.dtors))
        PROVIDE(__dtors_end__ = .);
    }

    . = ALIGN(16 * 1024);
    .l1_page_table :
    {
        __l1_page_table_start = .;
        . += 16K;
    }

    . = ALIGN(8);
    __data_start = .;
    .data :
    {
        *(.data)
        *(.data.*)
    }
    __data_end = .;

    . = ALIGN(8);
    __bss_start = .;
    .bss :
    {
        *(.bss)
        *(.bss.*)
        *(COMMON)
        . = ALIGN(4);
    }
    . = ALIGN(4);
    __bss_end = .;

    .stacks :
    {
        __stacks_start = .;
        . += STACK_SIZE;
        __stacks_end = .;
        stack_top = .;
    }

    /* Stabs debugging sections.  */
    .stab 0 : { *(.stab) }
    .stabstr 0 : { *(.stabstr) }
    .stab.excl 0 : { *(.stab.excl) }
    .stab.exclstr 0 : { *(.stab.exclstr) }
    .stab.index 0 : { *(.stab.index) }
    .stab.indexstr 0 : { *(.stab.indexstr) }
    .comment 0 : { *(.comment) }

    _end = .;
}
