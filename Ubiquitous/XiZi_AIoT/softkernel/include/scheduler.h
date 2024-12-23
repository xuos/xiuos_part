
#pragma once
#include "actracer.h"
#include "ksemaphore.h"
#include "rbtree.h"

#define TASK_MAX_PRIORITY 32
#define UNINIT_SNODE_ID 0
typedef uintptr_t snode_id_t;

enum ThreadState {
    INIT = 0,
    READY,
    RUNNING,
    DEAD,
    BLOCKED,
    SLEEPING,
    NEVER_RUN,
    NR_STATE,
};

typedef struct ScheduleContext {
    intptr_t remain_tick;
} ScheduleContext;

typedef struct TaskSleepContext {
    int64_t remain_ms;
} TaskSleepContext;

struct ScheduleNode {
    struct Thread* pthd;
    snode_id_t snode_id;
    enum ThreadState state;

    ScheduleContext sched_context;
    TaskSleepContext sleep_context;
};

struct Scheduler {
    TraceTag tag;
    RbtTree snode_state_pool[NR_STATE];
    struct XiziSemaphorePool semaphore_pool;
};

extern struct Scheduler g_scheduler;

bool init_schedule_node(struct ScheduleNode* snode, struct Thread* bind_thd);

bool task_trans_sched_state(struct ScheduleNode* snode, RbtTree* from_pool, RbtTree* to_pool, enum ThreadState target_state);
void task_block(struct Thread* thd);
void task_dead(struct Thread* thd);
void task_yield(struct Thread* thd);
void task_into_ready(struct Thread* thd);