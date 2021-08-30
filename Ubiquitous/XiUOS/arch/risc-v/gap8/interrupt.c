/****************************************************************************
 * arch/risc-v/src/gap8/gap8_interrupt.c
 * GAP8 event system
 *
 *   Copyright (C) 2018 Gregory Nutt. All rights reserved.
 *   Author: hhuysqt <1020988872@qq.com>
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 * 3. Neither the name NuttX nor the names of its contributors may be
 *    used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 ****************************************************************************/

/****************************************************************************
 *  GAP8 features a FC controller and a 8-core cluster. IRQ from peripherals
 *  have unique ID, which are dispatched to the FC or cluster by the SOC
 *  event unit, and then by the FC event unit or cluster event unit, and
 *  finally to FC or cluster. Peripherals share the same IRQ entry.
 ****************************************************************************/

/****************************************************************************
 * Included Files
 ****************************************************************************/

#include <arch_interrupt.h>
#include <xs_base.h>
#include <xs_isr.h>

/****************************************************************************
 * Public Data
 ****************************************************************************/

volatile uint32_t *g_current_regs;

/****************************************************************************
 * Public Functions
 ****************************************************************************/

/* Function exported to the NuttX kernel */

void up_mdelay(unsigned int time)
{
  while (time--)
    {
      volatile int dummy = 200000;
      while (dummy--)
        {
        }
    }
}

/****************************************************************************
 * Name: up_disable_irq
 *
 * Description:
 *   Disable the IRQ specified by 'irq'. Mind the Machine privilege.
 *
 ****************************************************************************/

int ArchDisableHwIrq(uint32_t irq_num)
{
  FCEU->MASK_IRQ_AND = (1UL << irq_num);
}
/****************************************************************************
 * Name: up_enable_irq
 *
 * Description:
 *   Enable the IRQ specified by 'irq'. Mind the Machine privilege.
 *
 ****************************************************************************/

int ArchEnableHwIrq(uint32_t irq_num)
{
  FCEU->MASK_IRQ_OR = (1 << irq_num);
}




/****************************************************************************
 * Name: up_ack_irq
 *
 * Description:
 *   Acknowledge the IRQ
 *
 ****************************************************************************/

static inline void up_ack_irq(int irq)
{
}

/****************************************************************************
 * Name: _current_privilege
 *
 * Description:
 *   Get the current privilege mode. 0x0 for user mode, and 0x3 for machine
 *   mode.
 *
 ****************************************************************************/

static inline uint32_t _current_privilege(void)
{
  uint32_t result;

  asm volatile ("csrr %0, 0xC10" : "=r" (result));

  return result;
}
/****************************************************************************
 * Name: up_irq_restore
 *
 * Description:
 *   Restore previous IRQ mask state
 *
 ****************************************************************************/

static inline void up_irq_restore(unsigned int pri)
{
  if (_current_privilege())
    {
      /* Machine mode - mstatus */

      asm volatile("csrw 0x300, %0" : /* no output */ : "r" (pri));
    }
  else
    {
      /* User mode - ustatus */

      asm volatile("csrw 0x000, %0" : /* no output */ : "r" (pri));
    }
}
/****************************************************************************
 * Name: up_irq_save
 *
 * Description:
 *   Disable interrupt and return the current interrupt state.
 *
 ****************************************************************************/

 x_base up_irq_save(void)
{
  x_base oldstat;
  x_base newstat;

  if (_current_privilege())
    {
      /* Machine mode: Unset MIE and UIE */

      asm volatile ("csrr %0, 0x300": "=r" (oldstat));
      newstat = oldstat & ~(0x9);
      asm volatile("csrw 0x300, %0" : /* no output */ : "r" (newstat));
    }
  else
    {
      /* User mode: Unset UIE */

      asm volatile ("csrr %0, 0x000": "=r" (oldstat));
      newstat = oldstat & ~(1L << 0);
      asm volatile("csrw 0x000, %0" : /* no output */ : "r" (newstat));
    }

  return oldstat;
}
/****************************************************************************
 * Name: up_irq_save
 *
 * Description:
 *   Disable interrupt and return the current interrupt state.
 *
 ****************************************************************************/

