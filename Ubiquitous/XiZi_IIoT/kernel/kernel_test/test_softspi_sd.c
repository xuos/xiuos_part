/*
 * Copyright (c) 2006-2021, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2016-09-28     armink       first version.
 */

/**
* @file test_spi_flash.c
* @brief support to test spi flash function
* @version 1.0 
* @author AIIT XUOS Lab
* @date 2021-05-17
*/

/*************************************************
File name: test_spi_flash.c
Description: support spi flash function test
Others: add spi flash test cmd from SFUD/blob/master/demo/stm32f2xx_rtt/RT-Thread-2.1.0/components/drivers/spi/spi_flash_sfud.c
                https://github.com/armink/SFUD/
History: 
1. Date: 2021-05-17
Author: AIIT XUOS Lab
Modification: 
1. support spi flash open, read and write function
*************************************************/

#include <xizi.h>
#include <device.h>
#include <bus.h>

// void SDpen(void)
// {
//     x_err_t ret = EOK;
    
//     ret=HwTFInit();
//     if (ret < 0) {
//         KPrintf("open spi flash fd error %d\n", ret);
//     }

//     KPrintf("Spi Flash init succeed\n");

//     return;
// }

// SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN),
//                                                 SDpen, SDpen,  open spi flash device);

// void SDRead(int argc, char *argv[])
// {
//      x_err_t ret = EOK;

// }
// SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN),
//                                                 SDRead, SDRead,  read data from spi flash device);

// void SDWrite(int argc, char *argv[])
// {
//     x_err_t ret = EOK;
//     x_size_t i, j = 0;
//     uint32 addr;
//     uint32 size;
//     uint8 data[16];

//     struct BusBlockWriteParam write_param;
//     memset(&write_param, 0, sizeof(struct BusBlockWriteParam));

//     memset(data, 0, 16);

//     if (argc < 3) {
//         KPrintf("FlashWrite cmd format: FlashWrite addr data.\n");
//         return;
//     } else {
//         addr = strtol(argv[1], NULL, 0);
//         size = argc - 2;

//         write_param.buffer = data;
//         write_param.pos = addr;
//         write_param.size = size;

//         if (data) {
//             for (i = 0; i < size; i++) {
//                 data[i] = strtol(argv[2 + i], NULL, 0);
//             }

//             ret = write(spi_flash_fd, &write_param, size);
//             if (EOK == ret) {
//                 KPrintf("Write the %s flash data success. Start from 0x%08X, size is %ld.\n",
//                         SPI_FLASH_PATH, addr, size);
//                 KPrintf("Write data: ");
//                 for (i = 0; i < size; i++) {
//                     KPrintf("%d ", data[i]);
//                 }
//                 KPrintf(".\n");
//             }
//         } else {
//             KPrintf("SpiFlashWrite alloc write buffer failed!\n");
//         }
//     }
// }
// SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN),
//                                                 SDWrite, SDWrite,  write data to spi flash device);
