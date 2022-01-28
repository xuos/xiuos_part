/**
* @file interrupt.c
* @brief support gap8 interrupt enable and disable
* @version 1.0 
* @author AIIT XUOS Lab
* @date 2021-09-02
*/


#include <arch_interrupt.h>
#include <xs_base.h>
#include <xs_isr.h>
#include "fsl_common.h"


int ArchDisableHwIrq(uint32_t irq_num)
{
    DisableIRQ(irq_num);
    return 0;
}

int ArchEnableHwIrq(uint32_t irq_num)
{
    EnableIRQ(irq_num);
    return 0;
}


x_base DisableLocalInterrupt(void)
{
  __disable_irq();
  return 0;
}

/****************************************************************************
 * Name: EnableLocalInterrupt
 *
 * Description:
 *   Return the current interrupt state and enable interrupts
 *
 ****************************************************************************/

void EnableLocalInterrupt(x_base oldstat)
{
  __enable_irq();
}




