/**
 * @file gicv3_distributer.c
 * @brief gicv3_distributer
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2024.05.10
 */

/*************************************************
File name: gicv3_distributer.c
Description: gicv3_distributer operation
Others:
History:
Author: AIIT XUOS Lab
Modification:
*************************************************/
#include "string.h"

#include "gicv3_common_opa.h"
#include "gicv3_registers.h"

static inline gicd_t* gic_get_gicd(void)
{
    uint64_t base = get_arm_private_peripheral_base() + kGICDBaseOffset;
    return (gicd_t*)base;
}

void gic_set_cpu_target(uint32_t irqID, unsigned cpuNumber, bool enableIt)
{
    // Make sure the CPU number is valid.
    gicd_t* gicd = gic_get_gicd();
    uint8_t cpuMask = 1 << cpuNumber;

    if (enableIt) {
        gicd->ITARGETSRn[irqID] |= (cpuMask & 0xff);
    } else {
        gicd->ITARGETSRn[irqID] &= ~(cpuMask & 0xff);
    }
}

void gic_set_irq_security(uint32_t irqID, bool isSecure)
{
    gicd_t* gicd = gic_get_gicd();

    uint32_t reg = irq_get_register_offset(irqID);
    uint32_t mask = irq_get_bit_mask(irqID);

    uint32_t value = gicd->IGROUPRn[reg];
    if (!isSecure) {
        value &= ~mask;
    } else {
        value |= mask;
    }
    gicd->IGROUPRn[reg] = value;
}

void gic_enable_irq(uint32_t irqID, bool isEnabled)
{
    gicd_t* gicd = gic_get_gicd();

    uint32_t reg = irq_get_register_offset(irqID);
    uint32_t mask = irq_get_bit_mask(irqID);

    // Select set-enable or clear-enable register based on enable flag.
    if (isEnabled) {
        gicd->ISENABLERn[reg] = mask;
    } else {
        gicd->ICENABLERn[reg] = mask;
    }
}

void gic_set_irq_priority(uint32_t ID, uint32_t priority)
{
    gicd_t* gicd = gic_get_gicd();

    gicd->IPRIORITYRn[ID] = priority & 0xff;
}
