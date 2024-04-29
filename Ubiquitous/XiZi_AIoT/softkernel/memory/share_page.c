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
 * @file share_page.c
 * @brief support share page for tasks
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: share_page.c
Description: support share page for tasks
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include "cache_common_ope.h"

#include "assert.h"
#include "kalloc.h"
#include "multicores.h"
#include "object_allocator.h"
#include "pagetable.h"
#include "share_page.h"
#include "task.h"

static struct SharePageRightGroup right_group;

static struct slab_allocator* SessionAllocator()
{
    static bool init = false;
    static struct slab_allocator session_slab;
    if (!init) {
        slab_init(&session_slab, sizeof(struct session_backend));
    }
    return &session_slab;
}

/// @brief  check if [vaddr, vaddr + nr_pages * PAGE_SIZE) is mapped in task's vspace
/// @param task
/// @param vaddr
/// @param nr_pages
/// @return true if mem range is free, false if at least one page inside [vaddr, vaddr + nr_pages * PAGE_SIZE) is mapped
static inline bool check_pages_unmapped(struct TaskMicroDescriptor* task, uintptr_t vaddr, int nr_pages)
{
    static uintptr_t paddr = UINT32_MAX;
    for (uint32_t i = 0; i < nr_pages; i++) {
        if ((paddr = xizi_pager.address_translate(&task->pgdir, vaddr)) != 0) {
            return false;
        }
        vaddr += PAGE_SIZE;
    }
    return true;
}

/// @brief get a addr to map ipc page
/// @param task
/// @param nr_pages continuously map nr_pages
/// @return addr to be mapped, aligned by page
/// @todo optimize, and suppurt multiple pages
static uintptr_t alloc_share_page_addr(struct TaskMicroDescriptor* task, const int nr_pages)
{
    uintptr_t vaddr = USER_IPC_SPACE_BASE;
    while (!check_pages_unmapped(task, vaddr, nr_pages)) {
        vaddr += 2 * PAGE_SIZE;
        assert(vaddr % PAGE_SIZE == 0);
    }
    // now that nr_pages size after vaddr is unmapped
    if (UNLIKELY(vaddr >= USER_IPC_SPACE_TOP)) {
        return (uintptr_t)NULL;
    }
    return vaddr;
}

static uintptr_t map_task_share_page(struct TaskMicroDescriptor* task, const uintptr_t paddr, const int nr_pages)
{
    /* get driver codes */
    struct DCacheDone* p_dcache_done = AchieveResource(&right_group.dcache_driver_tag);
    struct MmuCommonDone* p_mmu_driver = AchieveResource(&right_group.mmu_driver_tag);

    // map double vaddr page to support uniform ring buffer r/w
    uintptr_t vaddr = (uintptr_t)NULL;
    if (task->massive_ipc_allocator != NULL) {
        vaddr = (uintptr_t)KBuddyAlloc(task->massive_ipc_allocator, PAGE_SIZE * nr_pages * 2);
    } else {
        vaddr = alloc_share_page_addr(task, nr_pages * 2);
        if (vaddr >= USER_IPC_USE_ALLOCATOR_WATERMARK) {
            task->massive_ipc_allocator = (struct KBuddy*)slab_alloc(&xizi_task_manager.task_buddy_allocator);
            KBuddyInit(task->massive_ipc_allocator, USER_IPC_USE_ALLOCATOR_WATERMARK, USER_IPC_SPACE_TOP);
            if (!task->massive_ipc_allocator) {
                ERROR("Alloc task buddy failed.\n");
                return (uintptr_t)NULL;
            }
            return map_task_share_page(task, paddr, nr_pages);
        }
    }

    if (UNLIKELY(vaddr == (uintptr_t)NULL)) {
        return (uintptr_t)NULL;
    }
    if (!xizi_pager.map_pages(task->pgdir.pd_addr, vaddr, paddr, nr_pages * PAGE_SIZE, false)) {
        return (uintptr_t)NULL;
    }
    if (!xizi_pager.map_pages(task->pgdir.pd_addr, vaddr + (nr_pages * PAGE_SIZE), paddr, nr_pages * PAGE_SIZE, false)) {
        xizi_pager.unmap_pages(task->pgdir.pd_addr, vaddr, nr_pages * PAGE_SIZE);
        return (uintptr_t)NULL;
    }
    if (task == cur_cpu()->task) {
        p_mmu_driver->TlbFlush(vaddr, 2 * nr_pages * PAGE_SIZE);

        /// @todo clean range rather than all
        // p_dcache_done->flushall();
        p_dcache_done->invalidateall();
        // p_dcache_done->flush(vaddr, vaddr + 2 * nr_pages * PAGE_SIZE);
    }
    return vaddr;
}

uintptr_t task_map_pages(struct TaskMicroDescriptor* task, const uintptr_t vaddr, const uintptr_t paddr, const int nr_pages, const int is_dev)
{
    /* get driver codes */
    struct DCacheDone* p_dcache_done = AchieveResource(&right_group.dcache_driver_tag);
    struct MmuCommonDone* p_mmu_driver = AchieveResource(&right_group.mmu_driver_tag);

    bool ret = false;
    if (is_dev) {
        ret = xizi_pager.map_pages(task->pgdir.pd_addr, vaddr, paddr, nr_pages * PAGE_SIZE, true);
    } else {
        ret = xizi_pager.map_pages(task->pgdir.pd_addr, vaddr, paddr, nr_pages * PAGE_SIZE, false);
    }
    if (!ret) {
        return (uintptr_t)NULL;
    }
    if (task == cur_cpu()->task) {
        p_mmu_driver->TlbFlush(vaddr, nr_pages * PAGE_SIZE);

        /// @todo clean range rather than all
        // p_dcache_done->flushall();
        p_dcache_done->invalidateall();
        // p_dcache_done->flush(vaddr, vaddr + nr_pages * PAGE_SIZE);
    }

    return vaddr;
}

