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
    int fd1,fd2;
    int i;
    char buffer[256];
    int readlen;

    fd1 = open("/dev/extuart_dev2", O_RDWR);
    write(fd1, "AT+BAUD=?",9);
    readlen = read(fd1, buffer, 256);

    for(i=0;i<readlen;++i)
    {
        printf("%c(0x%x)\n", buffer[i], buffer[i]);
    }
    close(fd1);

    up_mdelay(1000);

    fd2 = open("/dev/extuart_dev1", O_RDWR);
    write(fd2, "AT+BAUD=?",9);
    readlen = read(fd2, buffer, 256);
    for(i=0;i<readlen;++i)
    {
        printf("%c(0x%x)\n", buffer[i], buffer[i]);
    }

    close(fd2);
}
