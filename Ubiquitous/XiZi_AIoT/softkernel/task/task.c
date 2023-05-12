#include <task.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <errno.h>

#define DEF_STACK_SIZE (128 * 1024)
// 定义全局的任务调度器
scheduler_t *scheduler;

/*******************************************************************************
* 函 数 名: scheduler_init
* 功能描述: 初始化任务调度器
* 形    参: num_cpus:cpu个数,num_tasks_per_cpu:每个CPU的任务数量
* 返 回 值: 任务调度器结构体指针
*******************************************************************************/
scheduler_t *scheduler_init(int num_cpus, int num_tasks_per_cpu) {
    // 分配并初始化任务调度器
    scheduler = malloc(sizeof(scheduler_t));
    scheduler->num_cpus = num_cpus;
    scheduler->num_tasks_per_cpu = num_tasks_per_cpu;
    scheduler->ready_queue = malloc(sizeof(task_t*) * num_cpus * num_tasks_per_cpu);
    scheduler->interrupt_stack_ptr = NULL;
    for (int i = 0; i < num_cpus * num_tasks_per_cpu; i++) {
        scheduler->ready_queue[i] = NULL;
    }
    scheduler->current_task = NULL;
    scheduler->current_cpu_id = 0;
    return scheduler;
}


/*******************************************************************************
* 函 数 名: create_task
* 功能描述: 创建任务
* 形    参: func:任务入口函数,arg:入口函数参数指针,
            priority:任务优先级,stack_size:栈大小
* 返 回 值: 任务的id
*******************************************************************************/
int create_task(void (*func)(void *), void *arg, int priority, size_t stack_size) {
    // 分配并初始化任务控制块
    tcb *task = malloc(sizeof(tcb));
    task->id = generate_task_id();
    task->priority = priority;
    task->state = THREAD_READY;
    task->stack_size = stack_size;
    task->stack_bottom = malloc(stack_size);
    task->stack_ptr = (uint32_t*)(task->stack_bottom + stack_size / sizeof(uint32_t));
    task->entry_point = func;
    task->arg = arg;
    task->cpu_id = get_current_cpu_id();
    // 初始化任务堆栈
    init_stack(task->stack_ptr, stack_size, func, arg,task);
    // 添加任务到就绪队列
    add_task_to_ready_queue(task);
    return task->id;
}


/*******************************************************************************
* 函 数 名: destroy_task
* 功能描述: 销毁任务
* 形    参: task_id:任务的id
* 返 回 值: 销毁成功返回0
*******************************************************************************/
int destroy_task(int task_id) {
    // 获取要销毁的任务控制块
    tcb *task = get_task_by_id(task_id);
    if (task == NULL) {
        return -1;
    }
    if (task->state == TASK_RUNNING) {
        // 如果要销毁的任务正在运行，则直接切换到下一个任务
        switch_to_next_task();
    }
    // 从就绪队列中移除任务
    remove_task_from_ready_queue(task);
    // 释放任务堆栈
    free(task->stack_bottom);
    // 释放任务控制块
    free(task);
    return 0;
}


/*******************************************************************************
* 函 数 名: suspend_task
* 功能描述: 挂起任务
* 形    参: task_id:任务的id
* 返 回 值: 挂起成功返回0
*******************************************************************************/
int suspend_task(int task_id) {
    // 获取要挂起的任务控制块
    tcb *task = get_task_by_id(task_id);
    if (task == NULL) {
        return -1;
    }
    if (task->state == TASK_RUNNING) {
        // 如果要挂起的任务正在运行，则切换到下一个任务
        switch_to_next_task();
    }
    // 修改任务状态为阻塞状态
    task->state = TASK_BLOCKED;
    return 0;
}


/*******************************************************************************
* 函 数 名: resume_task
* 功能描述: 恢复任务
* 形    参: task_id:任务的id
* 返 回 值: 恢复成功返回0
*******************************************************************************/
int resume_task(int task_id) {
    // 获取要恢复的任务控制块
    tcb *task = get_task_by_id(task_id);
    if (task == NULL) {
        return -1;
    }
    if (task->state != TASK_BLOCKED) {
        // 如果要恢复的任务不是阻塞状态，则直接返回
        return -1;
    }
    // 修改任务状态为就绪状态
    task->state = task_READY;
    // 添加任务到就绪队列
    add_task_to_ready_queue(task);
    return 0;
}


