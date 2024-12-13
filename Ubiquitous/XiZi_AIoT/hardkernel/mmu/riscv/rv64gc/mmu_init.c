/*
 * Copyright (c) 2020 AIIT XUOS Lab
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
 * @file 
 * @brief 
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2024.12.02
 */

/*************************************************
File name: mmu_init.c
Description:
Others:
History:
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include "asm/page.h"
#include "pgtable.h"
#include "memlayout.h"
#include "ns16550.h"


#define __ro_after_init __attribute__((section(".data..ro_after_init")))
#define __page_aligned_data     __attribute__((section(".data..page_aligned")))   __attribute__((aligned(PAGE_SIZE)))
#define __page_aligned_bss      __attribute__((section(".bss..page_aligned")))   __attribute__((aligned(PAGE_SIZE)))
#define __initdata	__attribute__((section(".init.data")))
#define __init		__attribute__((section(".init.text")))
#define __maybe_unused                  __attribute__((__unused__))


struct kernel_mapping kernel_map __ro_after_init;
extern char _start[];

unsigned long riscv_pfn_base __ro_after_init;

pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __attribute__((aligned(PAGE_SIZE)));

static pmd_t trampoline_pmd[PTRS_PER_PMD] __page_aligned_bss;
static pmd_t early_pmd[PTRS_PER_PMD] __initdata __attribute__((aligned(PAGE_SIZE)));
static pmd_t early_uart_pmd[PTRS_PER_PMD] __initdata __attribute__((aligned(PAGE_SIZE)));
static pmd_t early_pmd_free[((PHY_USER_FREEMEM_BASE - PHY_MEM_BASE) >> PGDIR_SHIFT) + 1][PTRS_PER_PMD] __initdata __attribute__((aligned(PAGE_SIZE)));
static pmd_t early_pmd_inear_map[PTRS_PER_PMD] __initdata __attribute__((aligned(PAGE_SIZE)));
static pmd_t early_plic_pmd[PTRS_PER_PMD] __initdata __attribute__((aligned(PAGE_SIZE)));


static pmd_t *__init get_pmd_virt_early(phys_addr_t pa)
{
	/* Before MMU is enabled */
	return (pmd_t *)((uintptr_t)pa);
}


static phys_addr_t __init alloc_pmd_early(uintptr_t va)
{
	return (uintptr_t)early_pmd;
}


static void __init create_pmd_mapping_early(pmd_t *pmdp,
				      uintptr_t va, phys_addr_t pa,
				      phys_addr_t sz, pgprot_t prot)
{
	uintptr_t pmd_idx = pmd_index(va);

	if (sz == PMD_SIZE) {
		if (pmd_none(pmdp[pmd_idx]))
			pmdp[pmd_idx] = pfn_pmd(PFN_DOWN(pa), prot);

		return;
	}
}

static void __init create_pgd_mapping_early(pgd_t *pgdp,
				      uintptr_t va, phys_addr_t pa,
				      phys_addr_t sz, pgprot_t prot)
{
	pmd_t *nextp;
	phys_addr_t next_phys;
	uintptr_t pgd_idx = pgd_index(va);

	if (sz == PGDIR_SIZE) {
		if (pgd_val(pgdp[pgd_idx]) == 0)
			pgdp[pgd_idx] = pfn_pgd(PFN_DOWN(pa), prot);
		return;
	}

	if (pgd_val(pgdp[pgd_idx]) == 0) {
		next_phys = alloc_pmd_early(va);
		pgdp[pgd_idx] = pfn_pgd(PFN_DOWN(next_phys), PAGE_TABLE);
		nextp = get_pmd_virt_early(next_phys);
		memset(nextp, 0, PAGE_SIZE);
	} else {
		next_phys = PFN_PHYS(_pgd_pfn(pgdp[pgd_idx]));
		nextp = get_pmd_virt_early(next_phys);
	}

	create_pmd_mapping_early(nextp, va, pa, sz, prot);
}

static void __init create_kernel_page_table_early(pgd_t *pgdir, bool early)
{
	uintptr_t va, end_va;

	end_va = kernel_map.virt_addr + kernel_map.size;
	for (va = kernel_map.virt_addr; va < end_va; va += PMD_SIZE) {
		create_pgd_mapping_early(pgdir, va,
				   kernel_map.phys_addr + (va - kernel_map.virt_addr),
				   PMD_SIZE,
				   PAGE_KERNEL_EXEC);
	}
}

static void __init create_kernel_pgd_mapping_free_early(pgd_t *pgdp,
				      uintptr_t va, phys_addr_t pa,
				      phys_addr_t sz, pgprot_t prot)
{
	pmd_t *nextp;
	phys_addr_t next_phys;
	uintptr_t pgd_idx = pgd_index(va);
	uintptr_t start_pgd_idx = pgd_index(kernel_map.virt_addr);

	if (pgd_val(pgdp[pgd_idx]) == 0) {
		next_phys = (uintptr_t)early_pmd_free[pgd_idx - start_pgd_idx];
		pgdp[pgd_idx] = pfn_pgd(PFN_DOWN(next_phys), PAGE_TABLE);
		nextp = get_pmd_virt_early(next_phys);
		memset(nextp, 0, PAGE_SIZE);
	} else {
		next_phys = PFN_PHYS(_pgd_pfn(pgdp[pgd_idx]));
		nextp = get_pmd_virt_early(next_phys);
	}

	create_pmd_mapping_early(nextp, va, pa, sz, prot);
}

