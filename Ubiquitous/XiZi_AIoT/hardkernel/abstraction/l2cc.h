/*
 * Copyright (c) 2022 AIIT XUOS Lab
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
 * @file l2cc.h
 * @brief the general management of L2 cache
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.8.10
 */



/****************************************************************************
 * Included Files
 ****************************************************************************/

#define CONFIG_ARCH_L2CACHE

#ifdef CONFIG_ARCH_L2CACHE

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

/****************************************************************************
 * Public Data
 ****************************************************************************/

#ifndef __ASSEMBLY__
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
 * Name: arm_l2ccinitialize
 *
 * Description:
 *   One time configuration of the L2 cache.  The L2 cache will be enabled
 *   upon return.
 *
 * Input Parameters:
 *   None.  The L2 cache configuration is controlled by configuration
 *   settings.
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

#if 0 /* Prototyped in arm_internal.h */
void arm_l2ccinitialize(void);
#endif

/****************************************************************************
 * Name: l2cc_enable
 *
 * Description:
 *    Re-enable the L2CC-P310 L2 cache by setting the enable bit in the
 *    Control Register (CR)
 *
 * Input Parameters:
 *    None
 *
 * Returned Value:
 *    None
 *
 ****************************************************************************/

void EnableL2Cache(void);

/****************************************************************************
 * Name: l2cc_disable
 *
 * Description:
 *    Disable the L2 cache
 *
 * Input Parameters:
 *    None
 *
 * Returned Value:
 *    None
 *
 ****************************************************************************/

void DisableL2Cache(void);

/****************************************************************************
 * Name: l2cc_sync
 *
 * Description:
 *   Drain the L2 cache.
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void SyncL2Cache(void);

/****************************************************************************
 * Name: l2cc_invalidate_all
 *
 * Description:
 *   Invalidate the entire L2 cache.
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void InvalidateL2CacheAll(void);

/****************************************************************************
 * Name: l2cc_invalidate
 *
 * Description:
 *   Invalidate a range of addresses in the L2 cache
 *
 * Input Parameters:
 *   startaddr - The first address to be invalidated
 *   endaddr   - The last address to be invalidated
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void InvalidateL2Cache(uintptr_t startaddr, uintptr_t endaddr);

/****************************************************************************
 * Name: l2cc_clean_all
 *
 * Description:
 *   Clean the entire L2 cache.
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void CleanL2CacheAll(void);

/****************************************************************************
 * Name: l2cc_clean
 *
 * Description:
 *   Clean a range of address within the L2 cache.
 *
 * Input Parameters:
 *   startaddr - The first address to be cleaned
 *   endaddr   - The last address to be cleaned
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void CleanL2Cache(uintptr_t startaddr, uintptr_t endaddr);

/****************************************************************************
 * Name: l2cc_flush_all
 *
 * Description:
 *   Flush the entire L2 cache.
 *
 * Input Parameters:
 *   None
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void FlushL2CacheAll(void);

/****************************************************************************
 * Name: l2cc_flush
 *
 * Description:
 *   Flush a range of address within the L2 cache.
 *
 * Input Parameters:
 *   startaddr - The first address to be flushed
 *   endaddr   - The last address to be flushed
 *
 * Returned Value:
 *   None
 *
 ****************************************************************************/

void FlushL2Cache(uint32_t startaddr, uint32_t endaddr);

#undef EXTERN
#ifdef __cplusplus
}
#endif
#endif /* __ASSEMBLY__ */

#else /* CONFIG_ARCH_L2CACHE */
  /* Provide simple definitions to concentrate the inline conditional
   * compilation in one place.
   */

#  define EnableL2Cache()
#  define DisableL2Cache()
#  define SyncL2Cache()
#  define InvalidateL2CacheAll()
#  define InvalidateL2Cache(s,e)
#  define CleanL2CacheAll()
#  define CleanL2Cache(s,e)
#  define FlushL2CacheAll()
#  define FlushL2Cache(s,e)

#endif /* CONFIG_ARCH_L2CACHE */

