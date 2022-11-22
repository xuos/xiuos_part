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
 * @file control_io.c
 * @brief low level io code for control framework 
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2022-11-21
 */

#include <control_io.h>

/**
 * @description: Control Framework Socket Init
 * @param ip - local ip pointer
 * @param mask - netmask pointer
 * @param gw - gateway pointer
 * @return
 */
void SocketInit(char *ip, char *mask, char *gw)
{
#ifdef BSP_USING_LWIP
    lwip_config_tcp(0, ip, mask, gw);
#endif
}

/**
 * @description: Control Framework Serial Init
 * @param baud_rate - baud rate
 * @param data_bits - data bits
 * @param stop_bits - stop bits
 * @param check_mode - check mode
 * @return
 */
void SerialInit(uint32_t baud_rate, uint8_t data_bits, uint8_t stop_bits, uint8_t check_mode)
{
    // Uart485Init(baud_rate, data_bits, stop_bits, check_mode);
}