static void __init create_kernel_page_table_free_early(pgd_t *pgdir, bool early)
{
	uintptr_t va, end_va;

	end_va = kernel_map.virt_addr + (PHY_USER_FREEMEM_BASE  - kernel_map.phys_addr);
	for (va = kernel_map.virt_addr + kernel_map.size; va < end_va; va += PMD_SIZE) {
		create_kernel_pgd_mapping_free_early(pgdir, va,
				   kernel_map.phys_addr + (va - kernel_map.virt_addr),
				   PMD_SIZE,
				   PAGE_KERNEL_EXEC);
	}
}

static void __init create_kernel_pgd_mapping_linear_map_early(pgd_t *pgdp,
				      uintptr_t va, phys_addr_t pa,
				      phys_addr_t sz, pgprot_t prot)
{
	pmd_t *nextp;
	phys_addr_t next_phys;
	uintptr_t pgd_idx = pgd_index(va);

	if (pgd_val(pgdp[pgd_idx]) == 0) {
		next_phys = (uintptr_t)early_pmd_inear_map;
		pgdp[pgd_idx] = pfn_pgd(PFN_DOWN(next_phys), PAGE_TABLE);
		nextp = get_pmd_virt_early(next_phys);
		memset(nextp, 0, PAGE_SIZE);
	} else {
		next_phys = PFN_PHYS(_pgd_pfn(pgdp[pgd_idx]));
		nextp = get_pmd_virt_early(next_phys);
	}

	create_pmd_mapping_early(nextp, va, pa, sz, prot);
}

static void __init create_kernel_page_table_linear_map_early(pgd_t *pgdir, bool early)
{
	uintptr_t va, end_va;

	end_va = kernel_map.phys_addr + kernel_map.size;
	for (va = kernel_map.phys_addr; va < end_va; va += PMD_SIZE) {
		create_kernel_pgd_mapping_linear_map_early(pgdir, va,
				   kernel_map.phys_addr + (va - kernel_map.phys_addr),
				   PMD_SIZE,
				   PAGE_KERNEL_EXEC);
	}
}


static void __init create_plic_page_table_early(pgd_t *pgdir, bool early)
{
	uintptr_t va;

	for (va = PLIC_PHYMEM_BASE; va < PLIC_PHYMEM_BASE + PLIC_MEM_SIZE; va += PMD_SIZE) {
		create_pgd_mapping_early(pgdir, va, (uintptr_t)early_plic_pmd, PGDIR_SIZE, PAGE_TABLE);
		create_pmd_mapping_early(early_plic_pmd, va, va, PMD_SIZE, PAGE_KERNEL);
	}
}

/*
 * setup_vm_early() is called from boot.S with MMU-off.
 *
 * Following requirements should be honoured for setup_vm() to work
 * correctly:
 * 1) It should use PC-relative addressing for accessing kernel symbols.
 *    To achieve this we always use GCC cmodel=medany.
 * 2) The compiler instrumentation for FTRACE will not work for setup_vm()
 *    so disable compiler instrumentation when FTRACE is enabled.
 */

void __init setup_vm_early(void)
{
	kernel_map.virt_addr = KERN_MEM_BASE;
	
	kernel_map.phys_addr = (uintptr_t)(&_start);
	kernel_map.size = (uintptr_t)(&_end) - kernel_map.phys_addr;

	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;

	riscv_pfn_base = PFN_DOWN(kernel_map.phys_addr);

	/* Setup trampoline PGD and PMD */
	create_pgd_mapping_early(trampoline_pg_dir, kernel_map.virt_addr, (uintptr_t)trampoline_pmd, PGDIR_SIZE, PAGE_TABLE);
	create_pmd_mapping_early(trampoline_pmd, kernel_map.virt_addr, kernel_map.phys_addr, PMD_SIZE, PAGE_KERNEL_EXEC);

	/*
	 * Setup early PGD covering entire kernel which will allow
	 * us to reach paging_init(). We map all memory banks later
	 * in setup_vm_final() below.
	 */
	create_kernel_page_table_early(early_pg_dir, true);

	/* Setup uart PGD and PMD */
	create_pgd_mapping_early(early_pg_dir, DEV_VRTMEM_BASE, (uintptr_t)early_uart_pmd, PGDIR_SIZE, PAGE_TABLE);
	create_pmd_mapping_early(early_uart_pmd, DEV_VRTMEM_BASE, DEV_PHYMEM_BASE, PMD_SIZE, PAGE_KERNEL);

	/* Setup kernel free PGD and PMD */
	create_kernel_page_table_free_early(early_pg_dir, true);

	/* Setup kernel linear map PGD and PMD */
	create_kernel_page_table_linear_map_early(early_pg_dir, true);

	/* Setup PLIC PGD and PMD */
	create_plic_page_table_early(early_pg_dir, true);
}

