/* -----------------------------------------------------------------------------
 * Copyright (c) 2016 - 2017 ARM Ltd.
 *
 * This software is provided 'as-is', without any express or implied warranty.
 * In no event will the authors be held liable for any damages arising from
 * the use of this software. Permission is granted to anyone to use this
 * software for any purpose, including commercial applications, and to alter
 * it and redistribute it freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software in
 *    a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 *
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 *
 * 3. This notice may not be removed or altered from any source distribution.
 *
 *
 * $Date:        26. October 2017
 * $Revision:    V1.0.3
 *
 * Driver:       Driver_USART0, Driver_USART1, Driver_USART2, Driver_USART3
 *
 * Configured:   via RTE_Device.h configuration file
 * Project:      UART Driver for ARM CMSDK_CM device
 * --------------------------------------------------------------------------
 * Use the following configuration settings in the middleware component
 * to connect to this driver.
 *
 *   Configuration Setting                   Value   UART Interface
 *   ---------------------                   -----   --------------
 *   Connect to hardware via Driver_USART# = 0       use UART0
 *   Connect to hardware via Driver_USART# = 1       use UART1
 *   Connect to hardware via Driver_USART# = 2       use UART2
 *   Connect to hardware via Driver_USART# = 3       use UART3
 * -------------------------------------------------------------------------- */

/* History:
 *  Version 1.0.0
 *    Initial release
 *  Version 1.0.1
 *    Removed ARMCLANG warnings
 *  Version 1.0.2
 *    Removed ARMCLANG warnings
 *  Version 1.0.3
 *    Removed race condition in USARTTX_IRQHandler
 */