x_base DisableLocalInterrupt(void)
{
  // x_base oldstat;
  // x_base newstat;

  // if (_current_privilege())
  //   {
  //     /* Machine mode: Unset MIE and UIE */
      // asm volatile("nop");
      // asm volatile ("csrr %0, 0x300": "=r" (oldstat));
      // newstat = oldstat & ~(0x9);
      // asm volatile("csrw 0x300, %0" : /* no output */ : "r" (newstat));
  //   }
  // else
  //   {
  //     /* User mode: Unset UIE */

  //     asm volatile ("csrr %0, 0x000": "=r" (oldstat));
  //     newstat = oldstat & ~(1L << 0);
  //     asm volatile("csrw 0x000, %0" : /* no output */ : "r" (newstat));
  //   }

  // return oldstat;

    x_base level;
    asm volatile("nop");
    asm volatile ("csrrci %0, mstatus, 8" : "=r"(level));

    return level;
}



/****************************************************************************
 * Name: up_irq_enable
 *
 * Description:
 *   Return the current interrupt state and enable interrupts
 *
 ****************************************************************************/

void EnableLocalInterrupt(x_base oldstat)
{
  x_base newstat;

  // if (_current_privilege())
  //   {
  //     /* Machine mode: Set MIE and UIE */
      // asm volatile("nop");
      // asm volatile ("csrr %0, 0x300": "=r" (oldstat));
      // newstat = oldstat | (0x8);
      // // asm volatile("csrw 0x300, %0" : /* no output */ : "r" (newstat));
      // asm volatile("csrw mstatus, %0" : /* no output */ : "r" (newstat));
  //   }
  // else
  //   {
  //     /* User mode: Set UIE */

  //     asm volatile ("csrr %0, 0x000": "=r" (oldstat));
  //     newstat = oldstat | (1L << 0);
  //     asm volatile("csrw 0x000, %0" : /* no output */ : "r" (newstat));
  //   }
  asm volatile ("csrw mstatus, %0" :: "r"(oldstat));
}

/****************************************************************************
 * Name: gap8_sleep_wait_sw_evnt
 *
 * Description:
 *   Sleep on specific event.
 *
 ****************************************************************************/

// static inline void gap8_sleep_wait_sw_evnt(uint32_t event_mask)
// {
//   FCEU->MASK_OR = event_mask;
//   __builtin_pulp_event_unit_read((void *)&FCEU->EVENT_WAIT_CLEAR, 0);
//   FCEU->MASK_AND = event_mask;
// }

/****************************************************************************
 * Public Function Prototypes
 *


/****************************************************************************
 * Name: up_get_newintctx
 *
 * Description:
 *   Return a value for EPIC. But GAP8 doesn't use EPIC for event control.
 *
 ****************************************************************************/

uint32_t up_get_newintctx(void)
{
  return 0;
}

/****************************************************************************
 * Name: up_irqinitialize
 *
 * Description:
 *   Initialize the IRQ on FC.
 *
 ****************************************************************************/
extern void gap8_udma_doirq(int irq, void *arg);
void irqinitialize(void)
{
  x_base level;
  /* Deactivate all the soc events */

  SOC_EU->FC_MASK_MSB = 0xffffffff;
  SOC_EU->FC_MASK_LSB = 0xffffffff;

  /* enable soc peripheral interrupt */

  isrManager.done->registerIrq(GAP8_IRQ_FC_UDMA, gap8_udma_doirq, NONE);
  isrManager.done->enableIrq(GAP8_IRQ_FC_UDMA);

  /* Attach system call handler */

  // extern int up_swint(int irq, FAR void *context, FAR void *arg);
  // RegisterHwIrq(GAP8_IRQ_SYSCALL, up_swint, NULL);

  // EnableLocalInterrupt(0);
}

/****************************************************************************
 * Name: gap8_dispatch_irq
 *
 * Description:
 *   Called from IRQ vectors. Input vector id. Return SP pointer, modified
 *   or not.
 *
 ****************************************************************************/
extern  void KTaskOsAssignAfterIrq(void *context);

void *gap8_dispatch_irq(uint32_t vector, void *current_regs)
{
  /* Clear pending bit and trigger a software event.
   * GAP8 would sleep on sw event 3 on up_idle().
   */
  
  FCEU->BUFFER_CLEAR = (1 << vector);
  EU_SW_EVNT_TRIG->TRIGGER_SET[3] = 0;

  /* Call nuttx kernel, which may change curr_regs, to perform
   * a context switch
   */

  g_current_regs = current_regs;
  // irq_dispatch(vector, current_regs);

  isrManager.done->incCounter();
  isrManager.done->handleIrq(vector);
  
  isrManager.done->decCounter();

  KTaskOsAssignAfterIrq(current_regs);

  current_regs = (void *)g_current_regs;
  g_current_regs = NONE;

  return current_regs;
}


