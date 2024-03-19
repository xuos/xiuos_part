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
/// @todo use hardkernel
#include "cortex_a9.h"
#include "regssrc.h"

#include "kern_init.h"
#include "multicores.h"

#include "assert.h"
#include "task.h"

#include "cache_common_ope.h"

extern uint32_t _binary_init_start[], _binary_default_fs_start[];
static struct TraceTag hardkernel_tag, softkernel_tag;

extern void _boot_start();
void cpu_start_secondary(uint8_t coreNumber)
{
    // Prepare pointers for ROM code. The entry point is always _start, which does some
    // basic preparatory work and then calls the common_cpu_entry function, which itself
    // calls the entry point saved in s_core_info.
    switch (coreNumber) {
    case 1:
        HW_SRC_GPR3_WR((uint32_t)&_boot_start);
        HW_SRC_SCR.B.CORE1_ENABLE = 1;
        break;

    case 2:
        HW_SRC_GPR5_WR((uint32_t)&_boot_start);
        HW_SRC_SCR.B.CORE2_ENABLE = 1;
        break;

    case 3:
        HW_SRC_GPR7_WR((uint32_t)&_boot_start);
        HW_SRC_SCR.B.CORE3_ENABLE = 1;
        break;
    default:
        break;
    }
}

static int core_init_done = 0;
int main(void)
{
    /* init tracer */
    uint32_t cpu_id = cur_cpuid();

    if (cpu_id == 0) {
        tracer_init(); // init tracer system
        // clang-format off
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

        spinlock_init(&whole_kernel_lock, "wklock");
    } else {
        spinlock_lock(&whole_kernel_lock);
        secondary_cpu_hardkernel_init(cpu_id, &hardkernel_tag);
        spinlock_unlock(&whole_kernel_lock);
    }

    spinlock_lock(&whole_kernel_lock);
    if (cpu_id == 0) {
        /* init softkernel */
        if (!softkernel_init(&hardkernel_tag, &softkernel_tag)) {
            return -1;
        }
        show_xizi_bar();

        for (int i = 1; i < NR_CPU; i++) {
            // start secondary cpus
            cpu_start_secondary(i);
        }

        /* start first task */
        char* init_task_param[2] = { "/app/init", 0 };
        spawn_embedded_task((char*)_binary_init_start, "init", init_task_param);
        char* fs_server_task_param[2] = { "/app/fs_server", 0 };
        spawn_embedded_task((char*)_binary_default_fs_start, "memfs", fs_server_task_param);
    }

    /* start scheduler */
    struct SchedulerRightGroup scheduler_rights;
    assert(AchieveResourceTag(&scheduler_rights.mmu_driver_tag, &hardkernel_tag, "mmu-ac-resource"));
    assert(AchieveResourceTag(&scheduler_rights.intr_driver_tag, &hardkernel_tag, "intr-ac-resource"));

    core_init_done |= (1 << cpu_id);
    LOG_PRINTF("CPU %d init done\n", cpu_id);
    spinlock_unlock(&whole_kernel_lock);

    while (core_init_done != (1 << NR_CPU) - 1)
        ;
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