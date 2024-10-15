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

// #define TCR_SH1_INNER (0b11 << 28)
// #define TCR_ORGN1_IRGN1_WRITEBACK_WRITEALLOC ((0b01 << 26) | (0b01 << 24))
// #define TCR_SH0_INNER (0b11 << 12)
// #define TCR_ORGN0_IRGN0_WRITEBACK_WRITEALLOC ((0b01 << 10) | (0b01 << 8))
#define TCR_IPS (0 << 0)
#define TCR_TG1_4K (0b10 << 30)
#define TCR_TOSZ (0b11001 << 0)
#define TCR_T1SZ (0b11001 << 16)
#define TCR_TG0_4K (0 << 14)

#define TCR_VALUE \
    (TCR_IPS | TCR_TG1_4K | TCR_TG0_4K | TCR_TOSZ | TCR_T1SZ)

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
//#define SCTLR_R(val) __asm__ volatile("mrs %0, sctlr_el1" : "=r"(val)::"memory")
//#define SCTLR_W(val) __asm__ volatile("msr sctlr_el1, %0" ::"r"(val) : "memory")
#define SCTLR_R(val) 0
#define SCTLR_W(val) 0

/*
Read and write mmu pagetable register base addr
*/
//#define TTBR0_R(val) __asm__ volatile("mrs %0, ttbr0_el1" : "=r"(val)::"memory")
//#define TTBR0_W(val) __asm__ volatile("msr ttbr0_el1, %0" ::"r"(val) : "memory")
#define TTBR0_R(val) 0
#define TTBR0_W(val) 0

/*
Read and write mmu pagetable register base addr
*/
//#define TTBR1_R(val) __asm__ volatile("mrs %0, ttbr1_el1" : "=r"(val)::"memory")
//#define TTBR1_W(val) __asm__ volatile("msr ttbr1_el1, %0" ::"r"(val) : "memory")
#define TTBR1_R(val) 0
#define TTBR1_W(val) 0

/*
Translation Control Register（TCR）
*/
//#define TCR_R(val) __asm__ volatile("mrs %0, tcr_el1" : "=r"(val)::"memory")
//#define TCR_W(val) __asm__ volatile("msr tcr_el1, %0" ::"r"(val) : "memory")
#define TCR_R(val) 0
#define TCR_W(val) 0

//#define MAIR_R(val) __asm__ volatile("mrs %0, mair_el1" : "=r"(val)::"memory")
//#define MAIR_W(val) __asm__ volatile("msr mair_el1, %0" ::"r"(val) : "memory")
#define MAIR_R(val) 0
#define MAIR_W(val) 0
/*
Flush TLB when loading a new page table.
@note If nG is not set in the pte attribute, process switching need flush tlb.
*/
// #define CLEARTLB(val) __asm__ volatile("tlbi vmalle1" ::: "memory")
//#define CLEARTLB(val) __asm__ volatile("tlbi vmalle1is" ::: "memory")
#define CLEARTLB(val) 0

/*
When nG is set in the pte attribute, the process is assigned an ASID, which is stored in the lower 8 bits of the CONTEXTIDR register.
When the process switches, the flush TLB is no longer required anymore.
*/
//#define CONTEXTIDR_R(val) __asm__ volatile("mrs %0, contextidr_el1" : "=r"(val))
//#define CONTEXTIDR_W(val) __asm__ volatile("msr contextidr_el1, %0" ::"r"(val))
#define CONTEXTIDR_R(val) 0
#define CONTEXTIDR_W(val) 0

#ifndef __ASSEMBLER__
#include <stdint.h>
__attribute__((always_inline)) static inline uint64_t v2p(void* a) { return ((uint64_t)(a)) - KERN_MEM_BASE; }
__attribute__((always_inline)) static inline void* p2v(uint64_t a) { return (void*)((a) + KERN_MEM_BASE); }
#endif