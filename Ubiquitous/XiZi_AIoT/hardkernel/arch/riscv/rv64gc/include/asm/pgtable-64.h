/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Copyright (C) 2012 Regents of the University of California
 */

#ifndef _ASM_RISCV_PGTABLE_64_H
#define _ASM_RISCV_PGTABLE_64_H

#include <asm/const.h>
#include <asm/pgtable-bits.h>

#define PGDIR_SHIFT     30
/* Size of region mapped by a page global directory */
#define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
#define PGDIR_MASK      (~(PGDIR_SIZE - 1))

#define PMD_SHIFT       21
/* Size of region mapped by a page middle directory */
#define PMD_SIZE        (_AC(1, UL) << PMD_SHIFT)
#define PMD_MASK        (~(PMD_SIZE - 1))

/* Page Middle Directory entry */
typedef struct {
	unsigned long pmd;
} pmd_t;

#define pmd_val(x)      ((x).pmd)
#define __pmd(x)        ((pmd_t) { (x) })

#define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))

static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
{
	return __pmd((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
}

static inline unsigned long _pmd_pfn(pmd_t pmd)
{
	return pmd_val(pmd) >> _PAGE_PFN_SHIFT;
}

#define mk_pmd(page, prot)    pfn_pmd(page_to_pfn(page), prot)

#define pmd_ERROR(e) \
	pr_err("%s:%d: bad pmd %016lx.\n", __FILE__, __LINE__, pmd_val(e))

#endif /* _ASM_RISCV_PGTABLE_64_H */
