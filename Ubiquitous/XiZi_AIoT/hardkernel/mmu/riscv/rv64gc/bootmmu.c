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
#include <asm/csr.h>
#include <asm/pgtable-bits.h>

#include <stdint.h>
#include <string.h>

extern uint64_t kernel_data_end[];
extern uint64_t kernel_data_begin[];

// clang-format off
#define L2_PTE_VALID        (1 << 0)

#define L3_PTE_VALID        (1 << 0)

#define L4_TYPE_PAGE        (3 << 0)
#define L4_PTE_DEV          ((0b00) << 2) // Device memory
#define L4_PTE_NORMAL       ((0b01) << 2) // Device memory
#define L4_PTE_AF           (1 << 10) // Data Access Permissions

#define L4_PTE_PXN          (1UL << 53)   // Privileged eXecute Never
#define L4_PTE_UXN          (1UL << 54)   // Unprivileged(user) eXecute Never
#define L4_PTE_XN           (PTE_PXN|PTE_UXN)  // eXecute Never

#define IDX_MASK            (0b111111111)
#define L3_PDE_INDEX(idx)   ((idx << LEVEL3_PDE_SHIFT) & L3_IDX_MASK)

#define _PAGE_KERNEL        (_PAGE_PRESENT | _PAGE_READ | _PAGE_WRITE | _PAGE_EXEC | _PAGE_ACCESSED | _PAGE_GLOBAL | _PAGE_DIRTY)
#define PAGE_KERNEL	        (_PAGE_KERNEL)
#define PAGE_KERNEL_READ    (_PAGE_KERNEL & ~_PAGE_WRITE)
#define PAGE_KERNEL_EXEC    (_PAGE_KERNEL | _PAGE_EXEC)

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
        uint64_t kern_phy_mem_base = PHY_MEM_BASE;
        uint64_t cur_mem_paddr;

        // dev mem
        boot_l2pgdir[(dev_phy_mem_base >> LEVEL2_PDE_SHIFT) & IDX_MASK] = (((uint64_t)boot_dev_l3pgdir >> PAGE_SHIFT) << _PAGE_PFN_SHIFT) | _PAGE_TABLE;
        boot_l2pgdir[(MMIO_P2V_WO(dev_phy_mem_base) >> LEVEL2_PDE_SHIFT) & IDX_MASK] = (((uint64_t)boot_dev_l3pgdir >> PAGE_SHIFT) << _PAGE_PFN_SHIFT) | _PAGE_TABLE;

        cur_mem_paddr = ALIGNDOWN(dev_phy_mem_base, LEVEL2_PDE_SIZE);
        for (size_t i = 0; i < NUM_LEVEL3_PDE; i++) {
            boot_dev_l3pgdir[i] = (((uint64_t)boot_dev_l4pgdirs[i] >> PAGE_SHIFT) << _PAGE_PFN_SHIFT) | _PAGE_TABLE;

            for (size_t j = 0; j < NUM_LEVEL4_PTE; j++) {
                boot_dev_l4pgdirs[i][j] = ((cur_mem_paddr >> PAGE_SHIFT) << _PAGE_PFN_SHIFT) | PAGE_KERNEL;
                cur_mem_paddr += PAGE_SIZE;
            }
        }

        // identical mem
        boot_l2pgdir[(kern_phy_mem_base >> LEVEL2_PDE_SHIFT) & IDX_MASK] = (((uint64_t)boot_kern_l3pgdir >> PAGE_SHIFT) << _PAGE_PFN_SHIFT) | _PAGE_TABLE;
        boot_l2pgdir[(P2V_WO(kern_phy_mem_base) >> LEVEL2_PDE_SHIFT) & IDX_MASK] = (((uint64_t)boot_kern_l3pgdir >> PAGE_SHIFT) << _PAGE_PFN_SHIFT) | _PAGE_TABLE;

        cur_mem_paddr = ALIGNDOWN(kern_phy_mem_base, PAGE_SIZE);
        for (size_t i = 0; i < NUM_LEVEL3_PDE; i++) {
            boot_kern_l3pgdir[i] = (((uint64_t)boot_kern_l4pgdirs[i] >> PAGE_SHIFT) << _PAGE_PFN_SHIFT)  | _PAGE_TABLE;

            for (size_t j = 0; j < NUM_LEVEL4_PTE; j++) {
                boot_kern_l4pgdirs[i][j] = ((cur_mem_paddr >> PAGE_SHIFT) << _PAGE_PFN_SHIFT) | PAGE_KERNEL;
                cur_mem_paddr += PAGE_SIZE;
            }
        }

        built = true;
    }
}

static inline void local_flush_tlb_all(void)
{
    __asm__ __volatile__ ("sfence.vma" : : : "memory");
}

static void load_boot_pgdir()
{
    unsigned long satp_val = 0;

    satp_val = (unsigned long)(((uintptr_t)boot_l2pgdir >> PAGE_SHIFT) | SATP_MODE);
#if 1    //to debug
    csr_write(CSR_SATP, satp_val);
#endif
}

extern void main(void);
static bool _bss_inited = false;
void bootmain()
{
    _debug_uart_phymem_init();
    _debug_uart_printascii("bootmain start.\n");

    build_boot_pgdir();
    load_boot_pgdir();
    _debug_uart_printascii("boot pgdir success\n");

    __asm__ __volatile__("addi sp, sp, %0" ::"i"(KERN_OFFSET));
    if (!_bss_inited) {
        memset(&kernel_data_begin, 0x00, (size_t)((uint64_t)kernel_data_end - (uint64_t)kernel_data_begin));
        _bss_inited = true;
    }

    main();
}

