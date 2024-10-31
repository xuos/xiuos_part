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
    sem_pool->next_sem_id = INVALID_SEM_ID + 1;
    slab_init(&sem_pool->allocator, sizeof(struct ksemaphore));
    doubleListNodeInit(&sem_pool->sem_list_guard);
    rbtree_init(&sem_pool->sem_pool_map);
    sem_pool->nr_sem = 0;
}

static inline struct ksemaphore* ksemaphore_get_by_id(struct XiziSemaphorePool* sem_pool, sem_id_t sem_id)
{
    RbtNode* target_sem_node = rbt_search(&sem_pool->sem_pool_map, sem_id);
    if (target_sem_node == NULL) {
        return NULL;
    }
    return (struct ksemaphore*)target_sem_node->data;
}

sem_id_t ksemaphore_alloc(struct XiziSemaphorePool* sem_pool, sem_val_t val)
{
    struct ksemaphore* sem = (struct ksemaphore*)slab_alloc(&sem_pool->allocator);
    if (sem == NULL) {
        ERROR("No memeory to alloc new semaphore.\n");
        return INVALID_SEM_ID;
    }

    /* No error down here */
    /* init ksemaphore since here */
    /// @warning sem->id could overflow
    sem->id = sem_pool->next_sem_id++;
    if (UNLIKELY(sem->id == 0)) {
        slab_free(&sem_pool->allocator, sem);
        return INVALID_SEM_ID;
    }
    sem->val = val;
    doubleListNodeInit(&sem->sem_list_node);
    doubleListNodeInit(&sem->wait_list_guard);

    rbt_insert(&sem_pool->sem_pool_map, sem->id, sem);
    doubleListAddOnHead(&sem->sem_list_node, &sem_pool->sem_list_guard);
    sem_pool->nr_sem++;

    return sem->id;
}

bool ksemaphore_consume(struct XiziSemaphorePool* sem_pool, sem_id_t sem_id, sem_val_t decre)
{
    struct ksemaphore* sem = ksemaphore_get_by_id(sem_pool, sem_id);
    // invalid sem id
    if (sem == NULL) {
        return false;
    }

    // if (decre >= 0) {
    sem->val -= decre;
    // }
    return true;
}

bool ksemaphore_wait(struct XiziSemaphorePool* sem_pool, struct Thread* thd, sem_id_t sem_id)
{
    assert(thd != NULL);
    assert(thd->state == RUNNING);
    /* find sem */
    struct ksemaphore* sem = ksemaphore_get_by_id(sem_pool, sem_id);
    // invalid sem id
    if (sem == NULL) {
        return false;
    }
    // DEBUG("%s waiting sem %lu(%d), nr_sem: %d I\n", thd->name, sem_id, sem->val, sem_pool->nr_sem);

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

bool ksemaphore_signal(struct XiziSemaphorePool* sem_pool, sem_id_t sem_id)
{
    /* find sem */
    struct ksemaphore* sem = ksemaphore_get_by_id(sem_pool, sem_id);
    // invalid sem id
    if (sem == NULL) {
        return false;
    }

    if (sem->val < 0) {
        if (!IS_DOUBLE_LIST_EMPTY(&sem->wait_list_guard)) {
            struct Thread* thd = CONTAINER_OF(sem->wait_list_guard.next, struct Thread, node);
            assert(thd != NULL && thd->state == BLOCKED);
            xizi_task_manager.task_unblock(thd);
            // DEBUG("waking %s\n", thd->name);
        }
    }

    sem->val++;
    return true;
}

bool ksemaphore_signal_no_wake(struct XiziSemaphorePool* sem_pool, sem_id_t sem_id)
{
    /* find sem */
    struct ksemaphore* sem = ksemaphore_get_by_id(sem_pool, sem_id);
    // invalid sem id
    if (sem == NULL) {
        return false;
    }

    sem->val++;
    return true;
}

bool ksemaphore_free(struct XiziSemaphorePool* sem_pool, sem_id_t sem_id)
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

    rbt_delete(&sem_pool->sem_pool_map, sem_id);
    doubleListDel(&sem->sem_list_node);
    slab_free(&sem_pool->allocator, sem);
    sem_pool->nr_sem--;

    return true;
}
