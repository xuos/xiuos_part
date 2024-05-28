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

#include <stdint.h>
#include <string.h>

extern uint64_t kernel_data_end[];
extern uint64_t kernel_data_begin[];

// clang-format off
#define L2_TYPE_TAB         2
#define L2_PTE_VALID        1

#define L3_TYPE_TAB         2
#define L3_PTE_VALID        1

#define L4_TYPE_PAGE        (3 << 0)
#define L4_PTE_DEV          ((0b00) << 2) // Device memory
#define L4_PTE_AF           (1 << 10) // Data Access Permissions

#define IDX_MASK            (0b111111111)
#define L3_PDE_INDEX(idx)   ((idx << LEVEL3_PDE_SHIFT) & L3_IDX_MASK)
// clang-format on

uint64_t boot_l2pgdir[NUM_LEVEL2_PDE] __attribute__((aligned(0x1000))) = { 0 };

uint64_t boot_dev_l3pgdir[NUM_LEVEL3_PDE] __attribute__((aligned(0x1000))) = { 0 };
uint64_t boot_virt_dev_l3pgdir[NUM_LEVEL3_PDE] __attribute__((aligned(0x1000))) = { 0 };
uint64_t boot_kern_l3pgdir[NUM_LEVEL3_PDE] __attribute__((aligned(0x1000))) = { 0 };
uint64_t boot_virt_kern_l3pgdir[NUM_LEVEL3_PDE] __attribute__((aligned(0x1000))) = { 0 };

uint64_t boot_dev_l4pgdirs[NUM_LEVEL3_PDE][NUM_LEVEL4_PTE] __attribute__((aligned(0x1000))) = { 0 };
uint64_t boot_kern_l4pgdirs[NUM_LEVEL3_PDE][NUM_LEVEL4_PTE] __attribute__((aligned(0x1000))) = { 0 };

static void build_boot_pgdir()
{
    uint64_t dev_phy_mem_base = DEV_PHYMEM_BASE;
    // dev mem
    boot_l2pgdir[(dev_phy_mem_base >> LEVEL2_PDE_SHIFT) & IDX_MASK] = (uint64_t)boot_dev_l3pgdir | L2_TYPE_TAB | L2_PTE_VALID;
    boot_l2pgdir[(MMIO_P2V_WO(dev_phy_mem_base) >> LEVEL2_PDE_SHIFT) & IDX_MASK] = (uint64_t)boot_dev_l3pgdir | L2_TYPE_TAB | L2_PTE_VALID;

    uint64_t cur_mem_paddr = ALIGNDOWN((uint64_t)DEV_PHYMEM_BASE, PAGE_SIZE);
    for (size_t i = 0; i < NUM_LEVEL3_PDE; i++) {
        boot_dev_l3pgdir[i] = (uint64_t)boot_dev_l4pgdirs[i] | L3_TYPE_TAB | L3_PTE_VALID;

        for (size_t j = 0; j < NUM_LEVEL4_PTE; j++) {
            boot_dev_l4pgdirs[i][j] = cur_mem_paddr | L4_TYPE_PAGE | L4_PTE_DEV | L4_PTE_AF;

            cur_mem_paddr += PAGE_SIZE;
        }
    }

    // identical mem
    boot_l2pgdir[(PHY_MEM_BASE >> LEVEL2_PDE_SHIFT) & IDX_MASK] = (uint64_t)boot_kern_l3pgdir | L2_TYPE_TAB | L2_PTE_VALID;
    boot_l2pgdir[(P2V_WO(PHY_MEM_BASE) >> LEVEL2_PDE_SHIFT) & IDX_MASK] = (uint64_t)boot_kern_l3pgdir | L2_TYPE_TAB | L2_PTE_VALID;

    cur_mem_paddr = ALIGNDOWN((uint64_t)PHY_MEM_BASE, PAGE_SIZE);
    for (size_t i = 0; i < NUM_LEVEL3_PDE; i++) {
        boot_kern_l3pgdir[i] = (uint64_t)boot_kern_l4pgdirs[i] | L3_TYPE_TAB | L3_PTE_VALID;

        for (size_t j = 0; j < NUM_LEVEL4_PTE; j++) {
            boot_kern_l4pgdirs[i][j] = cur_mem_paddr | L4_TYPE_PAGE | L4_PTE_AF;

            cur_mem_paddr += PAGE_SIZE;
        }
    }
}

static void load_boot_pgdir()
{
    uint64_t val;

    TTBR0_W((uintptr_t)boot_l2pgdir);
    TTBR1_W(0);

    TCR_W(TCR_VALUE);
    MAIR_W((MT_DEVICE_nGnRnE << (8 * AI_DEVICE_nGnRnE_IDX)) | (MT_NORMAL_NC << (8 * AI_NORMAL_NC_IDX)));

    // Enable paging using read/modify/write
    SCTLR_R(val);
    val |= (1 << 0); // EL1 and EL0 stage 1 address translation enabled.

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
        memset(&kernel_data_begin, 0x00, (size_t)((uint64_t)kernel_data_end - (uint64_t)kernel_data_begin));
        _bss_inited = true;
    }
    main();
}