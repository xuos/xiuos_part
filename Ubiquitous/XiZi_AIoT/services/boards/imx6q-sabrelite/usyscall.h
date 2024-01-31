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
#pragma once
#include <stdint.h>

#include "libserial.h"
#include "session.h"

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
// clang-format on

typedef enum {
    SYS_STATE_TEST = 0,
    SYS_STATE_MEMBLOCK_INFO,
    SYS_STATE_SET_TASK_PRIORITY,
    SYS_STATE_SHOW_TASKS,
    SYS_STATE_SHOW_MEM_INFO,
    SYS_STATE_SHOW_CPU_INFO,
} sys_state_option;

typedef union {
    struct {
        uintptr_t memblock_start;
        uintptr_t memblock_end;
    } memblock_info;
    int priority;
} sys_state_info;

typedef int (*ipc_read_fn)(struct Session* session, int fd, char* dst, int offset, int len);
typedef int (*ipc_write_fn)(struct Session* session, int fd, char* src, int offset, int len);

struct KernReadTool {
    struct Session* session;
    int fd;
    ipc_read_fn ipc_read;
};

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, char* name, char** argv);
int exit();
int yield();
int register_server(char* name);
int session(char* path, int capacity, struct Session* user_session);
int poll_session(struct Session* userland_session_arr, int arr_capacity);
int close_session(struct Session* session);
int get_memblock_info(sys_state_info* info);
int set_priority(sys_state_info* info);
int show_task();
int show_mem();
int show_cpu();
int mmap(int vaddr, int paddr, int len, bool is_dev);
int register_irq(int irq, int opcode);