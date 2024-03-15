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
#include "share_page.h"
#include "syscall.h"
#include "task.h"

extern int task_exec(struct TaskMicroDescriptor* task, char* img_start, char* name, char** argv);
int sys_spawn(char* img_start, char* name, char** argv)
{
    // alloc a new pcb
    struct TaskMicroDescriptor* new_task_cb = xizi_task_manager.new_task_cb();
    if (UNLIKELY(!new_task_cb)) {
        ERROR("Unable to new task control block.\n");
        return -1;
    }
    // init trapframe
    arch_init_trapframe(new_task_cb->main_thread.trapframe, 0, 0);
    if (UNLIKELY(task_exec(new_task_cb, img_start, name, argv)) < 0) {
        xizi_task_manager.free_pcb(new_task_cb);
        return -1;
    }
    // init pcb
    xizi_task_manager.task_set_default_schedule_attr(new_task_cb, RequireRootTag());

    return 0;
}