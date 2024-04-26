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
 * @file task.h
 * @brief task header
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: task.h
Description: task header
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#pragma once

#include "core.h"

#include "buddy.h"
#include "list.h"
#include "object_allocator.h"
#include "pagetable.h"
#include "share_page.h"
#include "spinlock.h"

#define TASK_CLOCK_TICK 50
#define TASK_MAX_PRIORITY 32
#define TASK_DEFAULT_PRIORITY 2
#define TASK_NAME_MAX_LEN 16

enum ProcState {
    INIT = 0,
    READY,
    RUNNING,
    DEAD,
    BLOCKED,
    NEVER_RUN,
};

/* Thread Control Block */
struct Thread {
    struct TaskMicroDescriptor* task; // process of current thread
    uintptr_t stack_addr; // [virt] stack base address
    struct context* context;
    struct trapframe* trapframe;
};

/* Process Control Block */
struct TaskMicroDescriptor {
    /* task debug resources */
    int pid;
    bool bind_irq;
    bool dead;
    char name[TASK_NAME_MAX_LEN];

    /// @todo support return value
    int ret; // state val that be returned to parent
    /// @todo support parent
    struct TaskMicroDescriptor* parent;

    /* task context resources */
    struct Thread main_thread; // will only access by task itself

    /* task memory resources */
    struct TopLevelPageDirectory pgdir; // [phy] vm pgtbl base address
    uintptr_t heap_base; // mem size of proc used(allocated by kernel)
    /// @todo support heap_base
    uintptr_t mem_size;

    /* task communication resources */
    struct double_list_node cli_sess_listhead;
    struct double_list_node svr_sess_listhead;
    struct KBuddy* massive_ipc_allocator;
    struct TraceTag server_identifier;

    /* task schedule attributes */
    struct double_list_node node;
    enum ProcState state;
    int priority; // priority
    int remain_tick;
    int maxium_tick;
};

struct SchedulerRightGroup {
    struct TraceTag intr_driver_tag;
    struct TraceTag mmu_driver_tag;
};

struct XiziTaskManager {
    struct double_list_node task_list_head[TASK_MAX_PRIORITY]; /* list of task control blocks that are allocated */
    struct slab_allocator task_allocator;
    struct slab_allocator task_buddy_allocator;
    uint32_t next_pid;

    /* init task manager */
    void (*init)();
    /* new a task control block, checkout #sys_spawn for usage */
    struct TaskMicroDescriptor* (*new_task_cb)();
    /* free a task control block, this calls #free_user_pgdir to free all vitual spaces */
    void (*free_pcb)(struct TaskMicroDescriptor*);
    /* init a task control block, set name, remain_tick, state, cwd, priority, etc. */
    void (*task_set_default_schedule_attr)(struct TaskMicroDescriptor*);

    /* use by task_scheduler, find next READY task, should be in locked */
    struct TaskMicroDescriptor* (*next_runnable_task)(void);
    /* function that's runing by kernel thread context, schedule use tasks */
    void (*task_scheduler)(struct SchedulerRightGroup);
    /* call to yield current use task */
    void (*task_yield_noschedule)(struct TaskMicroDescriptor* task, bool is_blocking);
    /* set task priority */
    void (*set_cur_task_priority)(int priority);
};

extern uint32_t ready_task_priority;
extern struct TaskMicroDescriptor* next_task_emergency;
extern struct XiziTaskManager xizi_task_manager;

int spawn_embedded_task(char* img_start, char* name, char** argv);
bool module_task_manager_init(void);
