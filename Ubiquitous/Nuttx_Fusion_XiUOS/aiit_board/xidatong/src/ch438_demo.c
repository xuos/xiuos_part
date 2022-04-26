/****************************************************************************
 * apps/examples/sx127x_demo/sx127x_demo.c
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

/**
* @file ch438_demo.c
* @brief nuttx source code
*                 https://github.com/apache/incubator-nuttx-apps
* @version 10.2.0 
* @author AIIT XUOS Lab
* @date 2022-03-17
*/

/****************************************************************************
 * Included Files
 ****************************************************************************/

#include <nuttx/config.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>

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
    int i=0;
    printf("ch438_main\n");
    Ch438InitDefault();
    ch438_irq_enable();
    up_mdelay(1000);
    while(1)
    {
        CH438UARTSend(2,"AT+BAUD=?",9);
        printf("send success\n");
        ImxrtCh438ReadData(NULL);
        up_mdelay(2000);
    }
}
