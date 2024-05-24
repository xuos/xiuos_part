/*
 *
 *  Copyright (C) 2002 ARM Limited, All Rights Reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */
/**
 * @file gicv3_registers.h
 * @brief gicv3 registers
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2024.05.09
 */

/*************************************************
File name: gicv3_registers.c
Description: gicv3 registers
Others:
History:
Author: AIIT XUOS Lab
Modification:
1. Rename the file
*************************************************/

#ifndef __LINUX_IRQCHIP_ARM_GIC_H
#define __LINUX_IRQCHIP_ARM_GIC_H

// clang-format off
// interrupt controller GICv3
#define GICV3               (DEV_VRTMEM_BASE + 0x08000000L)
#define GICV3_REDIST        (DEV_VRTMEM_BASE + 0x080a0000L)

#define D_CTLR 0x0
#define D_TYPER 0x4
#define D_IGROUPR(n)        (0x80 + (uint64_t)(n) * 4)
#define D_ISENABLER(n)      (0x100 + (uint64_t)(n) * 4)
#define D_ICENABLER(n)      (0x180 + (uint64_t)(n) * 4)
#define D_ISPENDR(n)        (0x200 + (uint64_t)(n) * 4)
#define D_ICPENDR(n)        (0x280 + (uint64_t)(n) * 4)
#define D_IPRIORITYR(n)     (0x400 + (uint64_t)(n) * 4)
#define D_ITARGETSR(n)      (0x800 + (uint64_t)(n) * 4)
#define D_ICFGR(n)          (0xc00 + (uint64_t)(n) * 4)

#define R_CTLR              0x0
#define R_WAKER             0x14

#define SGI_BASE            0x10000
#define R_IGROUPR0          (SGI_BASE + 0x80)
#define R_ISENABLER0        (SGI_BASE + 0x100)
#define R_ICENABLER0        (SGI_BASE + 0x180)
#define R_ICPENDR0          (SGI_BASE + 0x280)
#define R_IPRIORITYR(n)     (SGI_BASE + 0x400 + (n) * 4)
#define R_ICFGR0            (SGI_BASE + 0xc00)
#define R_ICFGR1            (SGI_BASE + 0xc04)
#define R_IGRPMODR0         (SGI_BASE + 0xd00)

// clang-format on

#endif

#include <stdint.h>

enum _gic_base_offsets {
    kGICDBaseOffset = 0x10000, //!< GIC distributor offset.
    kGICCBaseOffset = 0x100 //!< GIC CPU interface offset.
};

//! @brief GIC distributor registers.
//!
//! Uses the GICv2 register names, but does not include GICv2 registers.
//!
//! The IPRIORITYRn and ITARGETSRn registers are byte accessible, so their types are uint8_t
//! instead of uint32_t to reflect this. These members are indexed directly with the interrupt
//! number.
struct _gicd_registers {
    uint32_t CTLR; //!< Distributor Control Register.
    uint32_t TYPER; //!< Interrupt Controller Type Register.
    uint32_t IIDR; //!< Distributor Implementer Identification Register.
    uint32_t _reserved0[29];
    uint32_t IGROUPRn[8]; //!< Interrupt Group Registers.
    uint32_t _reserved1[24];
    uint32_t ISENABLERn[32]; //!< Interrupt Set-Enable Registers.
    uint32_t ICENABLERn[32]; //!< Interrupt Clear-Enable Registers.
    uint32_t ISPENDRn[32]; //!< Interrupt Set-Pending Registers.
    uint32_t ICPENDRn[32]; //!< Interrupt Clear-Pending Registers.
    uint32_t ICDABRn[32]; //!< Active Bit Registers.
    uint32_t _reserved2[32];
    uint8_t IPRIORITYRn[255 * sizeof(uint32_t)]; //!< Interrupt Priority Registers. (Byte accessible)
    uint32_t _reserved3;
    uint8_t ITARGETSRn[255 * sizeof(uint32_t)]; //!< Interrupt Processor Targets Registers. (Byte accessible)
    uint32_t _reserved4;
    uint32_t ICFGRn[64]; //!< Interrupt Configuration Registers.
    uint32_t _reserved5[128];
    uint32_t SGIR; //!< Software Generated Interrupt Register
};

//! @brief Bitfields constants for the GICD_CTLR register.
enum _gicd_ctlr_fields {
    kBM_GICD_CTLR_EnableGrp1 = (1 << 1),
    kBM_GICD_CTLR_EnableGrp0 = (1 << 0)
};

enum _gicd_sgir_fields {
    kBP_GICD_SGIR_TargetListFilter = 24,
    kBM_GICD_SGIR_TargetListFilter = (0x3 << kBP_GICD_SGIR_TargetListFilter),

    kBP_GICD_SGIR_CPUTargetList = 16,
    kBM_GICD_SGIR_CPUTargetList = (0xff << kBP_GICD_SGIR_CPUTargetList),

    kBP_GICD_SGIR_NSATT = 15,
    kBM_GICD_SGIR_NSATT = (1 << kBP_GICD_SGIR_NSATT),

    kBP_GICD_SGIR_SGIINTID = 0,
    kBM_GICD_SGIR_SGIINTID = 0xf
};

typedef volatile struct _gicd_registers gicd_t;