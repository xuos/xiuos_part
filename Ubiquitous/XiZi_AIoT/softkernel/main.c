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
 * @file main.c
 * @brief main
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: main.c
Description: main
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include "kern_init.h"

#include "assert.h"
#include "task.h"

#include "trap_common.h"

extern uint32_t _binary_init_start[], _binary_default_fs_start[];
extern int sys_spawn(char* path, char** argv);
int main(void)
{
    /* init tracer */
    // clang-format off
    tracer_init(); // init tracer system
    struct TraceTag hardkernel_tag, softkernel_tag;
    if (!CreateResourceTag(&hardkernel_tag, RequireRootTag(), "hardkernel", TRACER_OWNER, NULL) || 
        !CreateResourceTag(&softkernel_tag, RequireRootTag(), "softkernel", TRACER_OWNER, NULL)) {
        ERROR("Failed to create hardkernel owner and softkernel owner.\n");
        return -1;
    }
    // clang-format on

    /* init hardkernel */
    if (!hardkernel_init(&hardkernel_tag)) {
        return -1;
    }
    /* init softkernel */
    if (!softkernel_init(&hardkernel_tag, &softkernel_tag)) {
        return -1;
    }
    show_xizi_bar();

    /* start first task */
    char* init_task_param[2] = { "/app/init", 0 };
    spawn_embedded_task((char*)_binary_init_start, "init", init_task_param);
    char* fs_server_task_param[2] = { "/app/fs_server", 0 };
    spawn_embedded_task((char*)_binary_default_fs_start, "memfs", fs_server_task_param);

    /* start scheduler */
    struct SchedulerRightGroup scheduler_rights;
    assert(AchieveResourceTag(&scheduler_rights.mmu_driver_tag, &hardkernel_tag, "mmu-ac-resource"));
    assert(AchieveResourceTag(&scheduler_rights.intr_driver_tag, &hardkernel_tag, "intr-ac-resource"));
    xizi_task_manager.task_scheduler(scheduler_rights);

    // never reached
    return 0;
}

__attribute__((weak)) void _exit(int32_t status)
{
    (void)status;
    while (1) {
        ;
    }
}