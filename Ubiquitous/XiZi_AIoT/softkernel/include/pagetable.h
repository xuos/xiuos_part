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
 * @file pagetable.h
 * @brief page table header
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: pagetable.h
Description: page table header
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#pragma once
#include <stdbool.h>
#include <stdint.h>
#include <string.h>

#include "memlayout.h"

#include "actracer.h"
#include "mmu.h"
#include "mmu_common.h"

// clang-format off
#define ALIGNUP(sz, al)         (((uintptr_t)(sz) + (uintptr_t)(al) - 1) & ~((uintptr_t)(al) - 1))
#define ALIGNDOWN(sz, al)       ((uintptr_t)(sz) & ~((uintptr_t)(al) - 1))

#define LEVEL4_PTE_IDX(v)       (((uintptr_t)(v) >> LEVEL4_PTE_SHIFT) & (NUM_LEVEL4_PTE - 1))
#define LEVEL4_PTE_ADDR(v)      ALIGNDOWN(v, LEVEL4_PTE_SIZE)
#define LEVEL3_PDE_ADDR(v)      ALIGNDOWN(v, LEVEL3_PDE_SIZE)

#define TOPLEVLE_PAGEDIR_SIZE   sizeof(uintptr_t) * NUM_TOPLEVEL_PDE
// clang-format on

struct TopLevelPageDirectory {
    uintptr_t* pd_addr;
};

struct PagerRightGroup {
    struct TraceTag mmu_driver_tag;
};

struct XiziPageManager {
    bool (*new_pgdir)(struct TopLevelPageDirectory* pgdir);
    void (*free_user_pgdir)(struct TopLevelPageDirectory* pgdir);
    bool (*map_pages)(uintptr_t* pgdir, uintptr_t vaddr, uintptr_t paddr, uintptr_t len, bool is_dev);
    bool (*unmap_pages)(uintptr_t* pgdir, uintptr_t vaddr, uintptr_t len);

    uintptr_t (*resize_user_pgdir)(struct TopLevelPageDirectory* pgdir, uintptr_t old_size, uintptr_t new_size);
    uintptr_t (*address_translate)(struct TopLevelPageDirectory* pgdir, uintptr_t vaddr);
    uintptr_t (*cross_vspace_data_copy)(struct TopLevelPageDirectory* pgdir, uintptr_t cross_dest, uintptr_t src, uintptr_t len);
};

extern struct MmuCommonDone* _p_pgtbl_mmu_access;
uintptr_t* _page_walk(uintptr_t* pgdir, uintptr_t vaddr, bool alloc);
void _free_user_pgdir(struct TopLevelPageDirectory* pgdir);

extern struct TopLevelPageDirectory kern_pgdir;
void load_kern_pgdir(struct TraceTag* mmu_driver_tag, struct TraceTag* intr_driver_tag);
void secondary_cpu_load_kern_pgdir(struct TraceTag* mmu_driver_tag, struct TraceTag* intr_driver_tag);

extern struct XiziPageManager xizi_pager;
bool module_pager_init(struct PagerRightGroup*);