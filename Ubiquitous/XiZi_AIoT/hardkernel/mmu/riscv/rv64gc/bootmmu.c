/*
 * Copyright (c) 2020 AIIT XUOS Lab
 * XiUOS is licensed under Mulan PSL v2.
 * You can use this software according to the terms and conditions of the Mulan PSL v2.
 * You may obtain a copy of Mulan PSL v2 at:
 *        http://license.coscl.org.cn/MulanPSL2
 * THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
 * EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */
/**
 * @file bootmmu.c
 * @brief build pagetable and enable mmu in boot time
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2024.04.26
 */

/*************************************************
File name: bootmmu.c
Description: build pagetable and enable mmu in boot time
Others:
History:
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include "core.h"
#include "memlayout.h"
#include "mmio_access.h"
#include "mmu.h"
#include "pagetable.h"
#include "registers.h"
#include "ns16550.h"
#include "printf.h"
#include <asm/csr.h>
#include <asm/pgtable-bits.h>

#include <stdint.h>
#include <string.h>

//
#if 0
static int test_access_map_address(void)
{
    unsigned long address = KERN_MEM_BASE + (PHY_USER_FREEMEM_BASE - PHY_MEM_BASE) - 4096;
    printf_early("to access 0x%lx\n", address);
    *(unsigned long *)address = 0x55;
    if(*(unsigned long *)address == 0x55) {
        printf_early("access 0x%lx done\n", address);
    }
    return 0;
}

static int test_access_unmap_address(void)
{
    unsigned long address = KERN_MEM_BASE + (PHY_USER_FREEMEM_BASE - PHY_MEM_BASE) + 4096;
    *(unsigned long *)address = 0x55;
    printf_early("access 0x%lx done\n", address);
    return 0;
}

static void test_mmu(void)
{
    test_access_map_address();
    test_access_unmap_address();
}
#endif

//
extern void main(void);

void bootmain(void)
{
    _debug_uart_printascii("bootmain start\n");
#if 0
    test_mmu();
#endif

    main();

    _debug_uart_printascii("bootmain end\n");
    while(1);
}

