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

    .global cpu_get_current
  # int cpu_get_current(void)@
  # get current CPU ID
    .func cpu_get_current
cpu_get_current:
    mrs   x0, mpidr_el1
    and   x0, x0, #3
    ret
    .endfunc

    .global psci_call
psci_call:
        hvc #0
        ret


# ------------------------------------------------------------
# End of cortexA72.s
# ------------------------------------------------------------
    .end