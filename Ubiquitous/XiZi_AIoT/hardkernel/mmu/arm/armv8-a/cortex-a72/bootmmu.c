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
#include "mmu.h"

#include "mmio_access.h"

#include <stdint.h>
#include <string.h>

extern uint64_t kernel_data_end[];
extern uint64_t kernel_data_begin[];

#define NR_PDE_ENTRIES 512
#define L1_TYPE_SEC (2 << 0)
#define L1_SECT_DEV ((0B00)<<2)            //Device memory
#define L1_SECT_AP0 (1 << 6)                   //Data Access Permissions
uint64_t boot_ptable[NR_PTE_ENTRIES] __attribute__((aligned(0x4000))) = { 0 };

static void build_boot_pgdir()
{
    // dev mem
    uint64_t dev_mem_end_idx = (DEV_PHYMEM_BASE + DEV_MEM_SZ) >> LEVEL3_PDE_SHIFT;
    for (uint64_t i = DEV_PHYMEM_BASE >> LEVEL3_PDE_SHIFT; i < dev_mem_end_idx; i++) {
        boot_pgdir[i] = (i << LEVEL3_PDE_SHIFT) | L1_TYPE_SEC | L1_SECT_DEV | L1_SECT_AP0;
        boot_pgdir[MMIO_P2V_WO(i << LEVEL3_PDE_SHIFT) >> LEVEL3_PDE_SHIFT] = (i << LEVEL3_PDE_SHIFT) | L1_TYPE_SEC | L1_SECT_DEV | L1_SECT_AP0;
    }

    // identical mem
    uint64_t idn_mem_start_idx = PHY_MEM_BASE >> LEVEL3_PDE_SHIFT;
    uint64_t idn_mem_end_idx = PHY_MEM_STOP >> LEVEL3_PDE_SHIFT;
    for (uint64_t i = idn_mem_start_idx; i < idn_mem_end_idx; i++) {
        boot_pgdir[i] = i << LEVEL3_PDE_SHIFT | L1_TYPE_SEC | L1_SECT_AP0;
    }

    // kern mem
    uint64_t kern_mem_start_idx = KERN_MEM_BASE >> LEVEL3_PDE_SHIFT;
    uint64_t kern_mem_end_idx = (KERN_MEM_BASE + (PHY_MEM_STOP - PHY_MEM_BASE)) >> LEVEL3_PDE_SHIFT;
    for (uint64_t i = kern_mem_start_idx; i < kern_mem_end_idx; i++) {
        boot_pgdir[i] = V2P(i << LEVEL3_PDE_SHIFT) | L1_TYPE_SEC | L1_SECT_AP0;
    }
}



static void load_boot_pgdir()
{
    uint64_t val;

   // DACR_W(0x55555555); // set domain access control as client
    TTBCR_W(0x0);
    TTBR0_W((uint64_t)boot_pgdir);

    // Enable paging using read/modify/write
    SCTLR_R(val);
    val |= (1 << 0);     //EL1 and EL0 stage 1 address translation enabled.
    val |= (1 << 1);    //Alignment check enable
    val |= (1 << 2);     // Cacheability control, for data caching.
    val |= (1 << 12);    // Instruction access Cacheability control
    val |= (1 << 19);   //forced to XN for the EL1&0 translation regime.
 
    SCTLR_W(val);

    // flush all TLB
    DSB();
    CLEARTLB(0);
    ISB();
}

extern void main(void);
static bool _bss_inited = false;
void bootmain()
{
    build_boot_pgdir();
    load_boot_pgdir();
    __asm__ __volatile__("add sp, sp, %0" ::"r"(KERN_MEM_BASE - PHY_MEM_BASE));
    if (!_bss_inited) {
        memset(&kernel_data_begin, 0x00, (uint64_t)kernel_data_end - (uint64_t)kernel_data_begin);
        _bss_inited = true;
    }

    main();
}