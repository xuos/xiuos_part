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
#include <stdint.h>
#include <string.h>

#include "assert.h"
#include "spinlock.h"

bool module_spinlock_use_intr_init(void)
{
    return true;
}

#define SPINLOCK_STATE_UNLOCK 0xFF

enum {
    SPINLOCK_LOCK_NOWAIT = 0,
    SPINLOCK_LOCK_WAITFOREVER = 0xFFFFFFFF,
};

void spinlock_init(struct spinlock* lock, char* name)
{
    lock->owner_cpu = SPINLOCK_STATE_UNLOCK;
    strncpy(lock->name, name, 24);
}

extern int _spinlock_lock(struct spinlock* lock, uint32_t timeout);
void spinlock_lock(struct spinlock* lock)
{
    if (lock->owner_cpu != SPINLOCK_STATE_UNLOCK) {
        ERROR("spinlock %s lock double locked by core %d\n", lock->name, lock->owner_cpu);
        panic("");
    }
    assert(_spinlock_lock(lock, SPINLOCK_LOCK_WAITFOREVER) == 0);
}

void _spinlock_unlock(struct spinlock* lock);
void spinlock_unlock(struct spinlock* lock)
{
    _spinlock_unlock(lock);
}