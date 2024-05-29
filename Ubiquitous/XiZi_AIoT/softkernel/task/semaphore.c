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
 * @file semaphore.c
 * @brief semaphore implementation
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2024.05.28
 */

#include "assert.h"
#include "ksemaphore.h"
#include "task.h"

void semaphore_pool_init(struct XiziSemaphorePool* sem_pool)
{
    assert(sem_pool != NULL);
    sem_pool->next_sem_id = 1;
    slab_init(&sem_pool->allocator, sizeof(struct ksemaphore));
    doubleListNodeInit(&sem_pool->sem_list_guard);
}

static inline struct ksemaphore* ksemaphore_get_by_id(struct XiziSemaphorePool* sem_pool, int sem_id)
{
    struct ksemaphore* sem = NULL;
    DOUBLE_LIST_FOR_EACH_ENTRY(sem, &sem_pool->sem_list_guard, sem_list_node)
    {
        if (sem->id == sem_id) {
            break;
        }
    }
    return sem;
}

int ksemaphore_alloc(struct XiziSemaphorePool* sem_pool, int val)
{
    struct ksemaphore* sem = (struct ksemaphore*)slab_alloc(&sem_pool->allocator);
    if (sem == NULL) {
        ERROR("No memeory to alloc new semaphore.\n");
        return -1;
    }

    /* No error down here */
    /* init ksemaphore since here */
    /// @warning sem->id could overflow
    sem->id = sem_pool->next_sem_id++;
    if (UNLIKELY(sem->id == 0)) {
        slab_free(&sem_pool->allocator, sem);
        return -1;
    }
    sem->val = val;
    doubleListNodeInit(&sem->sem_list_node);
    doubleListNodeInit(&sem->wait_list_guard);

    /* list sem to sem_pool */
    doubleListAddOnHead(&sem->sem_list_node, &sem_pool->sem_list_guard);

    return sem->id;
}

bool ksemaphore_wait(struct XiziSemaphorePool* sem_pool, struct Thread* thd, uint32_t sem_id)
{
    assert(thd != NULL);
    assert(thd->state == RUNNING);
    /* find sem */
    struct ksemaphore* sem = ksemaphore_get_by_id(sem_pool, sem_id);
    // invalid sem id
    if (sem == NULL) {
        return false;
    }

    // no need to wait
    if (sem->val > 0) {
        sem->val--;
        return true;
    }

    // waiting at the sem
    sem->val--;
    xizi_task_manager.task_yield_noschedule(thd, false);
    xizi_task_manager.task_block(&sem->wait_list_guard, thd);
    return true;
}

bool ksemaphore_signal(struct XiziSemaphorePool* sem_pool, uint32_t sem_id)
{
    /* find sem */
    struct ksemaphore* sem = ksemaphore_get_by_id(sem_pool, sem_id);
    // invalid sem id
    if (sem == NULL) {
        return false;
    }

    if (sem->val < 0) {
        if (!IS_DOUBLE_LIST_EMPTY(&sem->wait_list_guard)) {
            assert(sem->wait_list_guard.next != NULL);
            xizi_task_manager.task_unblock(CONTAINER_OF(sem->wait_list_guard.next, struct Thread, node));
        }
    }

    sem->val++;
    return true;
}

bool ksemaphore_free(struct XiziSemaphorePool* sem_pool, uint32_t sem_id)
{
    /* find sem */
    struct ksemaphore* sem = ksemaphore_get_by_id(sem_pool, sem_id);
    // invalid sem id
    if (sem == NULL) {
        return false;
    }

    struct Thread* thd = NULL;
    DOUBLE_LIST_FOR_EACH_ENTRY(thd, &sem->wait_list_guard, node)
    {
        assert(thd != NULL);
        xizi_task_manager.task_unblock(thd);
    }

    doubleListDel(&sem->sem_list_node);
    slab_free(&sem_pool->allocator, sem);

    return true;
}
