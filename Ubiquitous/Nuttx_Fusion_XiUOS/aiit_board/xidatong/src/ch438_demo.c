/*
* Copyright (c) 2020 AIIT XUOS Lab
* XiOS is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*        http://license.coscl.org.cn/MulanPSL2
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
* See the Mulan PSL v2 for more details.
*/

/**
 * @file ch438_demo.c
 * @brief imxrt board sd card automount
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2022.04.26
 */

/****************************************************************************
 * Included Files
 ****************************************************************************/


#include <nuttx/config.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <nuttx/arch.h>

#include <unistd.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <debug.h>
#include <poll.h>
#include <fcntl.h>

#include "imxrt_ch438.h"

#define TMP (GPIO_OUTPUT | IOMUX_GOUT_DEFAULT | \
                            GPIO_PORT3 | GPIO_PIN3)

void CH438Demo(void)
{
    _info("ch438_main\n");
    Ch438InitDefault();
    up_mdelay(1000);
    while(1)
    {
        CH438UARTSend(2,"AT+BAUD=?",9);
        ImxrtCh438ReadData(2);
        up_mdelay(1000);
        CH438UARTSend(2,"AT+NAME=?",9);
        ImxrtCh438ReadData(2);
        up_mdelay(1000);
        CH438UARTSend(2,"AT+ADDR=?",9);
        ImxrtCh438ReadData(2);
        up_mdelay(1000);
        CH438UARTSend(2,"AT+MODE=?",9);
        ImxrtCh438ReadData(2);
        up_mdelay(1000);
    }
}
