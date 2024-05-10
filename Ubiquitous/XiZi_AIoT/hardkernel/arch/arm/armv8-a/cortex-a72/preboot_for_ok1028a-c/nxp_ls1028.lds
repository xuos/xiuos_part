/*
 * Copyright (c) 2010-2012, Freescale Semiconductor, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * o Redistributions of source code must retain the above copyright notice, this list
 *   of conditions and the following disclaimer.
 *
 * o Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 *
 * o Neither the name of Freescale Semiconductor, Inc. nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY  OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/**
 * @file nxp_ls1028.lds
 * @brief nxp ls1028 lds function
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2024.04.10
 */ 
BOOT_STACK_SIZE = 0x4000;

OUTPUT_FORMAT("elf64-littleaarch64")
OUTPUT_ARCH( "aarch64" )
ENTRY( _entry )

SECTIONS
{
  /*
   * ensure that entry.S / _entry is at 0x40000000(physical address),
   * where qemu's -kernel jumps.
   * 0x40000000(PA) is 0xffffff8040000000(VA);
   */
/*
  . = 0x40000000;
  */
  . = 0xffffff0000000000;

.start_sec : {
		. = ALIGN(0x1000);
		/* initialization start checkpoint. */

  boot.o(.text)
  boot.o(.rodata .rodata.*)
  boot.o(.data .data.*)
    
	PROVIDE(boot_start_addr = .);

  boot.o(.bss .bss.* COMMON)

		/* stack for booting code. */
		. = ALIGN(0x1000);
		PROVIDE(stacks_start = .);
		. += BOOT_STACK_SIZE;
		PROVIDE(stacks_end = .);
		PROVIDE(stacks_top = .);

		/* initialization end checkpoint. */
		PROVIDE(boot_end_addr = .);
	}

  .text : AT(0x0000000) {
    *(.text .text.*)
    . = ALIGN(0x1000);
    PROVIDE(etext = .);
  }

  .rodata : {
    . = ALIGN(16);
    *(.srodata .srodata.*) /* do not need to distinguish this from .rodata */
    . = ALIGN(16);
    *(.rodata .rodata.*)
  }

  .data : {
    . = ALIGN(16);
    *(.sdata .sdata.*) /* do not need to distinguish this from .data */
    . = ALIGN(16);
    *(.data .data.*)
  }

  .bss : {
    . = ALIGN(16);
    PROVIDE(bss_start = .);
    *(.sbss .sbss.*) /* do not need to distinguish this from .bss */
    . = ALIGN(16);
    *(.bss .bss.*)
    . = ALIGN(16);
    PROVIDE(bss_end = .);
  }

  PROVIDE(end = .);
}

bss_size = (bss_end - bss_start) >> 3;
