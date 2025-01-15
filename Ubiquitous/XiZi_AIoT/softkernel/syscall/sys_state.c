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

#define SHOWINFO_BORDER_LINE() LOG_PRINTF("******************************************************\n");
#define SHOWTASK_TASK_BASE_INFO(task) LOG_PRINTF(" %-6d %-16s %-4d 0x%x(%-d)\n", task->tid, task->name, task->priority, task->memspace->mem_size >> 10, task->memspace->mem_size >> 10)

void show_tasks(void)
{
    struct Thread* task = NULL;
    SHOWINFO_BORDER_LINE();
    for (int i = 0; i < NR_CPU; i++) {
        LOG_PRINTF("CPU %-2d: %s\n", i, (global_cpus[i].task == NULL ? "NULL" : global_cpus[i].task->name));
    }
    SHOWINFO_BORDER_LINE();
    LOG_PRINTF("%-8s %-6s %-16s %-4s %-8s\n", "STAT", "ID", "TASK", "PRI", "MEM(KB)");
    DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_running_list_head, node)
    {
        LOG_PRINTF("%-8s", "RUNNING");
        SHOWTASK_TASK_BASE_INFO(task);
    }

    for (int i = 0; i < TASK_MAX_PRIORITY; i++) {
        if (IS_DOUBLE_LIST_EMPTY(&xizi_task_manager.task_list_head[i])) {
            continue;
        }
        DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[i], node)
        {
            switch (task->state) {
            case INIT:
                LOG_PRINTF("%-8s", "INIT");
                break;
            case READY:
                LOG_PRINTF("%-8s", "READY");
                break;
            case RUNNING:
                LOG_PRINTF("%-8s", "RUNNING");
                break;
            case DEAD:
                LOG_PRINTF("%-8s", "DEAD");
                break;
            default:
                break;
            }

            SHOWTASK_TASK_BASE_INFO(task);
        }
    }

    DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_blocked_list_head, node)
    {
        LOG_PRINTF("%-8s", "BLOCK");
        SHOWTASK_TASK_BASE_INFO(task);
    }

    struct ksemaphore* sem = NULL;
    DOUBLE_LIST_FOR_EACH_ENTRY(sem, &xizi_task_manager.semaphore_pool.sem_list_guard, sem_list_node)
    {
        task = NULL;
        DOUBLE_LIST_FOR_EACH_ENTRY(task, &sem->wait_list_guard, node)
        {
            LOG_PRINTF("%-8s", "BLOCK");
            SHOWTASK_TASK_BASE_INFO(task);
        }
    }

    SHOWINFO_BORDER_LINE();
    return;
}

extern struct KBuddy user_phy_freemem_buddy;
extern struct KBuddy kern_virtmem_buddy;
extern uintptr_t kernel_data_end[];
void show_mem(void)
{
    SHOWINFO_BORDER_LINE();

    uint64_t total = (PHY_MEM_STOP - V2P(kernel_data_end));
    uint64_t user_dynamic_free = 0;
    uint64_t kernel_free = 0;
    for (int j = 0; j < MAX_BUDDY_ORDER; j++) {
        user_dynamic_free += user_phy_freemem_buddy.free_list[j].n_free_pages * (1 << j) * PAGE_SIZE;
        kernel_free += kern_virtmem_buddy.free_list[j].n_free_pages * (1 << j) * PAGE_SIZE;
    }
    LOG_PRINTF("%-16s 0x%016lx\n", "TOTAL(B)", total);
    LOG_PRINTF("%-16s 0x%016lx\n", "KERNEL USED(B)", (kern_virtmem_buddy.mem_end - kern_virtmem_buddy.mem_start - kernel_free));
    LOG_PRINTF("%-16s 0x%016lx\n", "LIBMEM USED(B)", (user_phy_freemem_buddy.mem_end - user_phy_freemem_buddy.mem_start - user_dynamic_free));
    LOG_PRINTF("%-16s 0x%016lx\n", "FREE(B)", user_dynamic_free + kernel_free);

    SHOWINFO_BORDER_LINE();
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

    struct Thread* current_task = cur_cpu()->task;
    assert(current_task != NULL);

    LOG_PRINTF(" ID  COMMAND        USED_TICKS  FREE_TICKS \n");
    LOG_PRINTF(" %d   %s   %d          %d\n", cpu_id, current_task->name, TASK_CLOCK_TICK - current_task->remain_tick, current_task->remain_tick);

    LOG_PRINTF("***********************************************************\n");
    return;
}

int sys_state(sys_state_option option, sys_state_info* info)
{
    switch (option) {
    case SYS_STATE_MEMBLOCK_INFO: {
#ifndef __riscv
        info->memblock_info.memblock_start = (uintptr_t)V2P(_binary_fs_img_start);
        info->memblock_info.memblock_end = (uintptr_t)V2P(_binary_fs_img_end);
#else
        info->memblock_info.memblock_start = (uintptr_t)V2P_LINK(_binary_fs_img_start);
        info->memblock_info.memblock_end = (uintptr_t)V2P_LINK(_binary_fs_img_end);
#endif
        break;
    }
    case SYS_STATE_GET_HEAP_BASE:
        return cur_cpu()->task->memspace->heap_base;
    case SYS_STATE_SET_TASK_PRIORITY:
        xizi_task_manager.set_cur_task_priority(info->priority);
        break;
    case SYS_STATE_SHOW_TASKS:
        show_tasks();
        break;
    case SYS_STATE_SHOW_MEM_INFO:
        show_mem();
        break;
    case SYS_STATE_SHOW_CPU_INFO:
        show_cpu();
        break;
    case SYS_STATE_GET_CURRENT_TICK: {
        extern void hw_current_tick(uintptr_t * tick);
        hw_current_tick(&info->current_tick);
        break;
    }
    case SYS_STATE_GET_CURRENT_SECOND: {
        extern void hw_current_second(uintptr_t * tick);
        hw_current_second(&info->current_second);
        break;
    }
    case SYS_STATE_TEST:
    default:
        break;
    }

    return 0;
}