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
 * @file mmu.h
 * @brief mmu related configure and registers
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2024-04-26
 */
/*************************************************
File name: mmu.h
Description: mmu related configure and registers
Others:
History:
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#pragma once

#include <stdint.h>

#include "memlayout.h"
#include "page_table_entry.h"

#define TCR_IPS (0 << 32)
#define TCR_TG1_4K (0b10 << 30)
#define TCR_SH1_INNER (0b11 << 28)
#define TCR_ORGN1_IRGN1_WRITEBACK_WRITEALLOC ((0b01 << 26) | (0b01 << 24))
#define TCR_TG0_4K (0 << 14)
#define TCR_SH0_INNER (0b11 << 12)
#define TCR_ORGN0_IRGN0_WRITEBACK_WRITEALLOC ((0b01 << 10) | (0b01 << 8))
#define TCR_VALUE \
    (TCR_IPS | TCR_TG1_4K | TCR_SH1_INNER | TCR_ORGN1_IRGN1_WRITEBACK_WRITEALLOC | TCR_TG0_4K | TCR_SH0_INNER | TCR_ORGN0_IRGN0_WRITEBACK_WRITEALLOC)

enum AccessPermission {
    AccessPermission_NoAccess = 0,
    AccessPermission_KernelOnly = 1, // EL1
    AccessPermission_Reserved = 2,
    AccessPermission_KernelUser = 3, // EL1&EL0
};

void GetDevPteAttr(uintptr_t* attr);
void GetUsrPteAttr(uintptr_t* attr);
void GetUsrDevPteAttr(uintptr_t* attr);
void GetKernPteAttr(uintptr_t* attr);
void GetPdeAttr(uintptr_t* attr);

/*
Enable MMU, cache, write buffer, etc.
*/
#define SCTLR_R(val) __asm__ volatile("mrs %0, sctlr_el1" : "=r"(val))
#define SCTLR_W(val) __asm__ volatile("msr sctlr_el1, %0" ::"r"(val))

/*
Read and write mmu pagetable register base addr
*/
#define TTBR0_R(val) __asm__ volatile("mrs %0, ttbr0_el1" : "=r"(val))
#define TTBR0_W(val) __asm__ volatile("msr ttbr0_el1, %0" ::"r"(val))

/*
Read and write mmu pagetable register base addr
*/
#define TTBR1_R(val) __asm__ volatile("mrs %0, ttbr1_el1" : "=r"(val))
#define TTBR1_W(val) __asm__ volatile("msr ttbr1_el1, %0" ::"r"(val))

/*
TTBCR is used for choosing TTBR0 and TTBR1 as page table register.
When TTBCR is set to 0, TTBR0 is selected by default.
*/
// #define TTBCR_R(val) __asm__ volatile("mrs %0, ttbcr_el1" : "=r"(val))
// #define TTBCR_W(val) __asm__ volatile("msr ttbcr_el1, %0" ::"r"(val))

/*
DACR registers are used to control memory privilage.
The domain value is usually 0x01. The memory privilage will be controled by pte AP/APX
*/
// #define DACR_R(val) __asm__ volatile("mrs %0, dacr_el1" : "=r"(val))
// #define DACR_W(val) __asm__ volatile("msr dacr_el1, %0" :: "r"(val))

/*
Flush TLB when loading a new page table.
@note If nG is not set in the pte attribute, process switching need flush tlb.
*/
#define CLEARTLB(val) __asm__ volatile("tlbi vmalle1")

/*
When nG is set in the pte attribute, the process is assigned an ASID, which is stored in the lower 8 bits of the CONTEXTIDR register.
When the process switches, the flush TLB is no longer required anymore.
*/
#define CONTEXTIDR_R(val) __asm__ volatile("mrs %0, contextidr_el1" : "=r"(val))
#define CONTEXTIDR_W(val) __asm__ volatile("msr contextidr_el1, %0" ::"r"(val))

#ifndef __ASSEMBLER__
#include <stdint.h>
__attribute__((always_inline)) static inline uint64_t v2p(void* a) { return ((uint64_t)(a)) - KERN_MEM_BASE; }
__attribute__((always_inline)) static inline void* p2v(uint64_t a) { return (void*)((a) + KERN_MEM_BASE); }
#endif