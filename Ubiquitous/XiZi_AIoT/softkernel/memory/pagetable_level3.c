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
 * @file pagetable_level3.c
 * @brief page walk and L2 pagetable
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2024.05.06
 */

/*************************************************
File name: pagetable_level3.c
Description: ok1028 image vector table
Others:
History:
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

    uintptr_t* l2_pde_ptr = (uintptr_t*)&pgdir[(vaddr >> LEVEL2_PDE_SHIFT) & (NUM_LEVEL2_PDE - 1)];

    uintptr_t* l3_pde_vaddr;
    if (*l2_pde_ptr != 0) {
        uintptr_t l3_table_paddr = (*l2_pde_ptr) & ~pde_attr;
        l3_pde_vaddr = (uintptr_t*)P2V(l3_table_paddr);
    } else {
        if (!alloc || !(l3_pde_vaddr = (uintptr_t*)kalloc(sizeof(uintptr_t) * NUM_LEVEL3_PDE))) {
            return NULL;
        }

        memset(l3_pde_vaddr, 0, sizeof(uintptr_t) * NUM_LEVEL3_PDE);
        *l2_pde_ptr = V2P(l3_pde_vaddr) | pde_attr;
    }

    uintptr_t* l3_pde_ptr = (uintptr_t*)&l3_pde_vaddr[(vaddr >> LEVEL3_PDE_SHIFT) & (NUM_LEVEL3_PDE - 1)];

    uintptr_t* l4_pte_vaddr;
    if (*l3_pde_ptr != 0) {
        uintptr_t l4_table_paddr = (*l3_pde_ptr) & ~pde_attr;
        l4_pte_vaddr = (uintptr_t*)P2V(l4_table_paddr);
    } else {
        if (!alloc || !(l4_pte_vaddr = (uintptr_t*)kalloc(sizeof(uintptr_t) * NUM_LEVEL4_PTE))) {
            return NULL;
        }

        memset(l4_pte_vaddr, 0, sizeof(uintptr_t) * NUM_LEVEL4_PTE);
        *l3_pde_ptr = V2P(l4_pte_vaddr) | pde_attr;
    }

    return &l4_pte_vaddr[LEVEL4_PTE_IDX(vaddr)];
}

void _free_user_pgdir(struct TopLevelPageDirectory* pgdir)
{
    if (pgdir->pd_addr == NULL) {
        return;
    }

    uintptr_t low_bound = kern_virtmem_buddy.mem_start, high_bound = kern_virtmem_buddy.mem_end;
    uintptr_t user_low_bound = user_phy_freemem_buddy.mem_start, user_high_bound = user_phy_freemem_buddy.mem_end;
    uintptr_t end_idx = (USER_MEM_TOP >> LEVEL2_PDE_SHIFT) & (NUM_LEVEL2_PDE - 1);

    for (uintptr_t l2_entry_idx = 0; l2_entry_idx < end_idx; l2_entry_idx++) {
        // free each level3 page table
        uintptr_t* l3_table_paddr = (uintptr_t*)ALIGNDOWN(pgdir->pd_addr[l2_entry_idx], PAGE_SIZE);
        if (l3_table_paddr != NULL) {
            uintptr_t* l3_table_vaddr = P2V(l3_table_paddr);
            for (uintptr_t l3_entry_idx = 0; l3_entry_idx < NUM_LEVEL3_PDE; l3_entry_idx++) {
                uintptr_t* l4_table_paddr = (uintptr_t*)LEVEL4_PTE_ADDR(l3_table_vaddr[l3_entry_idx]);
                if (l4_table_paddr != NULL) {
                    uintptr_t* l4_table_vaddr = P2V(l4_table_paddr);
                    for (uintptr_t page_entry_idx = 0; page_entry_idx < NUM_LEVEL4_PTE; page_entry_idx++) {
                        uintptr_t vaddr = (l2_entry_idx << LEVEL2_PDE_SHIFT) | (l3_entry_idx << LEVEL3_PDE_SHIFT) | (page_entry_idx << LEVEL4_PTE_SHIFT);

                        // get page paddr
                        uintptr_t* page_paddr = (uintptr_t*)ALIGNDOWN((l4_table_vaddr)[page_entry_idx], PAGE_SIZE);
                        if (page_paddr != NULL) {
                            // Ensure the virtual address is not in the IPC address space
                            assert(vaddr < USER_IPC_SPACE_BASE || vaddr >= USER_IPC_SPACE_TOP);

                            if (LIKELY((uintptr_t)page_paddr >= low_bound && (uintptr_t)page_paddr < high_bound)) {
                                kfree(P2V(page_paddr));
                            } else if (LIKELY((uintptr_t)page_paddr >= user_low_bound && (uintptr_t)page_paddr < user_high_bound)) {
                                raw_free((char*)page_paddr);
                            }
                        }
                    }
                    kfree(P2V(l4_table_paddr));
                }
            }
            kfree(P2V(l3_table_paddr));
        }
    }
    kfree((char*)pgdir->pd_addr);
}
