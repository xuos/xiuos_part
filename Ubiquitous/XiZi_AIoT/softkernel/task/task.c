#include <task.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <errno.h>

// 创建线程
static pid_t next_pid = 0;

/*******************************************************************************
* 函 数 名: start_thread
* 功能描述: 启动线程
* 形    参: 无
* 返 回 值: 栈指针
*******************************************************************************/
tcb_t *task_create(char *name, int pri, uint32_t stack_size, void (*entry)(void *arg), void *arg) {
    tcb_t *tcb;
    uint32_t stack_top;
    uint32_t kstack_top;
    int r;

    /* 分配任务控制块 */
    tcb = (tcb_t *)malloc(sizeof(tcb_t));
    if (tcb == NULL) {
        return NULL;
    }

    /* 分配任务栈 */
    tcb->stack_size = stack_size;
    tcb->stack_top = (uint32_t)malloc(stack_size);
    if (tcb->stack_top == 0) {
        free(tcb);
        return NULL;
    }

    /* 分配内核栈 */
    tcb->kstack_size = K_STACK_SIZE;
    tcb->kstack_top = (uint32_t)malloc(tcb->kstack_size);
    if (tcb->kstack_top == 0) {
        free((void *)tcb->stack_top);
        free(tcb);
        return NULL;
    }

    /* 初始化任务控制块 */
    tcb->state.flags = 0;
    tcb->state.exit_code = 0;
    tcb->state.trap_type = 0;
    tcb->priority = pri;
    tcb->flags = 0;
    tcb->message_queue.head = NULL;
    tcb->message_queue.tail = NULL;
    tcb->async_flags = 0;
    tcb->cpu_affinity = 0;
    tcb->private = NULL;

    /* 初始化任务上下文 */
    r = setup_context(&tcb->context, (void *)entry, arg, (void *)tcb->stack_top + tcb->stack_size, tcb->kstack_top + tcb->kstack_size);
    if (r != 0) {
        free((void *)tcb->kstack_top);
        free((void *)tcb->stack_top);
        free(tcb);
        return NULL;
    }

    /* 设置任务ID */
    tcb->pid = next_pid++;

    /* 向任务列表中添加任务 */
    r = add_task(tcb);
    if (r != 0) {
        free((void *)tcb->kstack_top);
        free((void *)tcb->stack_top);
        free(tcb);
        return NULL;
    }

    /* 设置任务名称 */
    strncpy(tcb->name, name, TASK_NAME_MAX_LENGTH);

    /* 返回任务控制块 */
    return tcb;
}

void task_destroy(tcb_t *tcb) {
    /* 从任务列表中移除任务 */
    remove_task(tcb);

    /* 释放任务栈和内核栈 */
    free((void *)tcb->stack_top);
    free((void *)tcb->kstack_top);

    /* 释放任务控制块 */
    free(tcb);
}

void task_suspend(tcb_t *tcb) {
    /* 设置任务状态为挂起 */
    task_set_state(tcb, TASK_STATE_SUSPENDED);

    /* 将任务从调度队列中移除 */
    remove_from_schedule_queue(tcb);
}

void task_resume(tcb_t *tcb) {
    /* 设置任务状态为就绪 */
    task_set_state(tcb, TASK_STATE_READY);

    /* 将任务添加到调度队列中 */
    add_to_schedule_queue(tcb);
}

void task_delay(uint32_t ticks) {
    tcb_t *tcb;

    /* 获取当前任务的控制块 */
    tcb = get_current_task();

    /* 设置任务的延迟计数器 */
    tcb->delay_ticks = ticks;

    /* 将任务从调度队列中移除 */
    remove_from_schedule_queue(tcb);

    /* 将任务添加到延迟队列中 */
    add_to_delay_queue(tcb);
}

void task_notify_async(tcb_t *tcb, int flags) {
    /* 设置任务的异步通知标志 */
    tcb->async_flags |= flags;

    /* 将该任务添加到等待列表中 */
    add_to_wait_queue(tcb, flags);
}

int task_wait_async(int flags) {
    tcb_t *tcb;

    /* 获取当前任务的控制块 */
    tcb = get_current_task();

    /* 设置任务的等待标志 */
    tcb->wait_flags = flags;

    /* 将当前任务从调度队列中移除 */
    remove_from_schedule_queue(tcb);

    /* 将当前任务添加到等待列表中 */
    add_to_wait_queue(tcb, flags);

    /* 切换到下一个任务 */
    switch_to_next_task();

    /* 被唤醒后，返回当前任务的异步通知标志 */
    return tcb->async_flags;
}


