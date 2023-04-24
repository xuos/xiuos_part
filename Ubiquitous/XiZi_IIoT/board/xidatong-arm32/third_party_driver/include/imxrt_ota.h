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
* @file:    imxrt_ota.h
* @brief:   file imxrt_ota.h
* @version: 1.0
* @author:  AIIT XUOS Lab
* @date:    2023/3/24
*/

#ifndef __IMXRT_OTA__H__
#define __IMXRT_OTA__H__

#include <stdint.h>
#include "mcuboot.h"
#include "flash.h"
#include "ymodem.h"

/* OTA升级过程中的状态描述 */
typedef enum {
    OTA_STATUS_IDLE = 0,     // 空闲状态,没有进行OTA升级
    OTA_STATUS_READY,        // 准备状态,可以进行OTA升级
    OTA_STATUS_DOWNLOADING,  // 正在下载固件
    OTA_STATUS_DOWNLOADED,   // 固件下载完成
    OTA_STATUS_UPDATING,     // 正在进行OTA升级
    OTA_STATUS_ERROR,        // 出现错误,升级失败
} ota_status_t;


/* Flash分区中保存固件的属性描述 */
typedef struct {
    uint32_t size;              // 应用程序大小,记录分区固件的大小
    uint32_t crc32;             // 应用程序CRC32校验值,记录分区固件的crc32值
    uint32_t version;           // 应用程序版本号,记录分区固件的版本号
    uint32_t reserve;           // 保留字段
    uint8_t  description[128];  // 固件的描述信息,最多128个字符
} firmware_t;


/* OTA升级过程中的信息结构体 */
typedef struct {
    firmware_t os;                // XiUOS System分区属性信息
    firmware_t bak;               // Bakup分区属性信息
    firmware_t down;              // Download分区属性信息
    uint32_t status;              // 升级状态,取值来自于ota_status_t类型
    uint32_t lastjumpflag;        // bootloaer跳转失败的标志,bootloader里置0xABABABAB,跳转成功后在应用里置0x00000000
    uint32_t reserve[2];          // 保留字段
    uint8_t  error_message[128];  // 错误信息,最多128个字符
} ota_info_t;


uint32_t calculate_crc32(uint32_t addr, uint32_t len);
status_t UpdateOTAFlag(ota_info_t *ptr);
void UpdateApplication(void);

#endif
