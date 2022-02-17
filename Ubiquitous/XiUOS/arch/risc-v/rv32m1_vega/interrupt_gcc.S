/*
 * Copyright (c) 2006-2018, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2018/10/02     Bernard      The first version
 */

#include "boot.h"

  .section      .text.entry
  .align 2
  .global IRQ_Handler
IRQ_Handler:

    SAVE_X_REGISTERS

    mv  fp, sp

    /* switch to interrupt stack */
    # la    sp, __stack

    /* interrupt handle */

    csrr  a0, mcause
    csrr  a1, mepc
    mv    a2, sp
    call  SystemIrqHandler

    /* switch to from thread stack */

    mv  sp, fp
    mv  a0, fp
    call KTaskOsAssignAfterIrq
    j SwitchKTaskContextExit

