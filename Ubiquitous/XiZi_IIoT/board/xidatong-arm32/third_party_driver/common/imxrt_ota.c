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
* @file:    imxrt_ota.c
* @brief:   file imxrt_ota.c
* @version: 1.0
* @author:  AIIT XUOS Lab
* @date:    2023/3/24
*/
#include <stdio.h>
#include <time.h>
#include <string.h>
#include "flash.h"
#include "common.h"
#include "imxrt_ota.h"


static const uint32_t crc32tab[] = {
    0x00000000, 0x77073096, 0xee0e612c, 0x990951ba,
    0x076dc419, 0x706af48f, 0xe963a535, 0x9e6495a3,
    0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988,
    0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91,
    0x1db71064, 0x6ab020f2, 0xf3b97148, 0x84be41de,
    0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
    0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec,
    0x14015c4f, 0x63066cd9, 0xfa0f3d63, 0x8d080df5,
    0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172,
    0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b,
    0x35b5a8fa, 0x42b2986c, 0xdbbbc9d6, 0xacbcf940,
    0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
    0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116,
    0x21b4f4b5, 0x56b3c423, 0xcfba9599, 0xb8bda50f,
    0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924,
    0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d,
    0x76dc4190, 0x01db7106, 0x98d220bc, 0xefd5102a,
    0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
    0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818,
    0x7f6a0dbb, 0x086d3d2d, 0x91646c97, 0xe6635c01,
    0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e,
    0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457,
    0x65b0d9c6, 0x12b7e950, 0x8bbeb8ea, 0xfcb9887c,
    0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
    0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2,
    0x4adfa541, 0x3dd895d7, 0xa4d1c46d, 0xd3d6f4fb,
    0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0,
    0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9,
    0x5005713c, 0x270241aa, 0xbe0b1010, 0xc90c2086,
    0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
    0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4,
    0x59b33d17, 0x2eb40d81, 0xb7bd5c3b, 0xc0ba6cad,
    0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a,
    0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683,
    0xe3630b12, 0x94643b84, 0x0d6d6a3e, 0x7a6a5aa8,
    0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
    0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe,
    0xf762575d, 0x806567cb, 0x196c3671, 0x6e6b06e7,
    0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc,
    0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5,
    0xd6d6a3e8, 0xa1d1937e, 0x38d8c2c4, 0x4fdff252,
    0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
    0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60,
    0xdf60efc3, 0xa867df55, 0x316e8eef, 0x4669be79,
    0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236,
    0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f,
    0xc5ba3bbe, 0xb2bd0b28, 0x2bb45a92, 0x5cb36a04,
    0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
    0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a,
    0x9c0906a9, 0xeb0e363f, 0x72076785, 0x05005713,
    0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38,
    0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21,
    0x86d3d2d4, 0xf1d4e242, 0x68ddb3f8, 0x1fda836e,
    0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
    0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c,
    0x8f659eff, 0xf862ae69, 0x616bffd3, 0x166ccf45,
    0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2,
    0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db,
    0xaed16a4a, 0xd9d65adc, 0x40df0b66, 0x37d83bf0,
    0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
    0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6,
    0xbad03605, 0xcdd70693, 0x54de5729, 0x23d967bf,
    0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94,
    0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d
};


/*******************************************************************************
* 函 数 名: calculate_crc32
* 功能描述: 计算给定Flash内存地址范围中数据的CRC32校验和
* 形    参: addr:表示Flash地址的起始位置
            len:表示需要计算CRC32的数据长度
* 返 回 值: 计算得到的CRC32值
*******************************************************************************/
uint32_t calculate_crc32(uint32_t addr, uint32_t len)
{
    uint32_t crc = 0xFFFFFFFF;
    uint8_t byte = 0xFF;

    for(uint32_t i = 0; i < len; i++) 
    {
        byte = *((volatile uint8_t *)(addr + i));
        crc = crc32tab[(crc ^ byte) & 0xff] ^ (crc >> 8);
    }
    return crc^0xFFFFFFFF;
}


/*******************************************************************************
* 函 数 名: UpdateOTAFlag
* 功能描述: 更新OTA Flag区域的信息，版本完成下载后在app里进行调用
* 形    参: ptr:ota_info_t结构体指针,描述OTA升级相关信息
* 返 回 值: 如果函数执行成功，状态值为 kStatus_Success，否则状态值为其他错误码
*******************************************************************************/
status_t UpdateOTAFlag(ota_info_t *ptr)
{
    status_t status;

    status = flash_erase(FLAG_FLAH_ADDRESS,sizeof(ota_info_t));
    if(status != kStatus_Success)
    {
        return status;
    }
    status = flash_write(FLAG_FLAH_ADDRESS,(void *)ptr,sizeof(ota_info_t));

    return status;
}

