/*
 * Copyright (c) 2008-2012, Freescale Semiconductor, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * o Redistributions of source code must retain the above copyright notice, this list
 *   of conditions and the following disclaimer.
 *
 * o Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 *
 * o Neither the name of Freescale Semiconductor, Inc. nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/**
 * @file page_table_entry.h
 * @brief mmu related configure and registers
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2024-04-25
 */

/*************************************************
File name: page_table_entry.h
Description: mmu related configure and registers
Others: take imx_platform_sdk sdk/core/src/mmu.c for references
                https://github.com/flit/imx6_platform_sdk
History:
Author: AIIT XUOS Lab
Modification:
1. modify the L1-level page table name and properties name to apply hardkernel implementation
*************************************************/
#pragma once

#include <stdint.h>

typedef union {
    uintptr_t entry;
    struct {
        uint64_t desc_type : 2; // (Invalid, PageTable, Section, SuperSection)/(Invalid, Table, Block)
        //uint64_t B : 1; // Bufferable
       // uint64_t C : 1; // Cacheable
        uint64_t XN : 1; // Execute-not
        //uint64_t Domain : 4; // Domain
        uint64_t _impl_defined : 1; // Implementation defined, should be zero.
        uint64_t AP1_0 : 2; // Access permissions AP
        uint64_t TEX : 3; // TEX remap  ==attr_idx      The memory type, Device or Normal.
        uint64_t AP2 : 1; // Access permissions AP[2]
        uint64_t S : 1; // Shareable
        uint64_t NG : 1; // Not-global
        uint64_t _zero : 1; // Should be zero.
        uint64_t NS : 1; // Non-secure
        uint64_t section_addr :36 ; // Section Physical base address
        uint64_t AF : 1; // Access flag
    };
} __attribute__((packed)) PageDirEntry;

typedef union {
    uint64_t entry;
    struct {
        uint64_t desc_type : 2; // (Invalid, Reserved,4kb, 16kb 64kb )
       // uint64_t B : 1; // Bufferable
        //uint64_t C : 1; // Cacheable
        uint64_t AP1_0 : 2;//Access permissions
        uint64_t TEX : 3;//TEX remap  ==attr_idx      The memory type, Device or Normal.
        uint64_t AP2 : 1;
        uint64_t S : 1; // Shareable
        uint64_t NG : 1; // Not-global
        uint64_t page_addr :36 ;
        uint64_t AF : 1; // Access flag
    };
} __attribute__((packed)) PageTblEntry;
