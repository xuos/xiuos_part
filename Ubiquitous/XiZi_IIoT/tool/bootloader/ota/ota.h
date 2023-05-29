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
* @file:    ota.h
* @brief:   file ota.h
* @version: 1.0
* @author:  AIIT XUOS Lab
* @date:    2023/4/23
*
*/
#ifndef __OTA_DEF_H__
#define __OTA_DEF_H__

#include "flash_ops.h"

#define JUMP_FAILED_FLAG  0XABABABAB
#define JUMP_SUCCESS_FLAG 0XCDCDCDCD
#define LENGTH 256   //每帧数据的数据包长度

typedef enum {
    OTA_STATUS_IDLE = 0,     // 空闲状态,没有进行OTA升级
    OTA_STATUS_READY,        // 准备状态,可以进行OTA升级
    OTA_STATUS_DOWNLOADING,  // 正在下载固件
    OTA_STATUS_DOWNLOADED,   // 固件下载完成
    OTA_STATUS_UPDATING,     // 正在进行OTA升级
    OTA_STATUS_BACKUP,       // 正在版本回退
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
    uint32_t lastjumpflag;        // bootloaer跳转失败的标志,bootloader里置0xABABABAB,跳转成功后在应用里置0xCDCDCDCD
    uint32_t reserve[2];          // 保留字段
    uint8_t  error_message[128];  // 错误信息,最多128个字符
} ota_info_t;


/*bin包传输过程中的数据帧相关的结构体*/
struct ota_header_t
{
    uint16_t frame_flag;          // frame start flag 2 Bytes
    uint16_t dev_sid;             // device software version
    uint32_t total_len;           // send data total length caculated from each frame_len 
};

struct ota_frame_t
{
    uint32_t frame_id;               // Current frame id
    uint8_t  frame_data[LENGTH];     // Current frame data,max length 256
    uint16_t frame_len;              // Current frame data length
    uint16_t crc;                    // Current frame data crc
};

struct ota_data
{
    struct ota_header_t header;
    struct ota_frame_t frame;
};


void app_clear_jumpflag(void);
void ota_entry(void);
#endif
