
#ifndef __TASK_H__
#define __TASK_H__

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

typedef uint16_t pid_t;
#define TASK_NAME_MAX_LENGTH 256

#define MAX_PRIORITY 512
#define MIN_PRIORITY  1
#define MIN_TIME_QUANTUM 10 /* 最小时间片大小为10毫秒 */
#define MAX_TIME_QUANTUM 100 /* 最大时间片大小为100毫秒 */


// 线程状态
typedef enum thread_state {
    TASK_STATE_CREATED,           // 线程已创建，但未启动
    TASK_STATE_READY,            // 线程就绪
    TASK_STATE_RUNNING,         // 线程正在运行
    TASK_STATE_BLOCKED,         // 线程被阻塞（等待某些事件的发生）
    TASK_STATE_WAITING,         // 线程正在休眠（等待一段时间后被唤醒）
    TASK_STATE_SUSPENDED,       // 线程被挂起（暂停执行）
    TASK_STATE_TERMINATED       // 线程已终止
} task_state;

typedef struct {
    /* 通用寄存器 */
    uint32_t ebx;
    uint32_t ecx;
    uint32_t edx;
    uint32_t esi;
    uint32_t edi;
    uint32_t ebp;

    /* 返回地址 */
    uint32_t eip;

    /* 特权级 */
    uint32_t cs;
    uint32_t eflags;
}context;

typedef struct {
    /* 消息类型 */
    uint8_t m_type;

    /* 发送者的PID */
    pid_t m_sender;

    /* 消息数据 */
    uint8_t m_data[512];
} message_t;

typedef struct {
    /* 消息队列长度 */
    uint16_t count;

    /* 队列头指针 */
    void* front;

    /* 队列尾指针 */
    void* rear;

    /* 消息队列缓冲区 */
    message_t *buffer;
}message_queue;


typedef struct {
    /* 队列头指针 */
    tcb_t *head;

    /* 队列尾指针 */
    tcb_t *tail;
}task_list;

typedef struct{
    /* 端点ID */
    uint16_t id;

    /* 端点状态 */
    uint32_t flags;

    /* 发送队列 */
    message_queue send_queue;

    /* 接收队列 */
    message_queue recv_queue;

    /* 端点等待队列 */
    task_list waiting;
}endpoint;

typedef struct tcb {
    /* 任务ID */
    pid_t pid;

    /* 任务状态 */
    task_state state;

    /* 任务优先级 */
    uint16_t priority;

    /* 任务类型 */
    uint16_t flags;

    /* 任务的延迟计数器 */
    uint16_t delay_ticks;

    /* 任务栈顶指针 */
    uint32_t stack_top;

    /* 任务栈大小 */
    uint16_t stack_size;

    /* 内核栈顶指针 */
    uint32_t kstack_top;

    /* 内核栈大小 */
    uint16_t kstack_size;

    /* 任务上下文 */
    context context;

    /* 消息队列 */
    message_queue message_queue;

    /* 关联的端点 */
    endpoint *endpoint;

    /* 异步通知标志 */
    unsigned int async_flags;

    /* 任务的CPU亲和力 */
    unsigned int cpu_affinity;

    /* 任务的私有数据 */
    void* private;
} tcb_t;



/* 创建任务 */
tcb_t *task_create(char *name, int pri, uint32_t stack_size, void (*entry)(void *arg), void *arg);

/* 销毁任务 */
void task_destroy(tcb_t *tcb);

/* 暂停任务 */
void task_suspend(tcb_t *tcb);

/* 恢复任务 */
void task_resume(tcb_t *tcb);

/* 延时 */
void task_delay(uint32_t ticks);

/* 异步通知 */
void task_notify_async(tcb_t *tcb, int flags);

/* 等待异步通知 */
int task_wait_async(int flags);

/* 发送消息 */
int task_send_msg(tcb_t *tcb, void *msg, int len);

/* 接收消息 */
int task_recv_msg(void *msg, int len);

/* 获取当前任务的TCB */
tcb_t *task_get_current_tcb(void);

/* 获取任务ID */
pid_t task_get_pid(tcb_t *tcb);

/* 获取任务优先级 */
int task_get_priority(tcb_t *tcb);

/* 设置任务优先级 */
void task_set_priority(tcb_t *tcb, int pri);

/* 获取任务状态 */
int task_get_state(tcb_t *tcb);

/* 设置任务状态 */
void task_set_state(tcb_t *tcb, int state);

/* 获取任务的异步通知标志 */
int task_get_async_flags(tcb_t *tcb);

/* 设置任务的异步通知标志 */
void task_set_async_flags(tcb_t *tcb, int flags);

/* 获取任务的时间片大小 */
uint32_t task_get_time_quantum(tcb_t *tcb);

/* 设置任务的时间片大小 */
void task_set_time_quantum(tcb_t *tcb, uint32_t quantum);

/* 获取任务的栈大小 */
uint32_t task_get_stack_size(tcb_t *tcb);

/* 获取任务的栈顶指针 */
void *task_get_stack_top(tcb_t *tcb);

/* 获取任务的CPU亲和力 */
uint32_t task_get_cpu_affinity(tcb_t *tcb);

/* 设置任务的CPU亲和力 */
void task_set_cpu_affinity(tcb_t *tcb, uint32_t affinity);

#endif
