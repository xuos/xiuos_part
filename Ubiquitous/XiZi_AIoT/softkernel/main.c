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

#include "trap_common.h"

void configure_cpu(uint32_t cpu)
{
    const unsigned int all_ways = 0xf;

    disable_strict_align_check();

    // Enable branch prediction
    arm_branch_target_cache_invalidate();
    arm_branch_prediction_enable();

    // Enable L1 caches
    // arm_dcache_enable();
    // arm_dcache_invalidate();
    // arm_icache_enable();
    // arm_icache_invalidate();

    // Invalidate SCU copy of TAG RAMs
    scu_secure_invalidate(cpu, all_ways);

    // Join SMP
    scu_join_smp();
    scu_enable_maintenance_broadcast();
}

typedef void (*cpu_entry_point_t)(void* arg);
typedef struct _core_startup_info {
    cpu_entry_point_t entry; //!< Function to call after starting a core.
    void* arg; //!< Argument to pass core entry point.
} core_startup_info_t;
static core_startup_info_t s_core_info[NR_CPU] = { { 0 } };

static void common_cpu_entry(void)
{
    uint32_t myCoreNumber = cpu_get_current();
    core_startup_info_t* info = &s_core_info[myCoreNumber];

    // Call the requested entry point for this CPU number.
    if (info->entry) {
        info->entry(info->arg);
    }
}

extern void _boot_start();
void cpu_start_secondary(uint8_t coreNumber, cpu_entry_point_t entryPoint, void* arg)
{
    // Save entry point and arg.
    s_core_info[coreNumber].entry = entryPoint;
    s_core_info[coreNumber].arg = arg;

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
    }
}

extern uint32_t _binary_init_start[], _binary_default_fs_start[];
static struct TraceTag hardkernel_tag, softkernel_tag;

static bool init = false;
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
        configure_cpu(cpu_id);
        DEBUG_PRINTF("CPU %d started init: %d(at %x).\n", cur_cpuid(), init, &init);
        spinlock_lock(&whole_kernel_lock);
        secondary_cpu_hardkernel_init(cpu_id, &hardkernel_tag);
        spinlock_unlock(&whole_kernel_lock);
        DEBUG_PRINTF("CPU %d started done.\n", cur_cpuid());
    }

    struct TraceTag main_intr_tag;
    AchieveResourceTag(&main_intr_tag, &hardkernel_tag, "intr-ac-resource");
    struct XiziTrapDriver* p_intr_driver = (struct XiziTrapDriver*)AchieveResource(&main_intr_tag);
    p_intr_driver->cpu_irq_disable();

    if (cpu_id == 0) {
        /* init softkernel */
        if (!softkernel_init(&hardkernel_tag, &softkernel_tag)) {
            return -1;
        }
        show_xizi_bar();

        int cpu_count = NR_CPU;
        scu_enable();
        configure_cpu(cpu_id);
        for (int i = 1; i < cpu_count; i++) {
            // start secondary cpus
            cpu_start_secondary(i, NULL, 0);
        }

        /* start first task */
        char* init_task_param[2] = { "/app/init", 0 };
        spawn_embedded_task((char*)_binary_init_start, "init", init_task_param);
        char* fs_server_task_param[2] = { "/app/fs_server", 0 };
        spawn_embedded_task((char*)_binary_default_fs_start, "memfs", fs_server_task_param);

        init = true;
    }
    // p_intr_driver->cpu_irq_disable();

    while (!init)
        ;

    /* start scheduler */
    struct SchedulerRightGroup scheduler_rights;
    assert(AchieveResourceTag(&scheduler_rights.mmu_driver_tag, &hardkernel_tag, "mmu-ac-resource"));
    assert(AchieveResourceTag(&scheduler_rights.intr_driver_tag, &hardkernel_tag, "intr-ac-resource"));
    // while (true) { }
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