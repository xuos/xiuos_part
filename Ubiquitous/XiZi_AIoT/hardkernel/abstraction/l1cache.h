/*
 * Copyright (c) 2022 AIIT XUOS Lab
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
 * @file l1cache.c
 * @brief PLC inovance am401 app
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.8.10
 */

#include <stdint.h>
#include <sys/types.h>
#include "cortex_a9.h"

/* Terms:
 * 1) Point of coherency (PoC)
 *    The PoC is the point at which all agents that can access memory are
 *    guaranteed to see the same copy of a memory location
 * 2) Point of unification (PoU)
 *    The PoU is the point by which the instruction and data caches and the
 *    translation table walks of the processor are guaranteed to see the same
 *    copy of a memory location.
 *
 * L1 Cache Operations:
 *
 * CP15 Register:     ICIALLUIS
 *   Description:     Invalidate entire instruction cache Inner Shareable.
 *   Register Format: Should be zero (SBZ)
 *   Instruction:     MCR p15, 0, <Rd>, c7, c1, 0
 * CP15 Register:     BPIALLIS
 *   Description:     Invalidate entire branch predictor array Inner
 *                    Shareable.
 *   Register Format: Should be zero (SBZ)
 *   Instruction:     MCR p15, 0, <Rd>, c7, c1, 6
 * CP15 Register:     ICIALLU
 *   Description:     Invalidate all instruction caches to PoU. Also flushes
 *                    branch target cache.
 *   Register Format: Should be zero (SBZ)
 *   Instruction:     MCR p15, 0, <Rd>, c7, c5, 0
 * CP15 Register:     ICIMVAU
 *   Description:     Invalidate instruction cache by VA to PoU.
 *   Register Format: VA
 *   Instruction:     MCR p15, 0, <Rd>, c7, c5, 1
 * CP15 Register:     CP15ISB
 *   Description:     Instruction Synchronization Barrier operation
 *   NOTE:            Deprecated and no longer documented
 *   Instruction:     MCR p15, 0, <Rd>, c7, c5, 4
 * CP15 Register:     BPIALL
 *   Description:     Invalidate entire branch predictor array.
 *   Register Format: Should be zero (SBZ)
 *   Instruction:     MCR p15, 0, <Rd>, c7, c5, 6
 * CP15 Register:     BPIMVA
 *   Description:     Invalidate VA from branch predictor array.
 *   Register Format: Should be zero (SBZ)
 *   Instruction:     MCR p15, 0, <Rd>, c7, c5, 7
 * CP15 Register:     DCIMVAC
 *   Description:     Invalidate data cache line by VA to PoC.
 *   Register Format: VA
 *   Instruction:     MCR p15, 0, <Rd>, c7, c6, 1
 * CP15 Register:     DCISW
 *   Description:     Invalidate data cache line by Set/Way.
 *   Register Format: Set/Way
 *   Instruction:     MCR p15, 0, <Rd>, c7, c6, 2
 * CP15 Register:     DCCMVAC
 *   Description:     Clean data cache line to PoC by VA.
 *   Register Format: VA
 *   Instruction:     MCR p15, 0, <Rd>, c7, c10, 1
 * CP15 Register:     DCCSW
 *   Description:     Clean data cache line by Set/Way.
 *   Register Format: Set/Way
 *   Instruction:     MCR p15, 0, <Rd>, c7, c10, 2
 * CP15 Register:     CP15DSB
 *   Description:     Data Synchronization Barrier operation
 *   NOTE:            Deprecated and no longer documented
 *   Instruction:     MCR p15, 0, <Rd>, c7, c10, 4
 * CP15 Register:     CP15DMB
 *   Description:     Data Memory Barrier operation
 *   NOTE:            Deprecated and no longer documented
 *   Instruction:     MCR p15, 0, <Rd>, c7, c10, 5
 * CP15 Register:     DCCMVAU
 *   Description:     Clean data or unified cache line by VA to PoU.
 *   Register Format: VA
 *   Instruction:     MCR p15, 0, <Rd>, c7, c11, 1
 * CP15 Register:     DCCIMVAC
 *   Description:     Clean and invalidate data cache line by VA to PoC.
 *   Register Format: VA
 *   Instruction:     MCR p15, 0, <Rd>, c7, c14, 1
 * CP15 Register:     DCCISW
 *   Description:     Clean and invalidate data cache line by Set/Way.
 *   Register Format: Set/Way
 *   Instruction:     MCR p15, 0, <Rd>, c7, c14, 2
 */

#define BM_SCTLR_I (1 << 12)   //!< Instruction cache enable
#define BM_SCTLR_C (1 << 2)    //!< Data cache enable

void InvalidateL1Dcache(uintptr_t start, uintptr_t end);

void InvalidateL1DcacheAll(void);


void CleanL1Dcache(uintptr_t start, uintptr_t end);

void CleanL1DcacheAll(void);

void FlushL1Dcache(uintptr_t start, uintptr_t end);

void FlushL1DcacheAll(void);


void InvalidateL1IcacheAll(void);

void InvalidateL1Icache(uintptr_t start, uintptr_t end);

void EnableL1Icache(void);
void DisableL1Icache();

void EnableL1Dcache();

void DisableL1Dcache();