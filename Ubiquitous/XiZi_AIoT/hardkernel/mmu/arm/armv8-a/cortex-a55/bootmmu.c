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
#define L4_PTE_NORMAL       ((0b01) << 2) // Device memory
#define L4_PTE_AF           (1 << 10) // Data Access Permissions

#define L4_PTE_PXN             (1UL << 53)   // Privileged eXecute Never
#define L4_PTE_UXN             (1UL << 54)   // Unprivileged(user) eXecute Never
#define L4_PTE_XN              (PTE_PXN|PTE_UXN)  // eXecute Never

#define IDX_MASK            (0b111111111)
#define L3_PDE_INDEX(idx)   ((idx << LEVEL3_PDE_SHIFT) & L3_IDX_MASK)
// clang-format on

uint64_t boot_l2pgdir[NUM_LEVEL2_PDE] __attribute__((aligned(0x1000))) = { 0 };

uint64_t boot_dev_l3pgdir[NUM_LEVEL3_PDE] __attribute__((aligned(0x1000))) = { 0 };
uint64_t boot_kern_l3pgdir[NUM_LEVEL3_PDE] __attribute__((aligned(0x1000))) = { 0 };

uint64_t boot_dev_l4pgdirs[NUM_LEVEL3_PDE][NUM_LEVEL4_PTE] __attribute__((aligned(0x1000))) = { 0 };
uint64_t boot_kern_l4pgdirs[NUM_LEVEL3_PDE][NUM_LEVEL4_PTE] __attribute__((aligned(0x1000))) = { 0 };

static void build_boot_pgdir()
{
    static bool built = false;
    if (!built) {
        uint64_t dev_phy_mem_base = DEV_PHYMEM_BASE;

        // dev mem
        boot_l2pgdir[(dev_phy_mem_base >> LEVEL2_PDE_SHIFT) & IDX_MASK] = (uint64_t)boot_dev_l3pgdir | L2_TYPE_TAB | L2_PTE_VALID;
        boot_l2pgdir[(MMIO_P2V_WO(dev_phy_mem_base) >> LEVEL2_PDE_SHIFT) & IDX_MASK] = (uint64_t)boot_dev_l3pgdir | L2_TYPE_TAB | L2_PTE_VALID;

        uint64_t cur_mem_paddr = ALIGNDOWN((uint64_t)DEV_PHYMEM_BASE, LEVEL2_PDE_SIZE);
        for (size_t i = 0; i < NUM_LEVEL3_PDE; i++) {
            boot_dev_l3pgdir[i] = (uint64_t)boot_dev_l4pgdirs[i] | L3_TYPE_TAB | L3_PTE_VALID;

            for (size_t j = 0; j < NUM_LEVEL4_PTE; j++) {
                boot_dev_l4pgdirs[i][j] = cur_mem_paddr | L4_TYPE_PAGE | L4_PTE_DEV | L4_PTE_AF | L4_PTE_XN;
                if (cur_mem_paddr >= DEV_PHYMEM_BASE && cur_mem_paddr < DEV_PHYMEM_BASE + DEV_MEM_SIZE) {
                    boot_dev_l4pgdirs[i][j] = cur_mem_paddr | 0x403;
                } else {
                    // boot_dev_l4pgdirs[i][j] = cur_mem_paddr | 0x713;
                    boot_dev_l4pgdirs[i][j] = cur_mem_paddr | 0x403;
                }

                cur_mem_paddr += PAGE_SIZE;
            }

            // if (cur_mem_paddr >= DEV_PHYMEM_BASE && cur_mem_paddr < DEV_PHYMEM_BASE + DEV_MEM_SIZE) {
            //     boot_dev_l3pgdir[i] = cur_mem_paddr | 0x401;
            // } else {
            //     boot_dev_l3pgdir[i] = cur_mem_paddr | 0x711;
            // }
            // cur_mem_paddr += PAGE_SIZE * 0x200;
        }

        // identical mem
        boot_l2pgdir[(PHY_MEM_BASE >> LEVEL2_PDE_SHIFT) & IDX_MASK] = (uint64_t)boot_kern_l3pgdir | L2_TYPE_TAB | L2_PTE_VALID;
        boot_l2pgdir[(P2V_WO(PHY_MEM_BASE) >> LEVEL2_PDE_SHIFT) & IDX_MASK] = (uint64_t)boot_kern_l3pgdir | L2_TYPE_TAB | L2_PTE_VALID;

        cur_mem_paddr = ALIGNDOWN((uint64_t)0x00000000ULL, PAGE_SIZE);
        for (size_t i = 0; i < NUM_LEVEL3_PDE; i++) {
            boot_kern_l3pgdir[i] = (uint64_t)boot_kern_l4pgdirs[i] | L3_TYPE_TAB | L3_PTE_VALID;

            for (size_t j = 0; j < NUM_LEVEL4_PTE; j++) {
                // boot_kern_l4pgdirs[i][j] = cur_mem_paddr | L4_TYPE_PAGE | L4_PTE_NORMAL | L4_PTE_AF;
                boot_kern_l4pgdirs[i][j] = cur_mem_paddr | 0x713;

                cur_mem_paddr += PAGE_SIZE;
            }
        }

        built = true;
    }
}

#include "log.h"
static void load_boot_pgdir()
{

    TTBR0_W((uintptr_t)boot_l2pgdir);
    TTBR1_W(0);

#define TCR_TRUE_VALUE (0x0000000080813519ULL)
    uint64_t tcr = 0;
    TCR_R(tcr);
    tcr &= (uint64_t)~0xFF;
    tcr |= 0x19;
    TCR_W(tcr);

    // Enable paging using read/modify/write
    // uint32_t val = 0;
    // SCTLR_R(val);
    // debug_printf_("Old SCTLR: %016lx\r\n", val);
    // val |= (1 << 0); // EL1 and EL0 stage 1 address translation enabled.
    // debug_printf_("New SCTLR: %08x\r\n", val);
    // val &= (uint32_t) ~(0x1 << 2);
    // debug_printf_("New SCTLR: %08x\r\n", val);
    // SCTLR_W(val);
    // debug_printf_("l2[0]: %p\r\n", boot_l2pgdir[0]);
    // debug_printf_("l2[1]: %p\r\n", boot_l2pgdir[1]);
    // debug_printf_("l2[2]: %p\r\n", boot_l2pgdir[2]);
    // debug_printf_("l2[3]: %p\r\n", boot_l2pgdir[3]);
    // debug_printf_("test upper address: %x\r\n", *(uintptr_t*)boot_l2pgdir);
    // debug_printf_("pgdir[%d] = %p\r\n", 384, boot_l2pgdir[384]);
    // debug_printf_("test upper address: %x\r\n", *(uintptr_t*)P2V(boot_l2pgdir));

    // flush all TLB
    // debug_printf_("Flushing TLB.\r\n");
    DSB();
    CLEARTLB(0);
    ISB();
}

static inline unsigned int current_el(void)
{
    unsigned int el;
    asm volatile("mrs %0, CurrentEL" : "=r"(el) : : "cc");
    return el >> 2;
}

extern void main(void);
static bool _bss_inited = false;
void bootmain()
{
    build_boot_pgdir();
    load_boot_pgdir();
    __asm__ __volatile__("add sp, sp, %0" ::"r"(KERN_OFFSET));
    if (!_bss_inited) {
        memset(&kernel_data_begin, 0x00, (size_t)((uint64_t)kernel_data_end - (uint64_t)kernel_data_begin));
        _bss_inited = true;
    }
    main();
}