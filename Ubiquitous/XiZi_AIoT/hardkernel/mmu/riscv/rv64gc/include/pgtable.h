#ifndef _XIUOS_PGTABLE_H
#define _XIUOS_PGTABLE_H

#include <asm/pfn.h>
#include <asm/pgtable.h>


/*
 * On almost all architectures and configurations, 0 can be used as the
 * upper ceiling to free_pgtables(): on many architectures it has the same
 * effect as using TASK_SIZE.  However, there is one configuration which
 * must impose a more careful limit, to avoid freeing kernel pgtables.
 */
#ifndef USER_PGTABLES_CEILING
#define USER_PGTABLES_CEILING	0UL
#endif

/*
 * This defines the first usable user address. Platforms
 * can override its value with custom FIRST_USER_ADDRESS
 * defined in their respective <asm/pgtable.h>.
 */
#ifndef FIRST_USER_ADDRESS
#define FIRST_USER_ADDRESS	0UL
#endif

/*
 * This defines the generic helper for accessing PMD page
 * table page. Although platforms can still override this
 * via their respective <asm/pgtable.h>.
 */
#ifndef pmd_pgtable
#define pmd_pgtable(pmd) pmd_page(pmd)
#endif

/*
 * A page table page can be thought of an array like this: pXd_t[PTRS_PER_PxD]
 *
 * The pXx_index() functions return the index of the entry in the page
 * table page which would control the given virtual address
 *
 * As these functions may be used by the same code for different levels of
 * the page table folding, they are always available, regardless of
 * CONFIG_PGTABLE_LEVELS value. For the folded levels they simply return 0
 * because in such cases PTRS_PER_PxD equals 1.
 */

static inline unsigned long pte_index(unsigned long address)
{
	return (address >> PAGE_SHIFT) & (PTRS_PER_PTE - 1);
}

#ifndef pmd_index
static inline unsigned long pmd_index(unsigned long address)
{
	return (address >> PMD_SHIFT) & (PTRS_PER_PMD - 1);
}
#define pmd_index pmd_index
#endif


#ifndef pgd_index
/* Must be a compile-time constant, so implement it as a macro */
#define pgd_index(a)  (((a) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
#endif

#ifndef pte_offset_kernel
static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
{
	return (pte_t *)pmd_page_vaddr(*pmd) + pte_index(address);
}
#define pte_offset_kernel pte_offset_kernel
#endif


#endif /* _XIUOS_PGTABLE_H */
