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
 * @file memspace.h
 * @brief memspace loader
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: memspace.h
Description: memspace loader
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/

#include "task.h"

struct ThreadStackPointer {
    int argc;
    int stack_idx;
    uintptr_t user_sp;
    uintptr_t user_stack_vaddr;
};

struct MemSpace* alloc_memspace();
void free_memspace(struct MemSpace* pmemspace);
uintptr_t* load_memspace(struct MemSpace* pmemspace, char* img_start);
struct ThreadStackPointer load_user_stack(struct MemSpace* pmemspace, char** argv);