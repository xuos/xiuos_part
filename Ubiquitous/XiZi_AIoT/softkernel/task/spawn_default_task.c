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
 * @file spawn_default_task.c
 * @brief spawn task that embeded in kernel image
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: spawn_default_task.c
Description: spawn task that embeded in kernel image
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include "actracer.h"
#include "assert.h"
#include "kalloc.h"
#include "task.h"

#include "execelf.h"

int spawn_embedded_task(char* img_start, char* name, char** argv)
{
    struct TaskMicroDescriptor* new_task_cb = xizi_task_manager.new_task_cb();
    if (UNLIKELY(!new_task_cb)) {
        ERROR("Unable to new task control block.\n");
        return -1;
    }
    // init trapframe
    arch_init_trapframe(new_task_cb->main_thread.trapframe, 0, 0);

    /* load img to task */
    /* 1. load elf header */
    struct elfhdr* elf = (struct elfhdr*)img_start;
    // pgdir for new task
    struct TopLevelPageDirectory pgdir;
    if (UNLIKELY(!xizi_pager.new_pgdir(&pgdir))) {
        ERROR("create new pgdir failed.\n");
        goto error_exec;
    }
    memcpy(pgdir.pd_addr, kern_pgdir.pd_addr, TOPLEVLE_PAGEDIR_SIZE);

    /* 2. load elf content */
    uint32_t load_size = 0;
    struct proghdr ph;
    for (int sec_idx = 0, off = elf->phoff; sec_idx < elf->phnum; sec_idx++, off += sizeof(ph)) {
        // load proghdr
        memcpy((char*)&ph, img_start + off, sizeof(ph));

        if (ph.type != ELF_PROG_LOAD)
            continue;
        if (ph.memsz < ph.filesz) {
            ERROR("elf header mem size less than file size\n");
            goto error_exec;
        }

        // read section
        // 1. alloc space
        if ((load_size = xizi_pager.resize_user_pgdir(&pgdir, load_size, ph.vaddr + ph.memsz))
            != ph.vaddr + ph.memsz) {
            goto error_exec;
        }
        // 2. copy inode to space
        assert(ph.vaddr % PAGE_SIZE == 0);
        for (int addr_offset = 0; addr_offset < ph.filesz; addr_offset += PAGE_SIZE) {
            uintptr_t page_paddr = xizi_pager.address_translate(&pgdir, ph.vaddr + addr_offset);
            if (page_paddr == 0) {
                panic("copy elf file to unmapped addr");
            }
            uintptr_t read_size = (ph.filesz - addr_offset < PAGE_SIZE ? ph.filesz - addr_offset : PAGE_SIZE);
            memcpy(P2V(page_paddr), img_start + (ph.off + addr_offset), read_size);
        }
    }

    /// elf file content now in memory
    // alloc stack page and map to TOP of user vspace
    uintptr_t* stack_bottom = (uintptr_t*)kalloc(USER_STACK_SIZE);
    if (UNLIKELY(stack_bottom == NULL)) {
        ERROR("No memory.\n");
        goto error_exec;
    }
    xizi_pager.map_pages(pgdir.pd_addr, USER_MEM_TOP - USER_STACK_SIZE, V2P(stack_bottom), USER_STACK_SIZE, false);

    uintptr_t user_vspace_sp = USER_MEM_TOP;
    /// @todo change 32 to some macro
    uintptr_t user_stack_init[32];
    uintptr_t argc = 0;
    uintptr_t copy_len = 0;
    for (argc = 0; argv != NULL && argv[argc] != NULL; argc++) {
        /// @todo handle with large number of parameters

        // copy param to user stack
        copy_len = strlen(argv[argc]) + 1;
        user_vspace_sp = (user_vspace_sp - copy_len) & ~3;
        uintptr_t copied_len = xizi_pager.cross_vspace_data_copy(&pgdir, user_vspace_sp, (uintptr_t)argv[argc], copy_len);
        if (UNLIKELY(copied_len != copy_len)) {
            ERROR("Something went wrong when copying params.\n");
            goto error_exec;
        }
        user_stack_init[argc] = user_vspace_sp;
    }
    user_stack_init[argc] = 0;
    copy_len = (argc + 1) * sizeof(uintptr_t);
    user_vspace_sp -= copy_len;
    uintptr_t copied_len = xizi_pager.cross_vspace_data_copy(&pgdir, user_vspace_sp, (uintptr_t)user_stack_init, copy_len);
    if (UNLIKELY(copied_len != copy_len)) {
        ERROR("Something went wrong when copying params.\n");
        goto error_exec;
    }

    // init task trapframe, which stores in svc stack
    // do not go tp error_exec once we change trapframe!
    assert(copied_len == (argc + 1) * sizeof(uintptr_t));
    arch_trapframe_set_sp_pc(new_task_cb->main_thread.trapframe, user_vspace_sp, elf->entry);
    arch_set_main_params(new_task_cb->main_thread.trapframe, argc, user_vspace_sp);

    // save program name
    strncpy(new_task_cb->name, name, sizeof(new_task_cb->name));

    struct TopLevelPageDirectory old_pgdir = new_task_cb->pgdir;
    new_task_cb->pgdir = pgdir;

    /// @todo record mem size used b task
    new_task_cb->mem_size = ALIGNUP(load_size, PAGE_SIZE);

    xizi_pager.free_user_pgdir(&old_pgdir);

    xizi_task_manager.task_set_default_schedule_attr(new_task_cb, RequireRootTag());
    return 0;

error_exec:
    if (pgdir.pd_addr != NULL) {
        xizi_pager.free_user_pgdir(&pgdir);
    }
    return -1;
}