void unmap_task_share_pages(struct TaskMicroDescriptor* task, const uintptr_t task_vaddr, const int nr_pages)
{
    /* get driver codes */
    struct DCacheDone* p_dcache_done = AchieveResource(&right_group.dcache_driver_tag);
    struct MmuCommonDone* p_mmu_driver = AchieveResource(&right_group.mmu_driver_tag);

    xizi_pager.unmap_pages(task->pgdir.pd_addr, task_vaddr, nr_pages * PAGE_SIZE);
    xizi_pager.unmap_pages(task->pgdir.pd_addr, task_vaddr + (nr_pages * PAGE_SIZE), nr_pages * PAGE_SIZE);
    if (task_vaddr >= USER_IPC_USE_ALLOCATOR_WATERMARK) {
        KBuddyFree(task->massive_ipc_allocator, (void*)task_vaddr);
    }
    if (task == cur_cpu()->task) {
        p_mmu_driver->TlbFlush(task_vaddr, 2 * nr_pages * PAGE_SIZE);

        /// @todo clean range rather than all
        // p_dcache_done->flushall();
        p_dcache_done->invalidateall();
        // p_dcache_done->flush(task_vaddr, task_vaddr + 2 * nr_pages * PAGE_SIZE);
    }
}

static int next_session_id = 1;
struct session_backend* create_share_pages(struct TaskMicroDescriptor* client, struct TaskMicroDescriptor* server, const int capacity)
{
    struct session_backend* session_backend = (struct session_backend*)slab_alloc(SessionAllocator());
    if (UNLIKELY(session_backend == NULL)) {
        return NULL;
    }

    int true_capacity = ALIGNUP(capacity, PAGE_SIZE);
    int nr_pages = true_capacity / PAGE_SIZE;
    uintptr_t kern_vaddr = (uintptr_t)kalloc(true_capacity);
    if (UNLIKELY(kern_vaddr == (uintptr_t)NULL)) {
        ERROR("No memory\n");
        return NULL;
    }
    assert(kern_vaddr % PAGE_SIZE == 0);
    uintptr_t client_vaddr = map_task_share_page(client, V2P_WO(kern_vaddr), nr_pages);
    if (UNLIKELY(client_vaddr == 0)) {
        kfree((char*)kern_vaddr);
        slab_free(SessionAllocator(), session_backend);
        return NULL;
    }
    uintptr_t server_vaddr = map_task_share_page(server, V2P_WO(kern_vaddr), nr_pages);
    if (UNLIKELY(server_vaddr == 0)) {
        unmap_task_share_pages(client, client_vaddr, nr_pages);
        kfree((char*)kern_vaddr);
        slab_free(SessionAllocator(), session_backend);
        return NULL;
    }

    /* build session_backend */
    session_backend->session_id = next_session_id++;
    session_backend->buf_kernel_addr = kern_vaddr;
    session_backend->nr_pages = nr_pages;
    session_backend->client = client;
    session_backend->server = server;
    // init client side session struct
    session_backend->client_side.buf_addr = client_vaddr;
    session_backend->client_side.capacity = true_capacity;
    session_backend->client_side.closed = false;
    doubleListNodeInit(&session_backend->client_side.node);
    doubleListAddOnBack(&session_backend->client_side.node, &client->cli_sess_listhead);
    // init server side session struct
    session_backend->server_side.buf_addr = server_vaddr;
    session_backend->server_side.capacity = true_capacity;
    session_backend->server_side.head = 0;
    session_backend->server_side.tail = 0;
    session_backend->server_side.closed = false;
    doubleListNodeInit(&session_backend->server_side.node);
    doubleListAddOnBack(&session_backend->server_side.node, &server->svr_sess_listhead);

    server->mem_size += true_capacity;
    client->mem_size += true_capacity;

    return session_backend;
}

/**
 * @brief deletion of a session happens at 3 conditions:
 *  1. task exits, close its side of sessions and found opposite side is also closed.
 *  2. server poll found a closed client side session.
 *  3. client close a session, and found server side has closed.
 */
int delete_share_pages(struct session_backend* session_backend)
{
    if (session_backend == NULL) {
        return -1;
    }

    /* unmap share pages */
    if (session_backend->client) {
        doubleListDel(&session_backend->client_side.node);
    }

    if (session_backend->server) {
        doubleListDel(&session_backend->server_side.node);
    }

    session_backend->server->mem_size -= session_backend->nr_pages * PAGE_SIZE;
    session_backend->client->mem_size -= session_backend->nr_pages * PAGE_SIZE;

    /* free seesion backend */
    kfree((void*)session_backend->buf_kernel_addr);
    slab_free(SessionAllocator(), (void*)session_backend);

    return 0;
}

struct XiziSharePageManager xizi_share_page_manager = {
    .create_share_pages = create_share_pages,
    .unmap_task_share_pages = unmap_task_share_pages,
    .delete_share_pages = delete_share_pages,
    .task_map_pages = task_map_pages,
};

int module_share_page_init(struct SharePageRightGroup* _right_group)
{
    /* assign rights to share page module */
    right_group = *_right_group;
    return 0;
}