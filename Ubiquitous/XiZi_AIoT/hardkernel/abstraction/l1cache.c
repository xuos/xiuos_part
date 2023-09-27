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
* @file:    l1cache.c
* @brief:   the general management of L1 cache
* @version: 3.0
* @author:  AIIT XUOS Lab
* @date:    2023/4/27
*
*/

#include "l1cache.h"
#include "cp15_cacheops.h"
#include "barriers.h"

void InvalidateL1Dcache(uintptr_t start, uintptr_t end)
{
    size_t length=end-start;
    void* addr=start;

    uint32_t va;
    uint32_t csidr = 0, line_size = 0;
    
    // get the cache line size
    _ARM_MRC(15, 1, csidr, 0, 0, 0);
    line_size = 1 << ((csidr & 0x7) + 4);

    // align the address with line
    const void * end_addr = (const void *)((uint32_t)addr + length);
            
    do
    {
        // Clean data cache line to PoC (Point of Coherence) by va. 
        va = (uint32_t) ((uint32_t)addr & (~(line_size - 1))); //addr & va_VIRTUAL_ADDRESS_MASK
        _ARM_MCR(15, 0, va, 7, 6, 1);
        // increment addres to next line and decrement lenght 
        addr = (const void *) ((uint32_t)addr + line_size);
    } while (addr < end_addr);
    
    // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
    _ARM_DSB();
}

void InvalidateL1DcacheAll(void)
{
  uint32_t csid;    // Cache Size ID
    uint32_t wayset;  // wayset parameter 
    int num_sets; // number of sets  
    int num_ways; // number of ways

    _ARM_MRC(15, 1, csid, 0, 0, 0);    // Read Cache Size ID 
    
    // Fill number of sets  and number of ways from csid register  This walues are decremented by 1
    num_ways = (csid >> 0x03) & 0x3FFu; //((csid& csid_ASSOCIATIVITY_MASK) >> csid_ASSOCIATIVITY_SHIFT)
    
    // Invalidation all lines (all Sets in all ways) 
    while (num_ways >= 0)
    {
        num_sets = (csid >> 0x0D) & 0x7FFFu; //((csid & csid_NUMSETS_MASK) >> csid_NUMSETS_SHIFT)
        while (num_sets >= 0 )
        {
            wayset = (num_sets << 5u) | (num_ways << 30u); //(num_sets << SETWAY_SET_SHIFT) | (num_sets << 3SETWAY_WAY_SHIFT)
            // invalidate line if we know set and way 
            _ARM_MCR(15, 0, wayset, 7, 6, 2);
            num_sets--;
        }
        num_ways--;
    }
    
    // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
    _ARM_DSB();
}


void CleanL1Dcache(uintptr_t start, uintptr_t end)
{
  void* addr=start;
  size_t length=end-start;
    uint32_t va;
    uint32_t csidr = 0, line_size = 0;
    const void * end_addr = (const void *)((uint32_t)addr + length);

    // get the cache line size
    _ARM_MRC(15, 1, csidr, 0, 0, 0);
    line_size = 1 << ((csidr & 0x7) + 4);
    
    do
    {
        // Clean data cache line to PoC (Point of Coherence) by va. 
        va = (uint32_t) ((uint32_t)addr & (~(line_size  - 1))); //addr & va_VIRTUAL_ADDRESS_MASK
        _ARM_MCR(15, 0, va, 7, 10, 1);
        
        // increment addres to next line and decrement lenght 
        addr = (const void *) ((uint32_t)addr + line_size);
    } while (addr < end_addr);
    
    // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
    _ARM_DSB();
}

void CleanL1DcacheAll(void)
{
    uint32_t csid;    // Cache Size ID
    uint32_t wayset;  // wayset parameter 
    int num_sets; // number of sets  
    int num_ways; // number of ways

    _ARM_MRC(15, 1, csid, 0, 0, 0);    // Read Cache Size ID 
    
    // Fill number of sets  and number of ways from csid register  This walues are decremented by 1
    num_ways = (csid >> 0x03) & 0x3FFu; //((csid& csid_ASSOCIATIVITY_MASK) >> csid_ASSOCIATIVITY_SHIFT`)
    while (num_ways >= 0)
    {
        num_sets = (csid >> 0x0D) & 0x7FFFu; //((csid & csid_NUMSETS_MASK)      >> csid_NUMSETS_SHIFT       )
        while (num_sets >= 0 )
        {
            wayset = (num_sets << 5u) | (num_ways << 30u); //(num_sets << SETWAY_SET_SHIFT) | (num_ways << 3SETWAY_WAY_SHIFT)
            // FLUSH (clean) line if we know set and way 
            _ARM_MCR(15, 0, wayset, 7, 10, 2);
            num_sets--;
        }
        num_ways--;
    }
    
    // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
    _ARM_DSB();
}

