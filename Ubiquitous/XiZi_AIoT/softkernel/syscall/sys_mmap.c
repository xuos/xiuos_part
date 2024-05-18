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

int sys_mmap(uintptr_t vaddr, uintptr_t paddr, int len, int is_dev)
{
    struct Thread* cur_task = cur_cpu()->task;
    assert(cur_task != NULL);

    int true_len = ALIGNUP(len, PAGE_SIZE);

    if (paddr != (uintptr_t)NULL) {
        if (xizi_share_page_manager.task_map_pages(cur_task, vaddr, paddr, true_len / PAGE_SIZE, is_dev) == (uintptr_t)NULL) {
            return -1;
        }
    } else {
        int load_len = 0;
        uintptr_t load_vaddr = vaddr;
        while (load_len < true_len) {
            char* paddr = raw_alloc(PAGE_SIZE);
            if (paddr == NULL) {
                return -1;
            }
            if (xizi_share_page_manager.task_map_pages(cur_task, load_vaddr, (uintptr_t)paddr, 1, false) == (uintptr_t)NULL) {
                raw_free(paddr);
                return -1;
            }
            load_vaddr += PAGE_SIZE;
            load_len += PAGE_SIZE;
        }
    }

    cur_task->memspace->mem_size += true_len;
    return vaddr + true_len;
}