/*******************************************************************************
* 函 数 名: UpdateApplication
* 功能描述: 在bootloader里进行调用,根据Flash中Flag分区中的信息决定是否进行版本更新
* 形    参: 无
* 返 回 值: 无
* 注    释: 该函数调用后无论结果如何都将跳转到app分区
*******************************************************************************/
void UpdateApplication(void)
{
    status_t status;
    ota_info_t ota_info;  // 定义OTA信息结构体

    // 从Flash中读取OTA信息
    memcpy(&ota_info, (const void *)FLAG_FLAH_ADDRESS,sizeof(ota_info_t));

    // 如果OTA升级状态为准备状态，且APP分区与download分区版本不同,才可以进行升级
    if((ota_info.status == OTA_STATUS_READY) && (ota_info.os.crc32 != ota_info.down.crc32)) 
    {
        Serial_PutString("\r\n------Start to update the app!------\r\n");
        // 校验downlad分区固件CRC
        if(calculate_crc32(DOWN_FLAH_ADDRESS, ota_info.down.size) == ota_info.down.crc32) 
        {
            ota_info.status = OTA_STATUS_UPDATING;
            UpdateOTAFlag(&ota_info);

            // 1.如果CRC校验通过,开始升级,逐字节拷贝Flash,先备份当前XiUOS System分区内容
            status = flash_copy(XIUOS_FLAH_ADDRESS, BAKUP_FLAH_ADDRESS, ota_info.os.size);
            if((status == kStatus_Success) &&(calculate_crc32(BAKUP_FLAH_ADDRESS, ota_info.os.size) == ota_info.os.crc32))
            {
                Serial_PutString("\r\n------Backup app success!------\r\n");
                ota_info.bak.size = ota_info.os.size;
                ota_info.bak.crc32 = ota_info.os.crc32;
                ota_info.bak.version = ota_info.os.version;
                strncpy(ota_info.bak.description, ota_info.os.description, sizeof(ota_info.os.description));
                UpdateOTAFlag(&ota_info);
            }
            else
            {
                Serial_PutString("\r\n------Backup app failed!------\r\n");
                ota_info.status = OTA_STATUS_ERROR;
                strncpy(ota_info.error_message, "Backup app failed!",sizeof(ota_info.error_message));
                UpdateOTAFlag(&ota_info);
                goto finish;
            }

            // 2.拷贝download分区到XiUOS System分区
            status = flash_copy(DOWN_FLAH_ADDRESS, XIUOS_FLAH_ADDRESS, ota_info.down.size);
            if((status == kStatus_Success) &&(calculate_crc32(XIUOS_FLAH_ADDRESS, ota_info.down.size) == ota_info.down.crc32))
            {
                Serial_PutString("\r\n------The download partition is copied successfully!------\r\n");

                ota_info.os.size = ota_info.down.size;
                ota_info.os.crc32 = ota_info.down.crc32;
                ota_info.os.version = ota_info.down.version;
                strncpy(ota_info.os.description, ota_info.down.description, sizeof(ota_info.down.description));
                ota_info.status == OTA_STATUS_IDLE; // 拷贝download分区到XiUOS System分区成功,将OTA升级状态设置为IDLE
                UpdateOTAFlag(&ota_info); 
            }
            else
            {
                Serial_PutString("\r\n------The download partition copy failed!------\r\n");
                ota_info.status = OTA_STATUS_ERROR;
                strncpy(ota_info.error_message, "The download partition copy failed!",sizeof(ota_info.error_message));
                UpdateOTAFlag(&ota_info);
                goto finish;
            }

            Serial_PutString("\r\n------Update completed!------\r\n");
            goto finish;
        }
        else
        {
            // 如果download分区CRC校验失败，升级失败
            Serial_PutString("\r\n------Download Firmware CRC check failed!------\r\n");
            ota_info.status = OTA_STATUS_ERROR;
            strncpy(ota_info.error_message, "Download Firmware CRC check failed!",sizeof(ota_info.error_message));
            UpdateOTAFlag(&ota_info);
            goto finish;  
        }  
    }
    else
    {
        Serial_PutString("\r\n------No need to update the app!------\r\n");
        goto finish;
    }
finish:
    return;
}
