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
 * @file sys_mmap.c
 * @brief map task phy address to virt address
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: sys_mmap.c
Description: map task phy address to virt address
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <stdint.h>

#include "assert.h"
#include "kalloc.h"
#include "multicores.h"
#include "share_page.h"
#include "syscall.h"
#include "task.h"

int sys_mmap(uintptr_t* vaddr, uintptr_t* paddr, int len, int is_dev)
{
    struct Thread* cur_task = cur_cpu()->task;
    assert(cur_task != NULL);

    int true_len = ALIGNUP(len, PAGE_SIZE);

    if (*paddr != (uintptr_t)NULL) {
        if (*paddr >= PHY_MEM_BASE && *paddr < PHY_MEM_STOP && cur_task->tid > 1) {
            ERROR("mapping invalid memory: 0x%p\n", *paddr);
            return -1;
        }

        if (xizi_share_page_manager.task_map_pages(cur_task, *vaddr, *paddr, true_len / PAGE_SIZE, is_dev) == (uintptr_t)NULL) {
            return -1;
        }
    } else {
        uintptr_t load_vaddr = *vaddr;
        char* new_paddr = raw_alloc_by_ownership(cur_task->memspace->userspace_mem_usage.tag, true_len);
        if (new_paddr == NULL) {
            return -1;
        }
        if (xizi_share_page_manager.task_map_pages(cur_task, load_vaddr, (uintptr_t)new_paddr, true_len / PAGE_SIZE, false) == (uintptr_t)NULL) {
            raw_free_by_ownership(cur_task->memspace->userspace_mem_usage.tag, new_paddr);
            return -1;
        }
        CreateResourceTag(NULL, &cur_task->memspace->tag, "USER_MEMORY", TRACER_MEM_FROM_BUDDY_AC_RESOURCE, new_paddr);
        *paddr = (uintptr_t)new_paddr;
    }

    cur_task->memspace->mem_size += true_len;
    *vaddr = *vaddr + true_len;
    return 0;
}