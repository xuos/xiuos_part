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
 * @file sys_spawn.c
 * @brief spawn a task
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: sys_spawn.c
Description: spawn a task
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include "actracer.h"
#include "assert.h"
#include "memspace.h"
#include "share_page.h"
#include "syscall.h"
#include "task.h"

extern int task_exec(struct Thread* task, char* img_start, char* name, char** argv);
int sys_spawn(char* img_start, char* name, char** argv)
{
    // alloc a new memspace
    struct MemSpace* pmemspace = alloc_memspace();
    if (pmemspace == NULL) {
        return -1;
    }

    // load memspace
    uintptr_t* entry = load_memspace(pmemspace, img_start);
    if (NULL == entry) {
        ERROR("Loading memspace from %016x failed.\n", img_start);
        free_memspace(pmemspace);
        return -1;
    }

    // alloc a new pcb
    struct Thread* new_task_cb = xizi_task_manager.new_task_cb(pmemspace);
    if (UNLIKELY(!new_task_cb)) {
        ERROR("Unable to new task control block.\n");
        free_memspace(pmemspace);
        return -1;
    }
    assert(!IS_DOUBLE_LIST_EMPTY(&pmemspace->thread_list_guard));

    // init params
    struct ThreadStackPointer loaded_sp = load_user_stack(pmemspace, argv);
    if (loaded_sp.stack_idx == -1) {
        ERROR("Uable to load params to memspace.\n");
        /* memspace is freed alone with free_pcb() */
        xizi_task_manager.free_pcb(new_task_cb);
        return -1;
    }

    // init trapframe
    new_task_cb->thread_context.user_stack_idx = loaded_sp.stack_idx;
    new_task_cb->thread_context.uspace_stack_addr = USER_MEM_TOP - ((loaded_sp.stack_idx + 1) * USER_STACK_SIZE);
    new_task_cb->thread_context.ustack_kvaddr = loaded_sp.user_stack_vaddr;
    arch_init_trapframe(new_task_cb->thread_context.trapframe, 0, 0);
    arch_trapframe_set_sp_pc(new_task_cb->thread_context.trapframe, loaded_sp.user_sp, (uintptr_t)entry);
    arch_set_main_params(new_task_cb->thread_context.trapframe, loaded_sp.argc, loaded_sp.user_sp);

    // init thread name
    char* last = NULL;
    for (last = name; *name; name++) {
        if (*name == '/') {
            last = name + 1;
        }
    }
    strncpy(new_task_cb->name, last, sizeof(new_task_cb->name));

    // init pcb schedule attributes
    xizi_task_manager.task_set_default_schedule_attr(new_task_cb);

    return 0;
}