
#pragma once
#include "actracer.h"
#include "ksemaphore.h"

#define TASK_MAX_PRIORITY 32

struct ScheduleNode {
    TraceTag task_ref;
    struct double_list_node list_node;
};

struct Scheduler {
    TraceTag tag;

    struct double_list_node task_list_head[TASK_MAX_PRIORITY]; /* list of task control blocks that are allocated */
    struct double_list_node task_running_list_head;
    struct double_list_node task_blocked_list_head;
    struct double_list_node task_sleep_list_head;
    struct XiziSemaphorePool semaphore_pool;
};