/*******************************************************************************
* 函 数 名: set_task_priority
* 功能描述: 调整任务优先级
* 形    参: task_id:任务的id，priority:要调整的优先级
* 返 回 值: 销毁成功返回0
*******************************************************************************/
int set_task_priority(int task_id, int priority) {
    // 获取要调整优先级的任务控制块
    tcb *task = get_task_by_id(task_id);
    if (task == NULL) {
        return -1;
    }
    // 修改任务优先级
    task->priority = priority;
    return 0;
}

/*******************************************************************************
* 函 数 名: get_current_task_id
* 功能描述: 获取当前任务的ID
* 形    参: 无
* 返 回 值: 获取成功返回0
*******************************************************************************/
int get_current_task_id() {
    if (scheduler->current_task == NULL) {
        return -1;
    }
    return scheduler->current_task->id;
}


/*******************************************************************************
* 函 数 名: get_current_cpu_id
* 功能描述: 获取当前CPU的ID
* 形    参: 无
* 返 回 值: 获取到的当前CPU的ID
* 说    名: 不同的处理器获取方式不同,这里以ARM-A9系列芯片为例
*******************************************************************************/
uint16_t get_current_cpu_id() {
    uint32_t mpidr;
    asm volatile ("mrc p15, 0, %0, c0, c0, 5" : "=r" (mpidr));
    return mpidr & 0xff;
}


/*******************************************************************************
* 函 数 名: get_task_by_id
* 功能描述: 通过任务ID获取任务控制块
* 形    参: task_id:任务的id
* 返 回 值: 获取到的任务控制块的指针
*******************************************************************************/
tcb *get_task_by_id(int task_id) {
    // 遍历就绪队列和当前任务，寻找任务控制块
    for (int i = 0; i < scheduler->num_cpus * scheduler->num_tasks_per_cpu; i++) {
        tcb *task = scheduler->ready_queue[i];
        if (task != NULL && task->id == task_id) {
            return task;
        }
    }
    tcb *task = scheduler->current_task;
    if (task != NULL && task->id == task_id) {
        return task;
    }
    return NULL;
}


/*******************************************************************************
* 函 数 名: generate_task_id
* 功能描述: 生成任务ID
* 形    参: 无
* 返 回 值: 生成的任务ID
*******************************************************************************/
int generate_task_id() {
    static int next_task_id = 1;     // 静态变量，记录下一个可用的任务ID
    int task_id = next_task_id++;  // 生成任务ID，并将next_task_id加1
    return task_id;
}


/*******************************************************************************
* 函 数 名: switch_to_next_task
* 功能描述: 切换到下一个任务
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
void switch_to_next_task() {
    // 保存当前任务的上下文
    // TODO: 保存当前任务的上下文
    // 从就绪队列中取出下一个任务
    task_t *next_task = NULL;
    for (int i = scheduler->current_cpu_id * scheduler->num_tasks_per_cpu; i < (scheduler->current_cpu_id + 1) * scheduler->num_tasks_per_cpu; i++) {
        task_t *task = scheduler->ready_queue[i];
        if (task != NULL && (next_task == NULL ||task->priority > next_task->priority)) {
            next_task = task;
        }
    }
    if (next_task == NULL) {
        // 如果就绪队列为空，则切换到空闲任务
        // TODO: 切换到空闲任务
    } else {
        // 切换到下一个任务
        scheduler->current_task = next_task;
        scheduler->current_task->state = TASK_RUNNING;
        // TODO: 恢复下一个任务的上下文
    }
}


/*******************************************************************************
* 函 数 名: add_task_to_ready_queue
* 功能描述: 添加任务到就绪队列
* 形    参: task:任务控制块的指针
* 返 回 值: 无
*******************************************************************************/
void add_task_to_ready_queue(task_t *task) {
    // 找到任务所在的CPU的就绪队列
    int cpu_id = task->cpu_id;
    int start_index = cpu_id * scheduler->num_tasks_per_cpu;
    int end_index = (cpu_id + 1) * scheduler->num_tasks_per_cpu;
    // 找到一个空闲的位置插入任务
    for (int i = start_index; i < end_index; i++) {
        if (scheduler->ready_queue[i] == NULL) {
            scheduler->ready_queue[i] = task;
            return;
        }
    }
    // 如果没有空闲的位置，则替换掉优先级最低的任务
    task_t *lowest_priority_task = NULL;
    int lowest_priority = 0;
    for (int i = start_index; i < end_index; i++) {
        task_t *t = scheduler->ready_queue[i];
        if (t != NULL && (lowest_priority_task == NULL || t->priority < lowest_priority)) {
            lowest_priority_task = t;
            lowest_priority = t->priority;
        }
    }
    scheduler->ready_queue[lowest_priority_task - scheduler->ready_queue] = task;
}


