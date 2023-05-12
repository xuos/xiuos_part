
#ifndef __TASK_H__
#define __TASK_H__

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <stdint.h>
#include <stdbool.h>

// 定义线程状态
typedef enum {
    THREAD_READY,       // 就绪状态
    THREAD_RUNNING,     // 运行状态
    THREAD_BLOCKED,     // 阻塞状态
    THREAD_TERMINATED   // 终止状态
} task_state_t;


// 定义线程控制块（TCB）
typedef struct {
    int id;                     // 任务ID
    int priority;               // 任务优先级
    task_state_t state;         // 任务状态
    uint32_t* stack_ptr;        // 任务堆栈指针
    size_t stack_size;          // 任务堆栈大小
    uint32_t *stack_bottom;     // 任务堆栈底部
    void (*entry_point)(void);  // 任务入口函数
    void *arg;                  // 任务参数
    uint16_t cpu_id;            // 任务所在的CPU ID
} tcb;

// 定义任务调度器
typedef struct {
    int num_cpus;                  // CPU数量
    int num_tasks_per_cpu;         // 每个CPU的任务数量
    tcb **ready_queue;             // 就绪队列
    tcb *current_task;             // 当前正在运行的任务
    uint16_t current_cpu_id;       // 当前CPU的ID
    uint32_t *interrupt_stack_ptr; // 中断堆栈指针
} scheduler_t;

// 初始化任务调度器
scheduler_t *scheduler_init(int num_cpus, int num_tasks_per_cpu);

// 创建任务
int create_task(void (*func)(void *), void *arg, int priority, size_t stack_size);

// 销毁任务
int destroy_task(int task_id);

// 挂起任务
int suspend_task(int task_id);

// 恢复任务
int resume_task(int task_id);

// 调整任务优先级
int set_task_priority(int task_id, int priority);

// 获取当前任务的ID
int get_current_task_id();

// 获取当前CPU的ID
uint16_t get_current_cpu_id;

// 获取任务控制块
tcb *get_task_by_id(int task_id);

// 生成任务ID
int generate_task_id();

// 切换到下一个任务
void switch_to_next_task();

// 添加任务到就绪队列
void add_tcbo_ready_queue(tcb *task);

// 从就绪队列中移除任务
void remove_task_from_ready_queue(tcb *task);

// 初始化任务堆栈
void init_stack(uint32_t *stack_ptr, size_t stack_size, void (*func)(void *), void *arg,tcb* task);

// 空闲任务的入口函数
void idle_task(void *arg);

// 初始化空闲任务
void init_idle_task();
#endif
