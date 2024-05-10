/* Copyright (c) 2006-2018 Frans Kaashoek, Robert Morris, Russ Cox,
 *                        Massachusetts Institute of Technology
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
/**
 * @file error_debug.c
 * @brief handle program abort
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2024.4.25
 */

/*************************************************
File name: error_debug.c
Description: handle program abort
Others:
History:
Author: AIIT XUOS Lab
Modification:
1. Take only armv8 abort reason part(_abort_reason).
2. Modify iabort and dabort handler(in dabort_handler() and iabort_handler())
*************************************************/

#include "log.h"
#include "multicores.h"
#include "spinlock.h"
// #include "syscall.h"

__attribute__((always_inline)) static inline void _abort_reason(uint32_t fault_status)
{
    if ((fault_status & 0x3f) == 0x21) // Alignment failure
        KPrintf("reason: alignment\n");
    else if ((fault_status & 0x3f) == 0x4) // Translation fault, level 0
        KPrintf("reason: sect. translation level 0\n");
    else if ((fault_status & 0x3f) == 0x5) // Translation fault, level 1
        KPrintf("reason: sect. translation level 1\n");
    else if ((fault_status & 0x3f) == 0x6) // Translation fault, level 2
        KPrintf("reason: sect. translation level 2\n");
    else if ((fault_status & 0x3f) == 0x7) // Translation fault, level 3
        KPrintf("reason: sect. translation level 3\n");
    else if ((fault_status & 0x3f) == 0x3d) // Section Domain fault
        KPrintf("reason: sect. domain\n");
    else if ((fault_status & 0x3f) == 0x13) // Permission level 1
        KPrintf("reason: sect. permission level 1\n");
    else if ((fault_status & 0x3f) == 0x14) // Permission level 2
        KPrintf("reason: sect. permission level 2\n");
    else if ((fault_status & 0x3f) == 0x15) // Permission level 3
        KPrintf("reason: sect. permission level 3\n");
    else if ((fault_status & 0x3f) == 0x8) // External abort
        KPrintf("reason: ext. abort\n");
    else if ((fault_status & 0x3f) == 0x9) // Access flag fault, level 1
        KPrintf("reason: sect. Access flag fault level 1\n");
    else if ((fault_status & 0x3f) == 0xa) // Access flag fault, level 2
        KPrintf("reason: sect. Access flag fault level 2\n");
    else if ((fault_status & 0x3f) == 0xb) // Access flag fault, level 3
        KPrintf("reason: sect. Access flag fault level 3\n");
    else
        KPrintf("reason: unknown???\n");
}

void dump_tf(struct trapframe* tf)
{
    KPrintf("   elr_el1:  0x%x\n", tf->elr_el1);
    KPrintf("   spsr_el1: 0x%x\n", tf->spsr_el1);
    KPrintf("     x0: 0x%x\n", tf->x0);
    KPrintf("     x1: 0x%x\n", tf->x1);
    KPrintf("     x2: 0x%x\n", tf->x2);
    KPrintf("     x3: 0x%x\n", tf->x3);
    KPrintf("     x4: 0x%x\n", tf->x4);
    KPrintf("     x5: 0x%x\n", tf->x5);
    KPrintf("     x6: 0x%x\n", tf->x6);
    KPrintf("     x7: 0x%x\n", tf->x7);
    KPrintf("     x8: 0x%x\n", tf->x8);
    KPrintf("     x9: 0x%x\n", tf->x9);
    KPrintf("    x10: 0x%x\n", tf->x10);
    KPrintf("    x11: 0x%x\n", tf->x11);
    KPrintf("    x12: 0x%x\n", tf->x12);
    KPrintf("    x13: 0x%x\n", tf->x13);
    KPrintf("    x14: 0x%x\n", tf->x14);
    KPrintf("    x15: 0x%x\n", tf->x15);
    KPrintf("    x16: 0x%x\n", tf->x16);
    KPrintf("    x17: 0x%x\n", tf->x17);
    KPrintf("    x18: 0x%x\n", tf->x18);
    KPrintf("    x19: 0x%x\n", tf->x19);
    KPrintf("    x20: 0x%x\n", tf->x20);
    KPrintf("    x21: 0x%x\n", tf->x21);
    KPrintf("    x22: 0x%x\n", tf->x22);
    KPrintf("    x23: 0x%x\n", tf->x23);
    KPrintf("    x24: 0x%x\n", tf->x24);
    KPrintf("    x25: 0x%x\n", tf->x25);
    KPrintf("    x26: 0x%x\n", tf->x26);
    KPrintf("    x27: 0x%x\n", tf->x27);
    KPrintf("    x28: 0x%x\n", tf->x28);
    KPrintf("    x29: 0x%x\n", tf->x29);
    KPrintf("     pc: 0x%x\n", tf->pc);
}

void handle_undefined_instruction(struct trapframe* tf)
{
    // unimplemented trap handler
    KPrintf("undefined instruction at %x\n", tf->pc);
    panic("");
}