/*******************************************************************************
* 函 数 名: remove_task_from_ready_queue
* 功能描述: 从就绪队列中移除任务
* 形    参: task:任务控制块的指针
* 返 回 值: 无
*******************************************************************************/
void remove_task_from_ready_queue(task_t *task) {
    // 找到任务所在的CPU的就绪队列
    int cpu_id = task->cpu_id;
    int start_index = cpu_id * scheduler->num_tasks_per_cpu;
    int end_index = (cpu_id + 1) * scheduler->num_tasks_per_cpu;
    // 从就绪队列中移除任务
    for (int i = start_index; i < end_index; i++) {
        if (scheduler->ready_queue[i] == task) {
            scheduler->ready_queue[i] = NULL;
            return;
        }
    }
}


/*******************************************************************************
* 函 数 名: init_stack
* 功能描述: 初始化任务堆栈
* 形    参: stack_ptr:任务堆栈指针,stack_size:堆栈大小
            func:入口函数的指针,arg:入口函数的参数指针
            task:任务控制块指针
* 返 回 值: 无
*******************************************************************************/
void init_stack(uint32_t *stack_ptr, size_t stack_size, void (*func)(void *), void *arg,tcb* task) {
    // 计算堆栈底部指针
    uint32_t *stack_bottom = stack_ptr - stack_size / sizeof(uint32_t);
    // 将任务参数压入堆栈中
    *(--stack_ptr) = (uint32_t)arg;
    // 将任务入口函数压入堆栈中
    *(--stack_ptr) = (uint32_t)func;
    // 设置堆栈指针和堆栈底部指针
    task->stack_ptr = stack_ptr;
    task->stack_bottom = stack_bottom;
}


/*******************************************************************************
* 函 数 名: idle_task
* 功能描述: 空闲任务的入口函数
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
void idle_task(void *arg) {
    while (1) {
        // 休眠等待，直到接收到调度器的唤醒信号
        asm volatile ("wfi");
    }
}

/*******************************************************************************
* 函 数 名: init_idle_task
* 功能描述: 初始化空闲任务
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
void init_idle_task() {
    // 创建空闲任务的TCB
    tcb *task = (tcb *)malloc(sizeof(tcb));
    memset(task, 0, sizeof(tcb));
    task->state = task_READY;
    task->priority = 0;
    task->cpu_id = get_current_cpu_id();
    task->task_id = generate_task_id();
    // 初始化空闲任务的堆栈
    uint32_t *stack_ptr = (uint32_t *)malloc(DEF_STACK_SIZE);
    memset(stack_ptr, 0, DEF_STACK_SIZE);
    init_stack(stack_ptr + DEF_STACK_SIZE / sizeof(uint32_t), DEF_STACK_SIZE, idle_task, NULL,task);
    task->stack_ptr = stack_ptr + DEF_STACK_SIZE / sizeof(uint32_t) - 1;
    task->stack_bottom = stack_ptr;
    // 将空闲任务添加到就绪队列中
    add_tcbo_ready_queue(task);
}