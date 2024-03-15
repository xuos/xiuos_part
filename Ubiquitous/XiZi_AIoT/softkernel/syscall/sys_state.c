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
 * @file sys_state.c
 * @brief task ask for kernel status(for debug perpose)
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: sys_state.c
Description: task ask for kernel status(for debug perpose)
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <stdint.h>
#include <string.h>

#include "assert.h"
#include "buddy.h"
#include "log.h"
#include "multicores.h"
#include "pagetable.h"
#include "syscall.h"
#include "task.h"

extern uint8_t _binary_fs_img_start[], _binary_fs_img_end[];

/// @brief Padding task name length to TASK_NAME_MAX_LEN
static inline void _padding(char* name)
{
    int i;
    size_t length = strlen(name);
    for (i = length; i < TASK_NAME_MAX_LEN - 1; i++) {
        name[i] = ' ';
    }
    name[i] = '\0';
    return;
}

void show_tasks(void)
{
    struct TaskMicroDescriptor* task = NULL;
    LOG_PRINTF("******************************************************\n");
    for (int i = 0; i < NR_CPU; i++) {
        LOG_PRINTF("CPU %d: ", i);
        if (global_cpus[i].task != NULL) {
            LOG_PRINTF("%s\n", global_cpus[i].task->name);
        } else {
            LOG_PRINTF("NULL\n");
        }
    }
    LOG_PRINTF("******************************************************\n");
    LOG_PRINTF("STAT     ID   TASK            PRI   LEFT_TICKS\n");
    for (int i = 0; i < TASK_MAX_PRIORITY; i++) {
        if (IS_DOUBLE_LIST_EMPTY(&xizi_task_manager.task_list_head[i])) {
            continue;
        }
        DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[i], node)
        {
            if (task->state == INIT)
                LOG_PRINTF("   INIT ");
            else if (task->state == READY)
                LOG_PRINTF("  READY ");
            else if (task->state == RUNNING)
                LOG_PRINTF("RUNNING ");
            else if (task->state == DEAD)
                LOG_PRINTF("   DEAD ");

            _padding(task->name);
            LOG_PRINTF("  %d   %s  %d       %d\n", task->pid, task->name, task->priority, task->remain_tick);
        }
    }
    LOG_PRINTF("******************************************************\n");
    return;
}

extern struct KBuddy user_phy_freemem_buddy;
extern struct KBuddy kern_virtmem_buddy;
extern uint32_t kernel_data_end[];
void show_mem(void)
{
    LOG_PRINTF("*********************************************************\n");
    LOG_PRINTF(" TOTAL(KB)        USED(KB)        FREE(KB) \n");

    uint32_t total = (PHY_MEM_STOP - V2P(kernel_data_end)) >> 10;
    uint32_t used = 0;
    for (int j = 0; j < MAX_BUDDY_ORDER; j++) {
        used += user_phy_freemem_buddy.free_list[j].n_free_pages * (1 << j) * PAGE_SIZE;
        used += kern_virtmem_buddy.free_list[j].n_free_pages * (1 << j) * PAGE_SIZE;
    }
    used = used >> 10;

    LOG_PRINTF(" %d           %d           %d\n", total, total - used, used);
    LOG_PRINTF("*********************************************************\n");
    return;
}

void show_cpu(void)
{
    LOG_PRINTF("**********************************************************\n");
#ifdef ARCH_SMP
    /// @todo support smp
    KPrintf(" cpu  VALUE \n");
#endif

    int cpu_id = 0;

    struct TaskMicroDescriptor* current_task = cur_cpu()->task;
    assert(current_task != NULL);

    _padding(current_task->name);

    LOG_PRINTF(" ID  COMMAND        USED_TICKS  FREE_TICKS \n");
    LOG_PRINTF(" %d   %s   %d          %d\n", cpu_id, current_task->name, TASK_CLOCK_TICK - current_task->remain_tick, current_task->remain_tick);

    LOG_PRINTF("***********************************************************\n");
    return;
}

int sys_state(sys_state_option option, sys_state_info* info)
{
    if (option == SYS_STATE_MEMBLOCK_INFO) {
        info->memblock_info.memblock_start = (uintptr_t)V2P(_binary_fs_img_start);
        info->memblock_info.memblock_end = (uintptr_t)V2P(_binary_fs_img_end);
    } else if (option == SYS_STATE_GET_HEAP_BASE) {
        return cur_cpu()->task->mem_size;
    } else if (option == SYS_STATE_SET_TASK_PRIORITY) {
        xizi_task_manager.set_cur_task_priority(info->priority);
    } else if (option == SYS_STATE_SHOW_TASKS) {
        show_tasks();
    } else if (option == SYS_STATE_SHOW_MEM_INFO) {
        show_mem();
    } else if (option == SYS_STATE_SHOW_CPU_INFO) {
        show_cpu();
    }

    return 0;
}