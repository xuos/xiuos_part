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
 * @file mmu.c
 * @brief mmu operations
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: mmu.c
Description: mmu operations
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <string.h>

#include "mmu.h"

#include "cache_common_ope.h"
#include "mmu_common.h"
#include "trap_common.h"

// extern struct MmuCommonDone mmu_common_done;
static struct MmuDriverRightGroup right_group;

void load_pgdir_critical(uintptr_t pgdir_paddr, struct TraceTag* intr_driver_tag)
{

    /* get cache driver */
    struct ICacheDone* p_icache_done = AchieveResource(&right_group.icache_driver_tag);
    struct DCacheDone* p_dcache_done = AchieveResource(&right_group.dcache_driver_tag);

    /* get intr driver */
    struct XiziTrapDriver* p_intr_driver = AchieveResource(intr_driver_tag);

    p_intr_driver->cpu_irq_disable();
    TTBR0_W((uint32_t)pgdir_paddr);
    CLEARTLB(0);
    p_icache_done->invalidateall();
    p_dcache_done->flushall();
    p_intr_driver->cpu_irq_enable();
}

void load_pgdir(uintptr_t pgdir_paddr)
{
    /* get cache driver */
    struct ICacheDone* p_icache_done = AchieveResource(&right_group.icache_driver_tag);
    struct DCacheDone* p_dcache_done = AchieveResource(&right_group.dcache_driver_tag);

    TTBR0_W((uint32_t)pgdir_paddr);
    CLEARTLB(0);
    p_icache_done->invalidateall();
    p_dcache_done->flushall();
}

__attribute__((always_inline)) inline static void _tlb_flush(uintptr_t va)
{
    __asm__ volatile("mcr p15, 0, %0, c8, c7, 1" ::"r"(va) :);
}

static void tlb_flush_range(uintptr_t vstart, int len)
{
    uintptr_t vaddr = vstart;
    uintptr_t vend = vaddr + len;
    for (; vaddr <= vend; vaddr += PAGE_SIZE) {
        _tlb_flush(vaddr);
    }
}

static struct MmuCommonDone mmu_common_done = {
    .MmuDevPteAttr = GetDevPteAttr,
    .MmuPdeAttr = GetPdeAttr,
    .MmuUsrPteAttr = GetUsrPteAttr,
    .MmuUsrDevPteAttr = GetUsrDevPteAttr,
    .MmuKernPteAttr = GetKernPteAttr,

    .LoadPgdirCrit = load_pgdir_critical,
    .LoadPgdir = load_pgdir,
    .TlbFlush = tlb_flush_range,
};

struct MmuCommonDone* hardkernel_mmu_init(struct TraceTag* hardkernel_tag, char* icache_name, char* dcache_name)
{
    /* init right group for mmu driver */
    AchieveResourceTag(&right_group.icache_driver_tag, hardkernel_tag, icache_name);
    AchieveResourceTag(&right_group.dcache_driver_tag, hardkernel_tag, dcache_name);

    return &mmu_common_done;
}