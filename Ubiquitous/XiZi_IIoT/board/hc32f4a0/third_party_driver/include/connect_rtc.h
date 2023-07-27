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
* @file connect_rtc.h
* @brief define hc32f4a0-board rtc function and struct
* @version 3.0
* @author AIIT XUOS Lab
* @date 2023-02-02
*/

#ifndef CONNECT_I2C_H
#define CONNECT_I2C_H

#include <device.h>
#include <hc32_ll_rtc.h>

#ifdef __cplusplus
extern "C" {
#endif

int HwRtcInit(void);

#ifdef __cplusplus
}
#endif

#endif