void FlushL1Dcache(uintptr_t start, uintptr_t end)
{
    void* addr=start;
    size_t length=end-start;
    uint32_t va;
    uint32_t csidr = 0, line_size = 0;
    const void * end_addr = (const void *)((uint32_t)end);

    // get the cache line size
    _ARM_MRC(15, 1, csidr, 0, 0, 0);
    line_size = 1 << ((csidr & 0x7) + 4);
    
    do
    {
        // Clean data cache line to PoC (Point of Coherence) by va. 
        va = (uint32_t) ((uint32_t)addr & (~(line_size  - 1))); //addr & va_VIRTUAL_ADDRESS_MASK
        _ARM_MCR(15, 0, va, 7, 14, 1);
        
        // increment addres to next line and decrement lenght 
        addr = (const void *) ((uint32_t)addr + line_size);
    } while (addr < end_addr);
    
    // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
    _ARM_DSB();
}

void FlushL1DcacheAll(void)
{
    uint32_t csid;    // Cache Size ID
    uint32_t wayset;  // wayset parameter 
    int num_sets; // number of sets  
    int num_ways; // number of ways

    _ARM_MRC(15, 1, csid, 0, 0, 0);    // Read Cache Size ID 
    
    // Fill number of sets  and number of ways from csid register  This walues are decremented by 1
    num_ways = (csid >> 0x03) & 0x3FFu; //((csid& csid_ASSOCIATIVITY_MASK) >> csid_ASSOCIATIVITY_SHIFT`)
    while (num_ways >= 0)
    {
        num_sets = (csid >> 0x0D) & 0x7FFFu; //((csid & csid_NUMSETS_MASK)      >> csid_NUMSETS_SHIFT       )
        while (num_sets >= 0 )
        {
            wayset = (num_sets << 5u) | (num_ways << 30u); //(num_sets << SETWAY_SET_SHIFT) | (num_ways << 3SETWAY_WAY_SHIFT)
            // FLUSH (clean) line if we know set and way 
            _ARM_MCR(15, 0, wayset, 7, 14, 2);
            num_sets--;
        }
        num_ways--;
    }
    
    // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
    _ARM_DSB();
}

void InvalidateL1IcacheAll()
{
    uint32_t SBZ = 0x0u;
    
    _ARM_MCR(15, 0, SBZ, 7, 5, 0);
    
    // synchronize context on this processor 
    _ARM_ISB();
}

void InvalidateL1Icache(uintptr_t start, uintptr_t end)
{
    void* addr=start;
    uint32_t va;
    uint32_t csidr = 0, line_size = 0;
    const void * end_addr = (const void *)((uint32_t)end);

    // get the cache line size
    _ARM_MRC(15, 1, csidr, 0, 0, 0);
    line_size = 1 << ((csidr & 0x7) + 4);    
    
    do
    {
        // Clean data cache line to PoC (Point of Coherence) by va. 
        va = (uint32_t) ((uint32_t)addr & (~(line_size - 1))); //addr & va_VIRTUAL_ADDRESS_MASK
        _ARM_MCR(15, 0, va, 7, 5, 1);
        // increment addres to next line and decrement lenght 
        addr = (const void *) ((uint32_t)addr + line_size);
    } while (addr < end_addr);
    
    // synchronize context on this processor 
    _ARM_ISB();
}

void EnableL1Icache(void)
{
    uint32_t sctlr  ;// System Control Register 
    
    // read sctlr 
    _ARM_MRC(15, 0, sctlr, 1, 0, 0);
    
    // ignore the operation if I is enabled already
    if(!(sctlr & BM_SCTLR_I))
    {	
        // set  I bit (instruction caching enable)
        sctlr |= BM_SCTLR_I;
        
        // write modified sctlr
        _ARM_MCR(15, 0, sctlr, 1, 0, 0);
        
        // synchronize context on this processor 
        _ARM_ISB();
    }
}

void DisableL1Icache()
{
    uint32_t sctlr  ;// System Control Register 
    
    // read sctlr 
    _ARM_MRC(15, 0, sctlr, 1, 0, 0);
    
    // Clear  I bit (instruction caching enable) 
    sctlr &= ~BM_SCTLR_I;

    // write modified sctlr
    _ARM_MCR(15, 0, sctlr, 1, 0, 0);
    
    // synchronize context on this processor 
    _ARM_ISB();
}

void EnableL1Dcache()
{
    uint32_t sctlr; // System Control Register 
    
    // read sctlr 
    _ARM_MRC(15, 0, sctlr, 1, 0, 0);
        
    if (!(sctlr & BM_SCTLR_C))
    {
        // set  C bit (data caching enable) 
        sctlr |= BM_SCTLR_C;
        
        // write modified sctlr
        _ARM_MCR(15, 0, sctlr, 1, 0, 0);
        
        // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
        _ARM_DSB();
    }
}

void DisableL1Dcache()
{
    uint32_t sctlr; // System Control Register 
    
    // read sctlr 
    _ARM_MRC(15, 0, sctlr, 1, 0, 0);
    
    // set  C bit (data caching enable) 
    sctlr &= ~BM_SCTLR_C;

    // write modified sctlr
    _ARM_MCR(15, 0, sctlr, 1, 0, 0);
    
    // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
    _ARM_DSB();
}