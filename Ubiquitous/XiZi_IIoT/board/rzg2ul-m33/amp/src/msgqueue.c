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

#include "../include/msgqueue.h"

#if PLATFORM_CHOICE == PLATFORM_LINUX_USER || PLATFORM_CHOICE == PLATFORM_RTOS_XIUOS
static int32_t msg_queue_mutex_init(struct MsgQueueMutex* mutex, uint16_t msg_queue_buf_size)
{
    /* 是否已经被初始化过了 */
    if (atomic_load(&mutex->mutex_init_mark) == INIT_MARK_INITIALIZED)
    {
        LOGINFO("msg_queue_mutex_init_info: mutex init before\n");
        return 0;
    }

    uint32_t expected_mark = INIT_MARK_RAW_STATE; /* 期望该互斥体还未被初始化 */
    uint32_t aim_mark = INIT_MARK_INITIALIZING;   /* 期望将其切换为初始化中 */
    
    /* 尝试获取互斥体的初始化权 */
    if (!atomic_compare_exchange_strong(&mutex->mutex_init_mark, &expected_mark, aim_mark))
    {
        /* 当前互斥体的状态不是初始状态 */
        while (1)
        {
            uint32_t now_mark = atomic_load(&mutex->mutex_init_mark);

            LOGINFO("msg_queue_mutex_init_info: now_mark = %u\n",now_mark);

            if (now_mark == INIT_MARK_INITIALIZING) /* 其他任务正在初始化：等待 */
            {
                LOGINFO("msg_queue_mutex_init_info: waiting others task init over\n");
            }
            else if (now_mark == INIT_MARK_INITIALIZED) /* 其他任务已经初始化完毕 */
            {
                LOGINFO("msg_queue_mutex_init_info: mutex init by others\n");
                return 0;
            }
            else if (now_mark == INIT_MARK_DESTORYED) /* 互斥体初始化失败 */
            {
                INFOS("msg_queue_mutex_init_error: mutex init fail by others before\n");
                return -1;
            }
            else /* 其他原因导致标志位损坏或未被初始化 */
            {
                INFOS("msg_queue_mutex_init_error: unknown init mark\n");
                return -1;
            }
        }
    }

    /* 获取到了互斥体的初始化权 */
    atomic_store(&mutex->msg_queue_mark,MSG_QUEUE_MARK_IDLE); /* 目标核心空闲 */

    mutex->msg_wait_cnt = 0U; /* 待处理消息队列为空 */

    /* 初始化相关的锁 */
    byte_flag_ops.init(&mutex->empty_lock);
    byte_flag_ops.init(&mutex->wait_lock);

    /* 互斥体初始化完毕 */
    atomic_store(&mutex->mutex_init_mark, INIT_MARK_INITIALIZED);

    LOGINFO("msg_queue_mutex_init_info: mutex init success by this task\n");

    return 0;
}

int32_t msg_queue_mutex_is_init(struct MsgQueueMutex* mutex)
{
    return atomic_load(&mutex->mutex_init_mark) == INIT_MARK_INITIALIZED ? 0 : -1;
}

struct MsgQueueMutexOps msg_queue_mutex_ops = 
{
    .mutex_init = msg_queue_mutex_init,
    .mutex_is_init = msg_queue_mutex_is_init
};
#endif /* PLATFORM_CHOICE == PLATFORM_LINUX_USER || PLATFORM_CHOICE == PLATFORM_RTOS_XIUOS */

