/****************************************************************************
 * boards/risc-v/gap8/gapuino/scripts/ld.script
 *
 *   Copyright (C) 2018 Gregory Nutt. All rights reserved.
 *   Author: hhuysqt <1020988872@qq.com>
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 * 3. Neither the name NuttX nor the names of its contributors may be
 *    used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 ****************************************************************************/

/* Not needed, but we need separate linker scripts anyway */

OUTPUT_ARCH( riscv )
SEARCH_DIR(.)
__DYNAMIC  =  0;

MEMORY
{
  L2 (wxa!ri)       : ORIGIN = 0x1C000000, LENGTH = 0x80000
  FC_tcdm           : ORIGIN = 0x1B000004, LENGTH = 0x3ffc
  FC_tcdm_aliased   : ORIGIN = 0x00000004, LENGTH = 0x3ffc
}

__L1_STACK_SIZE      = 0x400;
__FC_STACK_SIZE      = 4096;

/* We have to align each sector to word boundaries as our current s19->slm
 * conversion scripts are not able to handle non-word aligned sections.
 */
ENTRY( reset_handler )
SECTIONS
{
    .vectors_M :
    {
        . = ALIGN(4);
        IRQ_U_Vector_Base = .;
        KEEP(*(.vectors_M))
    } > L2

    .dbg_struct :
    {
        . = ALIGN(4);
        IRQ_M_Vector_Base = .;
        KEEP(*(.dbg_struct))
    } > L2

    . = ALIGN(4);

    .text : {
        PROVIDE( _text = ABSOLUTE(.) );
        /* _stext = .; */
        *(.text .text.*)
        /* *(.rodata .rodata*) */
        /* _etext  =  .;  */

        /* section information for  shell */
        . = ALIGN(4);
        _shell_command_start = .;
        KEEP (*(shellCommand))
        _shell_command_end = .;
        . = ALIGN(4);

        PROVIDE(__ctors_start__ = .);
        KEEP (*(SORT(.init_array.*)))
        KEEP (*(.init_array))
        PROVIDE(__ctors_end__ = .);

        . = ALIGN(4);
        __isrtbl_idx_start = .;
        KEEP(*(.isrtbl.idx))
        __isrtbl_start = .;
        KEEP(*(.isrtbl))
        __isrtbl_end = .;
        . = ALIGN(4);

        PROVIDE(g_service_table_start = ABSOLUTE(.));
        KEEP(*(.g_service_table))
        PROVIDE(g_service_table_end = ABSOLUTE(.));
        
        /* _endtext = .; */
        PROVIDE( _etext = ABSOLUTE(.) );
    }  > L2

    .rodata : {
        /* Due to limitations on FPGA loader, loadable sections must have
         * base and size aligned on 4 bytes
         */

        . = ALIGN(4);
        *(.rodata);
        *(.rodata.*)
        . = ALIGN(4);
    } > L2
    . = ALIGN(4);
    .data : {

        __data_start__ = .;      /* create a global symbol at data start */
        *(.data .data.*)
        
        . = ALIGN(4);
        PROVIDE( __global_pointer$ = ABSOLUTE(.) + 0x800 );
        *(.sdata .sdata.*)

        __data_end__ = .;        /* define a global symbol at data end */
    } > L2

    . = ALIGN(4);

    .bss :
    {
        /* . = ALIGN(4);
        _sbss = .;
        __bss_start__ = .;
        _fbss = .;
        *(.bss)
        *(.bss.*)
        *(.sbss)
        *(.sbss.*)
        *(COMMON)
        . = ALIGN(4);
        __bss_end__ = .;
        _ebss = .; */
        __bss_start = ABSOLUTE(.);
        _fbss = .;

        /* Writable uninitialized small data segment (.sbss segment)*/
        *(.sbss .sbss.*)
        *(.scommon)

        /* Uninitialized writeable data section (.bss segment)*/
        *(.bss .bss.*)
        *(COMMON)

        . = ALIGN(4);
        __bss_end = ABSOLUTE(.);
	
    } > L2

     .stack :
    {
        . = ALIGN(4);
        PROVIDE(_idle_stack_start = ABSOLUTE(.));

        . = . + __FC_STACK_SIZE;

        PROVIDE( _idle_stack_end = ABSOLUTE(.) );
    } > L2
    _end = ABSOLUTE(.);
 
}
