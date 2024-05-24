/*!
 * @file cortexA72.s
 * @brief This file contains cortexA72 functions
 *
 */
/*************************************************
File name: cortexA72.S
Description: This file contains cortexA9 functions
Others: 
History:
1. Date: 202-05-08
Author: AIIT XUOS Lab
Modification:
1. No modifications
*************************************************/
    .section ".text","ax"
/*
 * bool arm_set_interrupt_state(bool enable)
 */
    .global arm_set_interrupt_state
    .func arm_set_interrupt_state

arm_set_interrupt_state:
    mrs     x2, spsr_el1
    cmp     x0, #0
    b.eq    disable_interrupts
    bic     x1, x2, #0xc0    // disable IRQ and FIQ
    b       set_interrupt_state_end

disable_interrupts:
    orr     x1, x2, #0xc0    // enable IRQ and FIQ

set_interrupt_state_end:
    msr     spsr_el1, x1
    // 测试x2的第7位（FIQ位）
    tst     x2, #0x80
    mov     x0, #1            //
    b.eq    fiq_set_to_0      // 
    ret

fiq_set_to_0:
    mov     x0, #0            // 如果FIQ位被设置，则设置x0为0
    ret

    .endfunc

    .global cpu_get_current
  # int cpu_get_current(void)@
  # get current CPU ID
    .func cpu_get_current
cpu_get_current:
    mrs   x0, mpidr_el1
    and   x0, x0, #3
    ret
    .endfunc

  .global get_arm_private_peripheral_base
  # uint32_t get_arm_private_peripheral_base(void)
  .func get_arm_private_peripheral_base
get_arm_private_peripheral_base: 

  # Get base address of private perpherial space
  # mrc     p15, 4, r0, c15, c0, 0   Read periph base address
  mov     x0, #0x00A00000
  ret
  
  .endfunc 

# ------------------------------------------------------------
# End of cortexA72.s
# ------------------------------------------------------------
    .end