#if PLATFORM_CHOICE == PLATFORM_LINUX_KERNEL || PLATFORM_CHOICE == PLATFORM_RTOS_XIUOS
static int32_t msg_queue_init(struct AmpMsgQueue* msg_queue,uint32_t mem_len) 
{   
    int i;

    /* 相关结构空间大小计算*/
    uint32_t infos_length = sizeof(struct AmpMsgQueue);
    uint32_t buf_length = sizeof(struct MsgEntry);

    if (mem_len < infos_length + buf_length) /* 消息队列至少要可以放入一个消息 */
    {
        INFOS("msg_queue_init_error: memmory size too small = %u, at least = %u\n", mem_len, buf_length + infos_length);
        return -1;
    }

    uint32_t buf_size = (mem_len - infos_length) / buf_length; /* 计算可用的消息个数 */

    if (buf_size > MSG_QUEUE_MAX_ENTRY_CNT)
    {
        INFOS("msg_queue_init_error: too much msg entry size = %u, max = %u\n", buf_size, MSG_QUEUE_MAX_ENTRY_CNT);
        return -1;
    }
    
    msg_queue->empty_h = 0; /* 初始时全部缓冲区空闲 */
    for (i = 0; i < buf_size; i++) /* 将空闲缓冲区链接为链表 */
    {
        msg_queue->entries[i].cur_idx = i;
        msg_queue->entries[i].nxt_idx = i + 1;
    }

    msg_queue->wait_h = buf_size;     /* 待处理消息队列为空 */
    msg_queue->proc_ing_h = buf_size; /* 正在处理的消息队列为空 */

    msg_queue->buf_size = buf_size; /* 标记该消息队列可用 */
    
    LOGINFO("buffer_queue_init_success: mem_len = %u, infos_length = %u, buf_length = %u, buf_size = %u, unused = %u\n",
	    mem_len, infos_length, buf_length, buf_size,
	    mem_len - infos_length - buf_length * buf_size);

    return 0;
}
#endif /* PLATFORM_CHOICE == PLATFORM_LINUX_KERNEL || PLATFORM_CHOICE == PLATFORM_RTOS_XIUOS */

static int32_t msg_queue_is_ready(struct AmpMsgQueue* msg_queue)
{
    LOGINFO("msg_queue_is_ready_info: enter mark = %u\n",msg_queue->working_mark);

    return msg_queue->working_mark == INIT_MARK_INITIALIZED ? 0 : -1;
}

static uint16_t msg_queue_pop(struct AmpMsgQueue* msg_queue,uint16_t* head)
{
    uint16_t ret = msg_queue->buf_size;

    if (*head >= msg_queue->buf_size) /* 链空 */
    {
        LOGINFO("msg_queue_pop_warn: have no more msg, end = %u\n",*head);
        return ret;
    }
    
    ret = *head;
    *head = msg_queue->entries[*head].nxt_idx;
    msg_queue->entries[ret].nxt_idx = msg_queue->buf_size; /* 摘链 */

    LOGINFO("msg_queue_pop_success: pop msg index = %u\n",ret);

    return ret;
}

static int32_t msg_queue_push(struct AmpMsgQueue* msg_queue,uint16_t* head,uint16_t msg_index)
{
    if (msg_index >= msg_queue->buf_size)
    {
        INFOS("msg_queue_push_error: msg index error = %u\n",msg_index);
        return -1;
    }
    
    if (*head == msg_queue->buf_size) /* 链表为空 */
    {
        *head = msg_index;
        msg_queue->entries[msg_index].nxt_idx = msg_queue->buf_size; /* 防止意外链接 */
    }
    else /* 链表非空 */
    {
        msg_queue->entries[msg_index].nxt_idx = *head; /* 头插法：相当于压栈 */
        *head = msg_index;
    }
    
    LOGINFO("msg_queue_push_success: msg index = %u\n",msg_index);

    return 0;
}

static int32_t msg_queue_transfer(struct AmpMsgQueue* msg_queue, uint16_t* from_head, uint16_t* to_head)
{
    if (*from_head >= msg_queue->buf_size)
    {
        INFOS("msg_queue_transfer_error: from_head error = %u\n",*from_head);
        return -1;
    }
    
    LOGINFO("msg_queue_transfer_info: from_head = %u, to_head = %u\n",*from_head, *to_head);

    *to_head = *from_head;
    *from_head = msg_queue->buf_size;

    return 0;
}

struct MsgQueueOps msg_queue_ops = 
{
#if PLATFORM_CHOICE == PLATFORM_LINUX_KERNEL || PLATFORM_CHOICE == PLATFORM_RTOS_XIUOS
    .init = msg_queue_init,
#endif /* PLATFORM_CHOICE == PLATFORM_LINUX_KERNEL || PLATFORM_CHOICE == PLATFORM_RTOS_XIUOS */
    .is_ready = msg_queue_is_ready,
    .pop = msg_queue_pop,
    .push = msg_queue_push,
    .transfer = msg_queue_transfer
};