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

#include "kalloc.h"
#include "pagetable.h"

uintptr_t* _page_walk(uintptr_t* pgdir, uintptr_t vaddr, bool alloc)
{

    // get page table addr
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