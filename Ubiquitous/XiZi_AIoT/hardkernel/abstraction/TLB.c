

#define CP15_TLBIALLIS(r)  _CP15(0, r, c8, c3, 0)   /* Invalidate entire unified TLB Inner Shareable */
#define CP15_TLBIMVAIS(r)  _CP15(0, r, c8, c3, 1)   /* Invalidate unified TLB entry by MVA and ASID, Inner Shareable */
#define CP15_TLBIASIDIS(r) _CP15(0, r, c8, c3, 2)   /* Invalidate unified TLB by ASID match Inner Shareable */
#define CP15_TLBIMVAAIS(r) _CP15(0, r, c8, c3, 3)   /* Invalidate unified TLB entry by MVA all ASID Inner Shareable */
#define CP15_TLBIALL(r,c)  _CP15(0, r, c8, c, 0)    /* Invalidate entire instruction TLB. CRm = c5, c6, or c7 */
#define CP15_TLBIMVA(r,c)  _CP15(0, r, c8, c, 1)    /* Invalidate instruction TLB entry by MVA and ASID. CRm = c5, c6, or c7 */
#define CP15_TLBIASID(r,c) _CP15(0, r, c8, c, 2)    /* Invalidate data TLB by ASID match. CRm = c5, c6, or c7 */
#define CP15_TLBIMVAA(r,c) _CP15(0, r, c8, c, 3)    /* Invalidate unified TLB entry by MVA and ASID. CRm = c5, c6, or c7 */

void InvalidateTlbsAll(void)
{
  __asm__ __volatile__
    (
      "\tmcr p15, 0, r0, c8, c7, 0\n" /* TLBIALL */
      :
      :
      : "r0", "memory"
    );
}

void InvalidateTlbMVA(uint32_t vaddr)
{
  __asm__ __volatile__
    (
      "\tdsb\n"

      "\tmcr p15, 0, %0, c8, c7, 1\n" /* TLBIMVA */

      "\tdsb\n"
      "\tisb\n"
      :
      : "r" (vaddr)
      : "r1", "memory"
    );
}


void InvalidateTlbASID(uint32_t vaddr)
{
  __asm__ __volatile__
    (
      "\tdsb\n"
      
      "\tmcr p15, 0, %0, c8, c7, 2\n" /* TLBIASID */

      "\tdsb\n"
      "\tisb\n"
      :
      : "r" (vaddr)
      : "r1", "memory"
    );
}


