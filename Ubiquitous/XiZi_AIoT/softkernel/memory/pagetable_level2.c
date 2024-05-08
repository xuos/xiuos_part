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
 * @file pagetable_level2.c
 * @brief page walk and L2 pagetable
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: pagetable_level2.c
Description: imx6q image vector table
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <stdint.h>

#include "core.h"
#include "memlayout.h"

#include "assert.h"
#include "buddy.h"
#include "kalloc.h"
#include "pagetable.h"

uintptr_t* _page_walk(uintptr_t* pgdir, uintptr_t vaddr, bool alloc)
{

    // get page table addr
    assert(pgdir != NULL);
    uintptr_t pde_attr = 0;
    _p_pgtbl_mmu_access->MmuPdeAttr(&pde_attr);

    uintptr_t* pde_ptr = (uintptr_t*)&pgdir[vaddr >> LEVEL3_PDE_SHIFT];

    uintptr_t* pgtbl_vaddr;
    if (*pde_ptr != 0) {
        uintptr_t pgtbl_paddr = (*pde_ptr) & ~pde_attr;
        pgtbl_vaddr = (uintptr_t*)P2V(pgtbl_paddr);
    } else {
        if (!alloc || !(pgtbl_vaddr = (uintptr_t*)kalloc(sizeof(uintptr_t) * NUM_LEVEL4_PTE))) {
            return 0;
        }

        memset(pgtbl_vaddr, 0, sizeof(uintptr_t) * NUM_LEVEL4_PTE);
        *pde_ptr = V2P(pgtbl_vaddr) | pde_attr;
    }

    return &pgtbl_vaddr[LEVEL4_PTE_IDX(vaddr)];
}

void _free_user_pgdir(struct TopLevelPageDirectory* pgdir)
{
    uintptr_t low_bound = kern_virtmem_buddy.mem_start, high_bound = kern_virtmem_buddy.mem_end;
    uintptr_t user_low_bound = user_phy_freemem_buddy.mem_start, user_high_bound = user_phy_freemem_buddy.mem_end;
    uintptr_t end_idx = USER_MEM_TOP >> LEVEL3_PDE_SHIFT;

    for (uintptr_t level4_entry_idx = 0; level4_entry_idx < end_idx; level4_entry_idx++) {
        // free each level4 page table
        uintptr_t* pgtbl_paddr = (uintptr_t*)LEVEL4_PTE_ADDR(pgdir->pd_addr[level4_entry_idx]);
        if (pgtbl_paddr != NULL) {
            // free each page
            for (uintptr_t page_entry_idx = 0; page_entry_idx < NUM_LEVEL4_PTE; page_entry_idx++) {
                uintptr_t vaddr = (level4_entry_idx << LEVEL3_PDE_SHIFT) | (page_entry_idx << LEVEL4_PTE_SHIFT);

                // get page paddr
                uintptr_t* page_paddr = (uintptr_t*)ALIGNDOWN(((uintptr_t*)P2V(pgtbl_paddr))[page_entry_idx], PAGE_SIZE);
                if (page_paddr != NULL) {
                    // IPC vaddr should not be addressed here.
                    assert(vaddr < USER_IPC_SPACE_BASE || vaddr >= USER_IPC_SPACE_TOP);

                    if (LIKELY((uintptr_t)page_paddr >= low_bound && (uintptr_t)page_paddr < high_bound)) {
                        kfree(P2V(page_paddr));
                    } else if (LIKELY((uintptr_t)page_paddr >= user_low_bound && (uintptr_t)page_paddr < user_high_bound)) {
                        raw_free((char*)page_paddr);
                    }
                }
            }
            kfree(P2V(pgtbl_paddr));
        }
    }
    kfree((char*)pgdir->pd_addr);
}