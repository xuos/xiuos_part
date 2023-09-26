/****************************************************************************
 * include/nuttx/cache.h
 *
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.  The
 * ASF licenses this file to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance with the
 * License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
 * License for the specific language governing permissions and limitations
 * under the License.
 *
 ****************************************************************************/

#ifndef __INCLUDE_NUTTX_CACHE_H
#define __INCLUDE_NUTTX_CACHE_H

#ifndef __ASSEMBLY__

/****************************************************************************
 * Included Files
 ****************************************************************************/



#include <stdint.h>
#include <sys/types.h>

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

#ifdef __cplusplus
#define EXTERN extern "C"
extern "C"
{
#else
#define EXTERN extern
#endif

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/

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
 * Caution:
 *   The writable global variables aren't initialized yet.
 *
 ****************************************************************************/
void enable_icache(void);


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
void disable_icache(void);


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
void invalidate_icache(uintptr_t start, uintptr_t end);


/****************************************************************************
 * Name: invalidate_icache_all
 *
 * Description:
 *   Invalidate the entire contents of I cache.
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/


void invalidate_icache_all(void);

/****************************************************************************
 * Name: lock_icache
 *
 * Description:
 *   Prefetch and lock the instruction cache within the specified region.
 *   If the specified address if not present in the instruction cache,
 *   some architectures transfer the line from memory, others wait the
 *   address be read from memory, and then lock.
 *
 * Input Parameters:
 *   start - virtual start address of region
 *   end   - virtual end address of region + 1
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void lock_icache(uintptr_t start, uintptr_t end);


/****************************************************************************
 * Name: unlock_icache
 *
 * Description:
 *   Unlock the instruction cache within the specified region.
 *
 * Input Parameters:
 *   start - virtual start address of region
 *   end   - virtual end address of region + 1
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void unlock_icache(uintptr_t start, uintptr_t end);


/****************************************************************************
 * Name: unlock_icache_all
 *
 * Description:
 *   Unlock the entire contents of instruction cache.
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/


void unlock_icache_all(void);


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
 * Caution:
 *   The writable global variables aren't initialized yet.
 *
 ****************************************************************************/


void enable_dcache(void);


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


void disable_dcache(void);


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
 ****************************************************************************/


void invalidate_dcache(uintptr_t start, uintptr_t end);


/****************************************************************************
 * Name: invalidate_dcache_all
 *
 * Description:
 *   Invalidate the entire contents of D cache.
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/


void invalidate_dcache_all(void);


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
 ****************************************************************************/


void clean_dcache(uintptr_t start, uintptr_t end);


/****************************************************************************
 * Name: clean_dcache_all
 *
 * Description:
 *   Clean the entire data cache within the specified region by flushing the
 *   contents of the data cache to memory.
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/


void clean_dcache_all(void);


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
 ****************************************************************************/


void flush_dcache(uintptr_t start, uintptr_t end);


/****************************************************************************
 * Name: flush_dcache_all
 *
 * Description:
 *   Flush the entire data cache by cleaning and invalidating the D cache.
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/


void flush_dcache_all(void);


/****************************************************************************
 * Name: lock_dcache
 *
 * Description:
 *   Prefetch and lock the data cache within the specified region.
 *   If the specified address is not present in the data cache,
 *   some architectures transfer the line from memory, others wait the
 *   address be read from memory, and then lock.
 *
 * Input Parameters:
 *   start - virtual start address of region
 *   end   - virtual end address of region + 1
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/


void lock_dcache(uintptr_t start, uintptr_t end);


/****************************************************************************
 * Name: unlock_dcache
 *
 * Description:
 *   Unlock the data cache within the specified region.
 *
 * Input Parameters:
 *   start - virtual start address of region
 *   end   - virtual end address of region + 1
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void unlock_dcache(uintptr_t start, uintptr_t end);


/****************************************************************************
 * Name: unlock_dcache_all
 *
 * Description:
 *   Unlock the entire contents of data cache.
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/


void unlock_dcache_all(void);


/****************************************************************************
 * Name: coherent_dcache
 *
 * Description:
 *   Ensure that the I and D caches are coherent within specified region
 *   by cleaning the D cache (i.e., flushing the D cache contents to memory
 *   and invalidating the I cache. This is typically used when code has been
 *   written to a memory region, and will be executed.
 *
 * Input Parameters:
 *   addr - virtual start address of region
 *   len  - Size of the address region in bytes
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/


void coherent_dcache(uintptr_t addr, size_t len);


#undef EXTERN
#ifdef __cplusplus
}
#endif

#endif /* __ASSEMBLY__ */

#endif /* __INCLUDE_NUTTX_CACHE_H */
