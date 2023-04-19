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

typedef enum {
  OTA_STATUS_IDLE = 0,     // 空闲状态，没有进行OTA升级
  OTA_STATUS_READY,        // 准备状态，可以进行OTA升级
  OTA_STATUS_DOWNLOADING,  // 正在下载固件
  OTA_STATUS_DOWNLOADED,   // 固件下载完成，可以进行升级
  OTA_STATUS_UPDATING,     // 正在进行OTA升级
  OTA_STATUS_ERROR,        // 出现错误，升级失败
} ota_status_t;

typedef struct {
  uint32_t app_size;          // 应用程序大小
  uint32_t crc;               // 应用程序CRC校验值
  uint32_t version;           // 应用程序版本号
  uint32_t status;            // 升级状态
  uint8_t description[64];    // 应用程序升级说明，最多64个字符
  uint8_t error_message[64];  // 错误信息，最多64个字符
} ota_info_t;


void UpdateOTAStatus(ota_status_t status);
void UpdateOTAFlag(uint32_t app_size, uint32_t version, uint32_t status, uint8_t* description, uint8_t* error_message);
void UpdateApplication(void);

#endif
