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
 * @file semaphore.h
 * @brief semaphore implementation
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2024.05.28
 */
#pragma once

#include <stdbool.h>
#include <stdint.h>

#include "list.h"
#include "object_allocator.h"

/// @warning this is no in use
enum {
    KSEM_NOWAIT = -1,
};

struct ksemaphore {
    uint32_t id;
    int val;
    /* list of waiting threads */
    struct double_list_node wait_list_guard;
    /* list to manage semaphores */
    /// @todo Use RB-Tree to manage all semaphores
    struct double_list_node sem_list_node;
};

struct XiziSemaphorePool {
    uint32_t next_sem_id;
    struct slab_allocator allocator;
    struct double_list_node sem_list_guard;
};

void semaphore_pool_init(struct XiziSemaphorePool* sem_pool);
int ksemaphore_alloc(struct XiziSemaphorePool* sem_pool, int val);
bool ksemaphore_free(struct XiziSemaphorePool* sem_pool, uint32_t sem_id);
bool ksemaphore_signal(struct XiziSemaphorePool* sem_pool, uint32_t sem_id);
