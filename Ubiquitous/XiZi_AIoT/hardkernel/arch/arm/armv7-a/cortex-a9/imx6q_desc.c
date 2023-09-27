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
 * @file imx6q_desc.c
 * @brief config imx6q devices
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.8.10
 */


#include "device.h"


struct board_desc platform = {
    .cpu_num = 4,
    .region_num = 1,
    .regions =  (struct mem_region[]) {
        {
          
            .base = 0x10000000,
            .size = 0xFFFFFFFF - 0x10000000
        }
    },


#define URXD  0x0  /* Receiver Register */
#define UTXD  0x40 /* Transmitter Register */




#define AIPS1_ARB_BASE_ADDR             0x02000000
#define ATZ1_BASE_ADDR              AIPS1_ARB_BASE_ADDR
#define UART1_BASE_ADDR             (ATZ1_BASE_ADDR + 0x20000)


#define AIPS2_ARB_BASE_ADDR             0x02100000
#define ATZ2_BASE_ADDR              AIPS2_ARB_BASE_ADDR
#define AIPS2_OFF_BASE_ADDR         (ATZ2_BASE_ADDR + 0x80000)

    .console = {
        .base_addr=AIPS2_OFF_BASE_ADDR + 0x68000,      
    },

    .arch = {
        .gic = {
            .GICD_ADDR = 0x00A01000,
            .GICC_ADDR = 0x00A00100,

        },
    },

    .uart_num=2,
    .uarts=(struct uart_desc[]){
        //UART 0
        {
            .RXD_ADDR=0xF9010000,
            .TXD_ADDR=0xF9010000,
        },
        //UART 1
        {
            .RXD_ADDR=0xF9010000,
            .TXD_ADDR=0xF9010000,
        }
    }
};