int task_send_msg(tcb_t *tcb, void *msg, int len) {
    int ret = 0;
    msg_t *new_msg;

    /* 如果目标任务的消息队列已满，则返回错误码 */
    if (is_msg_queue_full(tcb)) {
        return -1;
    }

    /* 分配新的消息结构体 */
    new_msg = alloc_msg(msg, len);
    if (new_msg == NULL) {
        return -1;
    }

    /* 将新的消息添加到目标任务的消息队列中 */
    add_msg_to_queue(tcb, new_msg);

    /* 如果目标任务正在等待消息，则唤醒该任务 */
    if (is_waiting_for_msg(tcb)) {
        wake_up_task(tcb);
    }

    return ret;
}


int task_recv_msg(void *msg, int len) {
    int ret = 0;
    msg_t *recv_msg;

    /* 如果当前任务的消息队列为空，则挂起当前任务 */
    if (is_msg_queue_empty()) {
        wait_for_msg();
    }

    /* 从消息队列中取出一条消息 */
    recv_msg = get_msg_from_queue();
    if (recv_msg == NULL) {
        return -1;
    }

    /* 如果消息的长度大于接收缓冲区的长度，则返回错误码 */
    if (recv_msg->len > len) {
        ret = -1;
    } else {
        /* 复制消息的内容到接收缓冲区中 */
        memcpy(msg, recv_msg->data, recv_msg->len);
    }

    /* 释放消息结构体 */
    free_msg(recv_msg);

    return ret;
}

tcb_t *task_get_current_tcb(void) {
    tcb_t *tcb;

    /* 获取当前任务的堆栈指针 */
    void *sp = get_current_sp();

    /* 从任务列表中查找与当前堆栈指针对应的控制块 */
    for (int i = 0; i < NUM_TASKS; i++) {
        tcb = &task_list[i];
        if (tcb->sp == sp) {
            return tcb;
        }
    }

    /* 如果没有找到对应的控制块，则返回空指针 */
    return NULL;
}

pid_t task_get_pid(tcb_t *tcb) {
    return tcb->pid;
}

int task_get_priority(tcb_t *tcb) {
    return tcb->priority;
}

void task_set_priority(tcb_t *tcb, int pri) {
    /* 确保优先级的值在合法范围内 */
    if (pri < MIN_PRIORITY) {
        pri = MIN_PRIORITY;
    } else if (pri > MAX_PRIORITY) {
        pri = MAX_PRIORITY;
    }

    /* 设置任务的优先级 */
    tcb->priority = pri;
}

int task_get_state(tcb_t *tcb) {
    return tcb->state;
}

void task_set_state(tcb_t *tcb, int state) {
    /* 确保状态的值在合法范围内 */
    if (state < TASK_STATE_CREATED || state > TASK_STATE_TERMINATED) {
        return;
    }

    /* 设置任务的状态 */
    tcb->state = state;
}

int task_get_async_flags(tcb_t *tcb) {
    return tcb->async_flags;
}

void task_set_async_flags(tcb_t *tcb, int flags) {
    /* 设置任务的异步事件标志 */
    tcb->async_flags = flags;
}

uint32_t task_get_time_quantum(tcb_t *tcb) {
    return tcb->time_quantum;
}

void task_set_time_quantum(tcb_t *tcb, uint32_t quantum) {
    /* 确保时间片大小的值在合法范围内 */
    if (quantum < MIN_TIME_QUANTUM) {
        quantum = MIN_TIME_QUANTUM;
    } else if (quantum > MAX_TIME_QUANTUM) {
        quantum = MAX_TIME_QUANTUM;
    }

    /* 设置任务的时间片大小 */
    tcb->time_quantum = quantum;
}

uint32_t task_get_stack_size(tcb_t *tcb) {
    return tcb->stack_size;
}

void *task_get_stack_top(tcb_t *tcb) {
    return tcb->stack_top;
}

uint32_t task_get_cpu_affinity(tcb_t *tcb) {
    return tcb->cpu_affinity;
}

void task_set_cpu_affinity(tcb_t *tcb, uint32_t affinity) {
    /* 设置任务的CPU亲和性 */
    tcb->cpu_affinity = affinity;
}

