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
 * @file control_io.h
 * @brief code for control framework io adapter
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2022-11-21
 */

#ifndef CONTROL_IO_H
#define CONTROL_IO_H

#include <transform.h>
#include <list.h>

#ifdef BSP_USING_LWIP
#include "lwip/sys.h"
#include "lwip/sockets.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef BSP_USING_LWIP
#define socket_write lwip_write
#define socket_read  lwip_read
#endif

/*Control Framework Socket Init*/
void SocketInit(char *ip, char *mask, char *gw);

/*Control Framework Serial Init*/
void SerialInit(uint32_t baud_rate, uint8_t data_bits, uint8_t stop_bits, uint8_t check_mode);

#ifdef __cplusplus
}
#endif

#endif
