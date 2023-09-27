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
* @file:    cache.c
* @brief:   the general management of cache
* @version: 3.0
* @author:  AIIT XUOS Lab
* @date:    2023/4/27
*
*/



#include "cache.h"
#include "cp15_cacheops.h"
#include "barriers.h"
#include "l1cache.h"
#include "l2cc.h"

/****************************************************************************
 * Public Functions
 ****************************************************************************/
struct ICacheDone
{
    uint32_t (*enable) (void );
    uint32_t (*disable) (void);
    uint32_t (*invalidate) (uintptr_t start, uintptr_t end);
    uint32_t (*invalidateall) (void );
};

static const struct ICacheDone icache_done =
{
    .enable  = enable_icache,
    .disable = disable_icache,
    .invalidate = invalidate_icache,
    .invalidateall = invalidate_icache_all,
};


struct DCacheDone
{
     uint32_t (*enable) (void );
    uint32_t (*disable) (void);
    uint32_t (*clean) (uintptr_t start, uintptr_t end);
    uint32_t (*flush) (uintptr_t start, uintptr_t end);
    uint32_t (*invalidate) (uintptr_t start, uintptr_t end);
    uint32_t (*cleanall) (void);
    uint32_t (*flushall) (void);
    uint32_t (*invalidateall) (void);
};

static const struct DCacheDone dcache_done =
{
    .enable  = enable_dcache,
    .disable = disable_dcache,
    .clean = clean_dcache,
    .flush = flush_dcache,
    .invalidate = invalidate_dcache,
    .cleanall = clean_dcache_all,
    .flushall = flush_dcache_all,
    .invalidateall = invalidate_dcache_all,
};


/****************************************************************************
 * Name: invalidate_dcache
 *
 * Description:
 *   Invalidate the data cache within the specified region; we will be
 *   performing a DMA operation in this region and we want to purge old data
 *   in the cache.
 *
 * Input Parameters:
 *   start - virtual start address of region
 *   end   - virtual end address of region + 1
 *
 * Returned Value:
 *   None
 *
 * Assumptions:
 *   This operation is not atomic.  This function assumes that the caller
 *   has exclusive access to the address range so that no harm is done if
 *   the operation is pre-empted.
 *
 ****************************************************************************/

void invalidate_dcache(uintptr_t start, uintptr_t end)
{
  InvalidateL1Dcache(start, end);
  InvalidateL2Cache(start, end);
}

/****************************************************************************
 * Name: invalidate_dcache_all
 *
 * Description:
 *   Invalidate the entire contents of D cache.
 *
 *   NOTE: This function forces L1 and L2 cache operations to be atomic
 *   by disabling interrupts.
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void invalidate_dcache_all(void)
{
    InvalidateL1DcacheAll();

#ifdef CONFIG_ARCH_L2CACHE
    InvalidateL2CacheAll();
#endif

}

/****************************************************************************
 * Name: invalidate_icache
 *
 * Description:
 *   Invalidate the instruction cache within the specified region.
 *
 * Input Parameters:
 *   start - virtual start address of region
 *   end   - virtual end address of region + 1
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/
void invalidate_icache(uintptr_t start, uintptr_t end)
{
   InvalidateL1Icache(start, end);
}

/****************************************************************************
 * Name: invalidate_icache_all
 *
 * Description:
 *   Invalidate all instruction caches to PoU, also flushes branch target
 *   cache
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void invalidate_icache_all(void)
{
  InvalidateL1IcacheAll();
}

/****************************************************************************
 * Name: clean_dcache
 *
 * Description:
 *   Clean the data cache within the specified region by flushing the
 *   contents of the data cache to memory.
 *
 * Input Parameters:
 *   start - virtual start address of region
 *   end   - virtual end address of region + 1
 *
 * Returned Value:
 *   None
 *
 * Assumptions:
 *   This operation is not atomic.  This function assumes that the caller
 *   has exclusive access to the address range so that no harm is done if
 *   the operation is pre-empted.
 *
 ****************************************************************************/

void clean_dcache(uintptr_t start, uintptr_t end)
{

  CleanL1Dcache(start, end);
  CleanL2Cache(start, end);
}

/****************************************************************************
 * Name: clean_dcache_all
 *
 * Description:
 *   Clean the entire data cache within the specified region by flushing the
 *   contents of the data cache to memory.
 *
 *   NOTE: This operation is un-necessary if the DCACHE is configured in
 *   write-through mode.
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 * Assumptions:
 *   This operation is not atomic.  This function assumes that the caller
 *   has exclusive access to the address range so that no harm is done if
 *   the operation is pre-empted.
 *
 ****************************************************************************/

void clean_dcache_all(void)
{
  CleanL1DcacheAll();
  CleanL2CacheAll();
}

/****************************************************************************
 * Name: flush_dcache
 *
 * Description:
 *   Flush the data cache within the specified region by cleaning and
 *   invalidating the D cache.
 *
 * Input Parameters:
 *   start - virtual start address of region
 *   end   - virtual end address of region + 1
 *
 * Returned Value:
 *   None
 *
 * Assumptions:
 *   This operation is not atomic.  This function assumes that the caller
 *   has exclusive access to the address range so that no harm is done if
 *   the operation is pre-empted.
 *
 ****************************************************************************/

void flush_dcache(uintptr_t start, uintptr_t end)
{

  FlushL1Dcache(start, end);
   

  FlushL2Cache(start, end);
}

/****************************************************************************
 * Name: flush_dcache_all
 *
 * Description:
 *   Flush the entire data cache by cleaning and invalidating the D cache.
 *
 *   NOTE: If DCACHE write-through is configured, then this operation is the
 *   same as invalidate_cache_all().
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 * Assumptions:
 *   This operation is not atomic.  This function assumes that the caller
 *   has exclusive access to the address range so that no harm is done if
 *   the operation is pre-empted.
 *
 ****************************************************************************/

void flush_dcache_all(void)
{
  FlushL1DcacheAll();

  FlushL2CacheAll();
}

/****************************************************************************
 * Name: enable_icache
 *
 * Description:
 *   Enable the I-Cache
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void enable_icache(void)
{
  EnableL1Icache();
}

/****************************************************************************
 * Name: disable_icache
 *
 * Description:
 *   Disable the I-Cache
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void disable_icache(void)
{
  DisableL1Icache();
}

/****************************************************************************
 * Name: enable_dcache
 *
 * Description:
 *   Enable the D-Cache
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void enable_dcache(void)
{
  EnableL1Dcache();
  EnableL2Cache();
}

/****************************************************************************
 * Name: disable_dcache
 *
 * Description:
 *   Disable the D-Cache
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void disable_dcache(void)
{
  DisableL1Dcache();
  DisableL2Cache();
}


