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
 * @file syscall.h
 * @brief syscall header
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: syscall.h
Description: syscall header
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#pragma once

// clang-format off
#define SYSCALL_TEST            0
#define SYSCALL_SPAWN           1   // generate a brand new task to run elf
#define SYSCALL_EXIT            2   // exit task, delete the task cb
#define SYSCALL_YIELD           3   // yield task, go to scheduler

#define SYSCALL_MMAP            4   // map a virt page to phy page
#define SYSCALL_SERVER          5   // register current task as a server
#define SYSCALL_SESSION         6   // create a session to a server
#define SYSCALL_POLL_SESSION    7   // server poll for it's server sessions
#define SYSCALL_CLOSE_SESSION   8   // client close it's client sessions

#define SYSCALL_EXEC            9   // run elf using current task
#define SYSCALL_SYS_STATE       10  // run system state
#define SYSCALL_REGISTER_IRQ    11  //

#define SYSCALL_KILL            12  // kill the task by id
// clang-format on

#ifndef __ASSEMBLER__
#include <stdint.h>

#include "share_page.h"
#include "task.h"

typedef enum {
    SYS_STATE_TEST = 0,
    SYS_STATE_SET_TASK_PRIORITY,
    SYS_STATE_GET_HEAP_BASE,
    SYS_STATE_MEMBLOCK_INFO,
    SYS_STATE_SHOW_TASKS,
    SYS_STATE_SHOW_MEM_INFO,
    SYS_STATE_SHOW_CPU_INFO,
} sys_state_option;

typedef enum {
    SYS_TASK_YIELD_NO_REASON = 0x0,
    SYS_TASK_YIELD_FOREVER = 0x1,
    SYS_TASK_YIELD_BLOCK_IPC = 0x2,
} task_yield_reason;

typedef union {
    struct {
        uintptr_t memblock_start;
        uintptr_t memblock_end;
    } memblock_info;
    int priority;
} sys_state_info;

/* fn pointer to access user server */
typedef int (*ipc_read_fn)(struct Session* session, int fd, char* dst, int offset, int len);
typedef int (*ipc_write_fn)(struct Session* session, int fd, char* src, int offset, int len);

int syscall(int sys_num, uintptr_t param1, uintptr_t param2, uintptr_t param3, uintptr_t param4);

int sys_spawn(char* img_start, char* name, char** argv);
int sys_exit(struct TaskMicroDescriptor* ptask);
int sys_yield(task_yield_reason reason);
int sys_kill(int id);

int sys_register_as_server(char* name);
int sys_connect_session(char* path, int capacity, struct Session* user_session);
int sys_poll_session(struct Session* userland_session_arr, int arr_capacity);
int sys_close_session(struct TaskMicroDescriptor* task, struct Session* session);

int sys_exec(char* img_start, char* name, char** argv);
int sys_state(sys_state_option option, sys_state_info* info);
int sys_mmap(uintptr_t vaddr, uintptr_t paddr, int len, int is_dev);

int sys_register_irq(int irq_num, int irq_opcode);
int sys_unbind_irq_all(struct TaskMicroDescriptor* task);
int sys_unbind_irq(struct TaskMicroDescriptor* task, int irq_num);
#endif
