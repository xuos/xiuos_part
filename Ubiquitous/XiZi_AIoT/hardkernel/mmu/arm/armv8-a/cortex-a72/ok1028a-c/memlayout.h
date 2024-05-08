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
 * @file memlayout.h
 * @brief virtual memory and physical memory layout
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2024-04-25
 */
/*************************************************
File name: memlayout.h
Description: virtual memory and physical memory layout
Others:
History:
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#pragma once

// Memory layout
// clang-format off

#define ARCH_BIT        64

/* A72 physical memory layout */
#define PHY_MEM_BASE            (0x00000000)
#define PHY_USER_FREEMEM_BASE   (0x30000000)
#define PHY_USER_FREEMEM_TOP    (0x80000000)
#define PHY_MEM_STOP            (0x80000000)


/* PTE-PAGE_SIZE */
#define LEVEL4_PTE_SHIFT    12
#define LEVEL4_PTE_SIZE     (1 << LEVEL4_PTE_SHIFT)

/* PDE-SECTION_SIZE */
#define LEVEL3_PDE_SHIFT    21
#define LEVEL3_PDE_SIZE     (1 << LEVEL3_PDE_SHIFT)

#define LEVEL2_PTE_SHIFT    30

#define LEVEL1_PTE_SHIFT    39

#define NUM_LEVEL3_PDE      (1 << (ARCH_BIT - LEVEL3_PDE_SHIFT)) // how many PTE in a PT
#define NUM_LEVEL4_PTE      (1 << (LEVEL3_PDE_SHIFT - LEVEL4_PTE_SHIFT)) // how many PTE in a PT
#define NUM_TOPLEVEL_PDE    NUM_LEVEL3_PDE 

#define PAGE_SIZE           LEVEL4_PTE_SIZE
#define MAX_NR_FREE_PAGES   ((PHY_MEM_STOP - PHY_MEM_BASE) >> LEVEL4_PTE_SHIFT)

/* Deivce memory layout */
#define DEV_PHYMEM_BASE     (0x0000000000000000)
#define DEV_VRTMEM_BASE     (0x0000ffffffffffff)
#define DEV_MEM_SZ          (0x10000000)

/* User memory layout */
#define USER_STACK_SIZE     PAGE_SIZE
#define USER_MEM_BASE       (0x0000000000000000)
#define USER_MEM_TOP        DEV_VRTMEM_BASE
#define USER_IPC_SPACE_BASE (0x7000000000000000)
#define USER_IPC_SPACE_TOP  (USER_MEM_TOP - USER_STACK_SIZE)

/* Kernel memory layout */
#define KERN_MEM_BASE       (0xffff000000000000) // First kernel virtual address
#define KERN_OFFSET         (KERN_MEM_BASE - PHY_MEM_BASE)

#define V2P(a) (((uint64)(a)) - KERN_MEM_BASE)
#define P2V(a) ((void *)(((char *)(a)) + KERN_MEM_BASE))

#define V2P_WO(x) ((x) - KERN_MEM_BASE)    // same as V2P, but without casts
#define P2V_WO(x) ((x) + KERN_MEM_BASE)    // same as P2V, but without casts

// one beyond the highest possible virtual address.
#define MAXVA (KERN_MEM_BASE + (1ULL<<38))

// qemu puts UART registers here in physical memory.
#define UART0 (KERN_MEM_BASE + 0x09000000L)
#define UART0_IRQ 33

// virtio mmio interface
#define VIRTIO0  (KERN_MEM_BASE + 0x0a000000L)
#define VIRTIO0_IRQ  48

#define TIMER0_IRQ  27

// interrupt controller GICv3
#define GICV3         (KERN_MEM_BASE + 0x08000000L)
#define GICV3_REDIST  (KERN_MEM_BASE + 0x080a0000L)

// map kernel stacks beneath the trampoline,
// each surrounded by invalid guard pages.
#define PGSIZE 4096 // bytes per page
#define KSTACK(p) (MAXVA - ((p)+1) * 2*PGSIZE)


// extract the three 9-bit page table indices from a virtual address.
#define PXMASK          0x1FF // 9 bits
#define PXSHIFT(level)  (39-(level)*9)
#define PX(level, va) ((((uint64)(va)) >> PXSHIFT(level)) & PXMASK)

// clang-format on