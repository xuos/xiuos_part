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
#include "imxrt_ch438.h"

void CH438Demo(void)
{
    int fd;
    int i;
    char buffer[256];
    int readlen;

    while(1)
    {
        fd = open("/dev/extuart_dev2", O_RDWR);
        write(fd, "AT+ADDR=?",9);
        sleep(1);
        readlen = read(fd, buffer, 256);

        printf("readlen1 = %d\n", readlen);

        for(i = 0;i< readlen; ++i)
        {
            printf("%c(0x%x)\n", buffer[i], buffer[i]);
        }

        close(fd);
    }
    
}
