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
 * @file sys_exec.c
 * @brief task execution syscall
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: sys_exec.c
Description: task execution syscall
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <string.h>

#include "execelf.h"

#include "actracer.h"
#include "assert.h"
#include "kalloc.h"
#include "multicores.h"
#include "pagetable.h"
#include "syscall.h"
#include "task.h"

#define PRINT_ELFHDR(elf)                               \
    do {                                                \
        DEBUG_PRINTF("magic: %x\n", elf.magic);         \
        DEBUG_PRINTF("elf: ");                          \
        for (int i = 0; i < 12; i++) {                  \
            DEBUG_PRINTF("%x ", elf.elf[i]);            \
        }                                               \
        DEBUG_PRINTF("\n");                             \
        DEBUG_PRINTF("type: %x\n", elf.type);           \
        DEBUG_PRINTF("machine: %x\n", elf.machine);     \
        DEBUG_PRINTF("version: %x\n", elf.version);     \
        DEBUG_PRINTF("entry: %x\n", elf.entry);         \
        DEBUG_PRINTF("phoff: %x\n", elf.phoff);         \
        DEBUG_PRINTF("shoff: %x\n", elf.shoff);         \
        DEBUG_PRINTF("flags: %x\n", elf.flags);         \
        DEBUG_PRINTF("ehsize: %x\n", elf.ehsize);       \
        DEBUG_PRINTF("phentsize: %x\n", elf.phentsize); \
        DEBUG_PRINTF("phnum: %x\n", elf.phnum);         \
        DEBUG_PRINTF("shentsize: %x\n", elf.shentsize); \
        DEBUG_PRINTF("shnum: %x\n", elf.shnum);         \
        DEBUG_PRINTF("shstrndx: %x\n", elf.shstrndx);   \
    } while (0)

/// @brief load a user program for execution
/// @param path path to elf file
/// @param argv arguments giving to main
/// @return
int task_exec(struct TaskMicroDescriptor* task, struct Session* session, int fd, ipc_read_fn ipc_read, char* name, char** argv)
{
    struct elfhdr elf;
    struct TopLevelPageDirectory pgdir;
    pgdir.pd_addr = NULL;

    if (ipc_read(session, fd, (char*)&elf, 0, sizeof(elf)) < sizeof(elf) || elf.magic != ELF_MAGIC) {
        ERROR("invalide elf file.\n");
        goto error_exec;
    }

    // pgdir for new task
    if (UNLIKELY(!xizi_pager.new_pgdir(&pgdir))) {
        ERROR("create new pgdir failed.\n");
        goto error_exec;
    }
    memcpy(pgdir.pd_addr, kern_pgdir.pd_addr, TOPLEVLE_PAGEDIR_SIZE);

    // read elf file by (header, section)
    uintptr_t load_size = 0;
    struct proghdr ph;
    for (int sec_idx = 0, off = elf.phoff; sec_idx < elf.phnum; sec_idx++, off += sizeof(ph)) {
        if (ipc_read(session, fd, (char*)&ph, off, sizeof(ph)) != sizeof(ph)) {
            ERROR("Read elf header failed\n");
            goto error_exec;
        }

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
            if (read_size != ipc_read(session, fd, P2V(page_paddr), ph.off + addr_offset, read_size)) {
                ERROR("read size error, off: %d, read len: %d\n", ph.off + addr_offset, read_size);
                goto error_exec;
            }
        }
    }

    /// elf file content now in memory
    // alloc stack page and map to TOP of user vspace
    uintptr_t* stack_bottom = (uintptr_t*)kalloc(USER_STACK_SIZE);
    if (UNLIKELY(stack_bottom == NULL)) {
        ERROR("No memory.\n");
        goto error_exec;
    }
    if (!xizi_pager.map_pages(pgdir.pd_addr, USER_MEM_TOP - USER_STACK_SIZE, V2P(stack_bottom), USER_STACK_SIZE, false)) {
        ERROR("User stack map failed\n");
        kfree((char*)stack_bottom);
        goto error_exec;
    }

    uintptr_t user_vspace_sp = USER_MEM_TOP;
    /// @todo change 32 to some macro
    uintptr_t user_stack_init[32];
    uintptr_t argc = 0;
    uintptr_t copy_len = 0;
    for (argc = 0; argv != NULL && argv[argc] != NULL; argc++) {
        /// @todo handle with large number of parameters (more than 32)

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
    arch_trapframe_set_sp_pc(task->main_thread.trapframe, user_vspace_sp, elf.entry);
    arch_set_main_params(task->main_thread.trapframe, argc, user_vspace_sp);

    // save program name
    char* last = NULL;
    for (last = name; *name; name++) {
        if (*name == '/') {
            last = name + 1;
        }
    }
    strncpy(task->name, last, sizeof(task->name));

    struct TopLevelPageDirectory old_pgdir = task->pgdir;
    task->pgdir = pgdir;

    /// @todo record mem size used b task
    task->mem_size = load_size;

    xizi_pager.free_user_pgdir(&old_pgdir);
    return 0;

error_exec:
    if (pgdir.pd_addr != NULL) {
        xizi_pager.free_user_pgdir(&pgdir);
    }
    ERROR("task create error\n");
    return -1;
}

int sys_exec(struct KernReadTool* read_tool, char* name, char** argv)
{
    /// @todo find a source of mmu_driver_tag instead of requiring from root
    static struct TraceTag mmu_driver_tag;
    static bool init = false;
    if (UNLIKELY(!init)) {
        AchieveResourceTag(&mmu_driver_tag, RequireRootTag(), "hardkernel/mmu-ac-resource");
        init = true;
    }

    struct MmuCommonDone* p_mmu_driver = AchieveResource(&mmu_driver_tag);

    struct TaskMicroDescriptor* current_task = cur_cpu()->task;
    struct Session* session = read_tool->session;
    int fd = read_tool->fd;
    ipc_read_fn ipc_read = read_tool->ipc_read;
    int ret = task_exec(current_task, session, fd, ipc_read, name, argv);
    if (ret >= 0) {
        spinlock_init(&current_task->lock, current_task->name);
        p_mmu_driver->LoadPgdir((uintptr_t)V2P(current_task->pgdir.pd_addr));
        return ret;
    }
    return -1;
}