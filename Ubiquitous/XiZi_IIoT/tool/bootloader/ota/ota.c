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
* @file:    ota.c
* @brief:   file ota.c
* @version: 1.0
* @author:  AIIT XUOS Lab
* @date:    2023/4/23
*
*/
#include <stdio.h>
#include <transform.h>
#include "shell.h"
#include "xsconfig.h"
#include "mcuboot.h"
#include "ymodem.h"
#include "ota.h"

#ifdef CONNECTION_ADAPTER_4G
#include <adapter.h>
#endif

#ifdef OTA_BY_PLATFORM
#include "aliyun_mqtt.h"
#endif

/****************************************************************************
 * Private Function Prototypes
 ****************************************************************************/
static uint32_t calculate_crc32(uint32_t addr, uint32_t len);
static int create_version(uint8_t* cur_version, uint8_t* new_version);
static status_t UpdateOTAFlag(ota_info_t *ptr);
static void InitialVersion(void);
static void BackupVersion(void);
static void UpdateNewApplication(void);
static void Update(void);
static void BootLoaderJumpApp(void);

/****************************************************************************
 * Private Data
 ****************************************************************************/
static const mcuboot_t mcuboot =
{
    mcuboot_bord_init,
    UartConfig,
    Serial_PutString,
    FLASH_Init,
    FLASH_DeInit,
    Flash_Erase,
    Flash_Write,
    Flash_Read,
    Flash_Copy,
    SerialDownload,
    mcuboot_reset,
    mcuboot_jump,
    mcuboot_delay
};
static const uint32_t crc32tab[] = {
    0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f, 0xe963a535, 0x9e6495a3,
    0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988, 0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91,
    0x1db71064, 0x6ab020f2, 0xf3b97148, 0x84be41de, 0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
    0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec, 0x14015c4f, 0x63066cd9, 0xfa0f3d63, 0x8d080df5,
    0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172, 0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b,
    0x35b5a8fa, 0x42b2986c, 0xdbbbc9d6, 0xacbcf940, 0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
    0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116, 0x21b4f4b5, 0x56b3c423, 0xcfba9599, 0xb8bda50f,
    0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924, 0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d,
    0x76dc4190, 0x01db7106, 0x98d220bc, 0xefd5102a, 0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
    0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818, 0x7f6a0dbb, 0x086d3d2d, 0x91646c97, 0xe6635c01,
    0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e, 0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457,
    0x65b0d9c6, 0x12b7e950, 0x8bbeb8ea, 0xfcb9887c, 0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
    0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2, 0x4adfa541, 0x3dd895d7, 0xa4d1c46d, 0xd3d6f4fb,
    0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0, 0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9,
    0x5005713c, 0x270241aa, 0xbe0b1010, 0xc90c2086, 0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
    0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4, 0x59b33d17, 0x2eb40d81, 0xb7bd5c3b, 0xc0ba6cad,
    0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a, 0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683,
    0xe3630b12, 0x94643b84, 0x0d6d6a3e, 0x7a6a5aa8, 0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
    0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe, 0xf762575d, 0x806567cb, 0x196c3671, 0x6e6b06e7,
    0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc, 0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5,
    0xd6d6a3e8, 0xa1d1937e, 0x38d8c2c4, 0x4fdff252, 0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
    0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60, 0xdf60efc3, 0xa867df55, 0x316e8eef, 0x4669be79,
    0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236, 0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f,
    0xc5ba3bbe, 0xb2bd0b28, 0x2bb45a92, 0x5cb36a04, 0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
    0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a, 0x9c0906a9, 0xeb0e363f, 0x72076785, 0x05005713,
    0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38, 0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21,
    0x86d3d2d4, 0xf1d4e242, 0x68ddb3f8, 0x1fda836e, 0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
    0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c, 0x8f659eff, 0xf862ae69, 0x616bffd3, 0x166ccf45,
    0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2, 0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db,
    0xaed16a4a, 0xd9d65adc, 0x40df0b66, 0x37d83bf0, 0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
    0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6, 0xbad03605, 0xcdd70693, 0x54de5729, 0x23d967bf,
    0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94, 0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d
};


/*******************************************************************************
* 函 数 名: calculate_crc32
* 功能描述: 计算给定Flash内存地址范围中数据的CRC32校验和
* 形    参: addr:表示Flash地址的起始位置
            len:表示需要计算CRC32的数据长度
* 返 回 值: 计算得到的CRC32值
*******************************************************************************/
static uint32_t calculate_crc32(uint32_t addr, uint32_t len)
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
* 函 数 名: create_version
* 功能描述: 根据当前版本号生成新的三段式版本号,适用于iap方式和TCPSERVER
* 形    参: cur_version:当前版本号,new_version:生成的新版本号
* 返 回 值: 0:生成成功,-1:生成失败
* 说    明: 为保持一致,平台通过OTA传输而来的版本号也要保持这样三段式的形式
            版本形式为major.minor.patch,如01.02.03
*******************************************************************************/
static int create_version(uint8_t* cur_version, uint8_t* new_version) 
{
    int major, minor, patch; //三段式版本号的各个部分

    //解析当前版本号,版本号格式不对直接返回
    if (sscanf(cur_version, "%03d.%03d.%03d", &major, &minor, &patch) != 3) {
        return -1;
    }

    //将当前版本号加1
    patch++;
    if(patch > 999)
    {
        minor++;
        patch = 0;
        if(minor > 999) 
        {
            major++;
            minor = 0;
            patch = 0;
            if(major > 999) 
            {
                return -1;
            }
        }
    }

    //更新版本号
    sprintf(new_version, "%03d.%03d.%03d", major, minor, patch);
	return 0;
}


/*******************************************************************************
* 函 数 名: UpdateOTAFlag
* 功能描述: 更新OTA Flag区域的信息，版本完成下载后在app里进行调用
* 形    参: ptr:ota_info_t结构体指针,描述OTA升级相关信息
* 返 回 值: 如果函数执行成功，状态值为 kStatus_Success，否则状态值为其他错误码
*******************************************************************************/
static status_t UpdateOTAFlag(ota_info_t *ptr)
{
    status_t status;

    status = mcuboot.op_flash_erase(FLAG_FLAH_ADDRESS,sizeof(ota_info_t));
    if(status != kStatus_Success)
    {
        return status;
    }
    status = mcuboot.op_flash_write(FLAG_FLAH_ADDRESS,(void *)ptr,sizeof(ota_info_t));

    return status;
}


/*******************************************************************************
* 函 数 名: InitialVersion
* 功能描述: 该函数可以烧写APP分区的初始化版本,初始化版本的版本号为0x1
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
static void InitialVersion(void)
{
    int32_t size;
    ota_info_t ota_info;

    memset(&ota_info, 0, sizeof(ota_info_t));
    size = mcuboot.download_by_serial(XIUOS_FLAH_ADDRESS);
    if(size > 0)
    {
        ota_info.os.size = size;
        ota_info.os.crc32 = calculate_crc32(XIUOS_FLAH_ADDRESS, size);

        strncpy(ota_info.os.version,"1.0.0",sizeof(ota_info.os.version));
        strncpy(ota_info.os.description, "The initial firmware.", sizeof(ota_info.os.description));

        UpdateOTAFlag(&ota_info);
    }
}


/*******************************************************************************
* 函 数 名: BackupVersion
* 功能描述: 版本回退函数,如果升级的APP存在bug导致无法跳转需调用此函数进行版本回退
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
static void BackupVersion(void)
{
    status_t status;

    ota_info_t ota_info;
    memset(&ota_info, 0, sizeof(ota_info_t));
    mcuboot.op_flash_read(FLAG_FLAH_ADDRESS, (void*)&ota_info, sizeof(ota_info_t));

    ota_info.status = OTA_STATUS_BACKUP;
    UpdateOTAFlag(&ota_info);
    status = mcuboot.op_flash_copy(BAKUP_FLAH_ADDRESS, XIUOS_FLAH_ADDRESS, ota_info.bak.size);
    if((status == kStatus_Success) &&(calculate_crc32(XIUOS_FLAH_ADDRESS, ota_info.bak.size) == ota_info.bak.crc32))
    {
        mcuboot.print_string("\r\n------Backup app version success!------\r\n");
        ota_info.os.size = ota_info.bak.size;
        ota_info.os.crc32 = ota_info.bak.crc32;

        memset(ota_info.os.version,0,sizeof(ota_info.os.version)); 
        strncpy(ota_info.os.version, ota_info.bak.version, sizeof(ota_info.bak.version));

        memset(ota_info.os.description,0,sizeof(ota_info.os.description)); 
        strncpy(ota_info.os.description, ota_info.bak.description, sizeof(ota_info.bak.description));

        UpdateOTAFlag(&ota_info);
    }
    else
    {
        mcuboot.print_string("\r\n------Backup app version failed!------\r\n");
        ota_info.status = OTA_STATUS_ERROR;

        memset(ota_info.error_message,0,sizeof(ota_info.error_message)); 
        strncpy(ota_info.error_message, "Backup app version failed!",sizeof(ota_info.error_message));

        UpdateOTAFlag(&ota_info);
    }
}


/*******************************************************************************
* 函 数 名: UpdateNewApplication
* 功能描述: 在bootloader里进行调用,根据Flash中Flag分区中的信息决定是否进行版本更新
* 形    参: 无
* 返 回 值: 无
* 注    释: 该函数调用后如果不需要升级APP分区保持不变,否则APP分区的版本为新版本
*******************************************************************************/
static void UpdateNewApplication(void)
{
    status_t status;
    ota_info_t ota_info;  // 定义OTA信息结构体

    memset(&ota_info, 0, sizeof(ota_info_t));
    // 从Flash中读取OTA信息
    mcuboot.op_flash_read(FLAG_FLAH_ADDRESS, (void*)&ota_info, sizeof(ota_info_t));

    // 如果OTA升级状态为准备状态，且APP分区与download分区版本不同,才可以进行升级
    if((ota_info.status == OTA_STATUS_READY) && (ota_info.os.crc32 != ota_info.down.crc32)) 
    {
        mcuboot.print_string("\r\n------Start to update the app!------\r\n");
        // 校验downlad分区固件CRC
        if(calculate_crc32(DOWN_FLAH_ADDRESS, ota_info.down.size) == ota_info.down.crc32) 
        {
            ota_info.status = OTA_STATUS_UPDATING;
            UpdateOTAFlag(&ota_info);

            // 1.如果CRC校验通过,开始升级,逐字节拷贝Flash,先备份当前XiUOS System分区内容
            status = mcuboot.op_flash_copy(XIUOS_FLAH_ADDRESS, BAKUP_FLAH_ADDRESS, ota_info.os.size);
            if((status == kStatus_Success) &&(calculate_crc32(BAKUP_FLAH_ADDRESS, ota_info.os.size) == ota_info.os.crc32))
            {
                mcuboot.print_string("\r\n------Backup app success!------\r\n");
                ota_info.bak.size = ota_info.os.size;
                ota_info.bak.crc32 = ota_info.os.crc32;

                memset(ota_info.bak.version,0,sizeof(ota_info.bak.version)); 
                strncpy(ota_info.bak.version, ota_info.os.version, sizeof(ota_info.os.version));

                memset(ota_info.bak.description,0,sizeof(ota_info.bak.description)); 
                strncpy(ota_info.bak.description, ota_info.os.description, sizeof(ota_info.os.description));

                UpdateOTAFlag(&ota_info);;
            }
            else
            {
                mcuboot.print_string("\r\n------Backup app failed!------\r\n");
                ota_info.status = OTA_STATUS_ERROR;

                memset(ota_info.error_message,0,sizeof(ota_info.error_message)); 
                strncpy(ota_info.error_message, "Backup app failed!",sizeof(ota_info.error_message));

                UpdateOTAFlag(&ota_info);;
                goto finish;
            }

            // 2.拷贝download分区到XiUOS System分区
            status = mcuboot.op_flash_copy(DOWN_FLAH_ADDRESS, XIUOS_FLAH_ADDRESS, ota_info.down.size);
            if((status == kStatus_Success) &&(calculate_crc32(XIUOS_FLAH_ADDRESS, ota_info.down.size) == ota_info.down.crc32))
            {
                mcuboot.print_string("\r\n------The download partition is copied successfully!------\r\n");

                ota_info.os.size = ota_info.down.size;
                ota_info.os.crc32 = ota_info.down.crc32;

                memset(ota_info.os.version,0,sizeof(ota_info.os.version)); 
                strncpy(ota_info.os.version, ota_info.down.version, sizeof(ota_info.down.version));

                memset(ota_info.os.description,0,sizeof(ota_info.os.description)); 
                strncpy(ota_info.os.description, ota_info.down.description, sizeof(ota_info.down.description));

                ota_info.status == OTA_STATUS_IDLE; // 拷贝download分区到XiUOS System分区成功,将OTA升级状态设置为IDLE
                UpdateOTAFlag(&ota_info);; 
            }
            else
            {
                mcuboot.print_string("\r\n------The download partition copy failed!------\r\n");
                ota_info.status = OTA_STATUS_ERROR;

                memset(ota_info.error_message,0,sizeof(ota_info.error_message)); 
                strncpy(ota_info.error_message, "The download partition copy failed!",sizeof(ota_info.error_message));

                UpdateOTAFlag(&ota_info);;
                goto finish;
            }

            mcuboot.print_string("\r\n------Update completed!------\r\n");
            goto finish;
        }
        else
        {
            // 如果download分区CRC校验失败，升级失败
            mcuboot.print_string("\r\n------Download Firmware CRC check failed!------\r\n");
            ota_info.status = OTA_STATUS_ERROR;

            memset(ota_info.error_message,0,sizeof(ota_info.error_message)); 
            strncpy(ota_info.error_message, "Download Firmware CRC check failed!",sizeof(ota_info.error_message));

            UpdateOTAFlag(&ota_info);;
            goto finish;  
        }  
    }
    else
    {
        mcuboot.print_string("\r\n------No need to update the app!------\r\n");
        goto finish;
    }
finish:
    return;
}


/*******************************************************************************
* 函 数 名: Update
* 功能描述: 根据实际情况进行初始化版本的烧录或者新版本的升级
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
static void Update(void)
{
    ota_info_t ota_info;
    mcuboot.flash_init();
    memset(&ota_info, 0, sizeof(ota_info_t));
    mcuboot.op_flash_read(FLAG_FLAH_ADDRESS, (void*)&ota_info, sizeof(ota_info_t));
    /* 此时APP分区还没有有效的固件,需要在bootloader下通过iap烧写出厂固件 */
    if((ota_info.os.size > APP_FLASH_SIZE) || (calculate_crc32(XIUOS_FLAH_ADDRESS, ota_info.os.size) != ota_info.os.crc32))
    {
        mcuboot.print_string("\r\nNeed to flash initial firmware!\r\n");
        InitialVersion();
    }
    else
    {
        UpdateNewApplication();
    }
    mcuboot.flash_deinit();
}


/*******************************************************************************
* 函 数 名: BootLoaderJumpApp
* 功能描述: 上次跳转若是失败的,先从BAKUP分区进行恢复，然后再进行跳转
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
static void BootLoaderJumpApp(void)
{
    ota_info_t ota_info;

    mcuboot.flash_init();
    memset(&ota_info, 0, sizeof(ota_info_t));
    mcuboot.op_flash_read(FLAG_FLAH_ADDRESS, (void*)&ota_info, sizeof(ota_info_t));

    if(ota_info.lastjumpflag == JUMP_FAILED_FLAG)
    {
        mcuboot.print_string("\r\n------Bootloader false, begin backup!------\r\n");
        BackupVersion();   
    }
    else
    {
        ota_info.lastjumpflag = JUMP_FAILED_FLAG;
        UpdateOTAFlag(&ota_info);
    }
    mcuboot.flash_deinit();
    mcuboot.op_jump();
}


#ifdef OTA_BY_IAP
/*********************************************************************************
* 函 数 名: app_ota_by_iap
* 功能描述: 通过命令来进行ota升级,该函数与升级的命令关联,通过串口iap方式传输bin文件
* 形    参: 无
* 返 回 值: 无
*********************************************************************************/
static void app_ota_by_iap(void)
{
    int32_t size;
    ota_info_t ota_info;

    mcuboot.flash_init();
    mcuboot.serial_init();
    memset(&ota_info, 0, sizeof(ota_info_t));
    mcuboot.op_flash_read(FLAG_FLAH_ADDRESS, (void*)&ota_info, sizeof(ota_info_t));
    ota_info.status = OTA_STATUS_DOWNLOADING;
    UpdateOTAFlag(&ota_info);
    size = mcuboot.download_by_serial(DOWN_FLAH_ADDRESS);
    ota_info.status = OTA_STATUS_DOWNLOADED;
    UpdateOTAFlag(&ota_info);
    if(size > 0)
    {
        ota_info.down.size = size;
        ota_info.down.crc32= calculate_crc32(DOWN_FLAH_ADDRESS, size);
    
        memset(ota_info.down.version,0,sizeof(ota_info.down.version)); 
        create_version(ota_info.os.version, ota_info.down.version);
     
        memset(ota_info.down.description,0,sizeof(ota_info.down.description)); 
        strncpy(ota_info.down.description, "OTA Test bin.",sizeof(ota_info.down.description));

        ota_info.status = OTA_STATUS_READY;
    
        memset(ota_info.error_message,0,sizeof(ota_info.error_message));
        strncpy(ota_info.error_message, "No error message!",sizeof(ota_info.error_message));
        UpdateOTAFlag(&ota_info);
    }
    else
    {
        ota_info.status = OTA_STATUS_ERROR;

        memset(ota_info.error_message,0,sizeof(ota_info.error_message));
        strncpy(ota_info.error_message, "Failed to download firmware to download partition!",sizeof(ota_info.error_message));

        UpdateOTAFlag(&ota_info);
    }
    mcuboot.flash_deinit();
    mcuboot.op_reset();
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0),iap, app_ota_by_iap, ota by iap function);
#endif


#ifdef OTA_BY_TCPSERVER
static uint16_t calculate_crc16(uint8_t * data, uint32_t len);
static void get_start_signal(struct Adapter* adapter);
static int ota_data_recv(struct Adapter* adapter);
static ota_data start_msg;
static ota_data recv_msg;

/*******************************************************************************
* 函 数 名: calculate_crc16
* 功能描述: 计算给定长度的数据的crc16的值,用于OTA传输过程中数据帧的校验
* 形    参: data:数据buffer
            len:表示需要计算CRC16的数据长度
* 返 回 值: 计算得到的CRC16值
*******************************************************************************/
static uint16_t calculate_crc16(uint8_t * data, uint32_t len)
{
    uint16_t reg_crc=0xFFFF;
    while(len--) 
    {
        reg_crc ^= *data++;
        for(int j=0;j<8;j++) 
        {
            if(reg_crc & 0x01)
                reg_crc=reg_crc >>1 ^ 0xA001;
            else
                reg_crc=reg_crc >>1;
        }
    }
    KPrintf("crc = [0x%x]\n",reg_crc);
    return reg_crc;
}


/*******************************************************************************
* 函 数 名: get_start_signal
* 功能描述: 通过4G方式从服务端接收开始信号
* 形    参: adapter:Adapter指针,指向注册的4G设备
* 返 回 值: 0:传输成功,-1:传输失败
*******************************************************************************/
static void get_start_signal(struct Adapter* adapter)
{
    ota_info_t ota_info;
    uint8_t reply[16] = {0};  
    uint32_t flashdestination = DOWN_FLAH_ADDRESS;

    memset(&ota_info, 0, sizeof(ota_info_t));
    mcuboot.op_flash_read(FLAG_FLAH_ADDRESS, (void*)&ota_info, sizeof(ota_info_t));
    ota_info.status = OTA_STATUS_DOWNLOADING;
    UpdateOTAFlag(&ota_info);
    while(1)
    {
        memset(&start_msg, 0, sizeof(ota_data));
        /* step1:Confirm the start signal of transmission. */
        KPrintf("waiting for start msg...\n");
        if(AdapterDeviceRecv(adapter, &start_msg, sizeof(start_msg)) >= 0 && start_msg.header.frame_flag == STARTFLAG) 
        {
            if(mcuboot.op_flash_erase(DOWN_FLAH_ADDRESS,start_msg.header.total_len) != kStatus_Success)
            {
                KPrintf("Failed to erase target fash!\n");
                break;
            } 
            else 
            {
                KPrintf("Erase flash successful,erase length is %d bytes.\n",start_msg.header.total_len);
            }
            memset(reply, 0, sizeof(reply));
            memcpy(reply, "ready", strlen("ready"));
            KPrintf("receive start signal,send [ready] signal to server\n");
            while(AdapterDeviceSend(adapter, reply, strlen(reply)) < 0);
            break;
        }
        else
        {
            memset(reply, 0, sizeof(reply));
            memcpy(reply, "notready", strlen("notready"));
            KPrintf("not receive start signal,send [notready] signal to server\n");
            while(AdapterDeviceSend(adapter, reply, strlen(reply)) < 0);
            continue;
        }
    }
}


/*******************************************************************************
* 函 数 名: ota_data_recv
* 功能描述: 通过4G方式从服务端接收数据
* 形    参: adapter:Adapter指针,指向注册的4G设备
* 返 回 值: 0:传输成功,-1:传输失败
*******************************************************************************/
static int ota_data_recv(struct Adapter* adapter)
{
    ota_info_t ota_info;
    uint8_t reply[16] = {0};
    int ret = 0, frame_cnt = 0, try_times = 5;
    uint32_t file_size = 0;  
    uint32_t flashdestination = DOWN_FLAH_ADDRESS;

    memset(&ota_info, 0, sizeof(ota_info_t));
    mcuboot.op_flash_read(FLAG_FLAH_ADDRESS, (void*)&ota_info, sizeof(ota_info_t));
    ota_info.status = OTA_STATUS_DOWNLOADING;
    UpdateOTAFlag(&ota_info);
    
    while(1)
    {
        memset(&recv_msg, 0, sizeof(ota_data));
        if(AdapterDeviceRecv(adapter, &recv_msg, sizeof(recv_msg)) >= 0) 
        {
            if(recv_msg.header.frame_flag == STARTFLAG) //这里不应该再出现开始帧,丢弃当前数据继续接收
            {
                continue;
            }  
            else if(recv_msg.header.frame_flag == DATAFLAG)  //说明当前是bin包里数据封装成的数据帧
            {
                frame_cnt = recv_msg.frame.frame_id;
                if(recv_msg.frame.crc == calculate_crc16(recv_msg.frame.frame_data,recv_msg.frame.frame_len))
                {
                    KPrintf("current frame[%d],length %d bytes.\n",frame_cnt,recv_msg.frame.frame_len);
                    if(mcuboot.op_flash_write(flashdestination, recv_msg.frame.frame_data, recv_msg.frame.frame_len) != kStatus_Success)
                    {
                        KPrintf("current frame[%d] flash failed.\n",frame_cnt);
                        ret = -1;
                        break;
                    }
                    else
                    {
                        KPrintf("current frame[%d] is written to flash 0x%x address successful.\n", frame_cnt, flashdestination);
                        flashdestination += recv_msg.frame.frame_len;
                    } 
                }  
                else 
                {
                    KPrintf("current frame[%d] crc check failed,try again!\n",frame_cnt);
                    goto try_again;
                }
            }
            else if(recv_msg.header.frame_flag == ENDTFLAG)  //说明当前是结束帧
            {
                KPrintf("total %d frames %d bytes crc[0x%x],receive successful.\n",frame_cnt,recv_msg.header.total_len,recv_msg.frame.crc);
                memset(reply, 0, sizeof(reply));
                memcpy(reply, "ok", strlen("ok"));
                AdapterDeviceSend(adapter, reply, strlen(reply));
    
                ota_info.status = OTA_STATUS_DOWNLOADED;
                UpdateOTAFlag(&ota_info);

                file_size = recv_msg.header.total_len;
                ret = 0;
                break;
            }
            else //说明当前接收的数据帧不是上述三种数据帧的任意一种
            {
                goto try_again;
            }
            
send_ok_again:
            memset(reply, 0, sizeof(reply));
            memcpy(reply, "ok", strlen("ok"));

            ret = AdapterDeviceSend(adapter, reply, strlen(reply));
            if(ret < 0)
            {
                KPrintf("send ok failed.\n");
                goto send_ok_again;
            }
            KPrintf("send reply[%s] done.\n",reply);
            //send ok后把try_times重置为5
            try_times = 5;
            continue;
        }

        //没有接收到数据或者接收到的数据帧不满足条件,需要发个retry的命令告诉服务器需要重传
        else 
        {
try_again:
            if(try_times == 0)
            {
                KPrintf("current frame[%d] try 5 times failed,break out!\n",frame_cnt);
                ret = -1;
                break;
            }
            memset(reply, 0, sizeof(reply));
            memcpy(reply, "retry", strlen("retry"));
            KPrintf("current frame[%d] receive failed. retry\n",frame_cnt);
            AdapterDeviceSend(adapter, reply, strlen(reply));
            try_times--;
            continue;
        }
    }

    //download分区固件下载成功,更新Flag分区
    if(0 == ret) 
    {
        ota_info.down.size = file_size;
        ota_info.down.crc32= calculate_crc32(DOWN_FLAH_ADDRESS, file_size);

        memset(ota_info.down.version,0,sizeof(ota_info.down.version)); 
        create_version(ota_info.os.version, ota_info.down.version);

        memset(ota_info.down.description,0,sizeof(ota_info.down.description)); 
        strncpy(ota_info.down.description, "4G OTA bin.",sizeof(ota_info.down.description));

        ota_info.status = OTA_STATUS_READY;
    
        memset(ota_info.error_message,0,sizeof(ota_info.error_message)); 
        strncpy(ota_info.error_message, "No error message!",sizeof(ota_info.error_message));

        UpdateOTAFlag(&ota_info);
    } 
    else 
    {
        ota_info.status = OTA_STATUS_ERROR;

        memset(ota_info.error_message,0,sizeof(ota_info.error_message));
        strncpy(ota_info.error_message, "Failed to download firmware to download partition!",sizeof(ota_info.error_message));

        UpdateOTAFlag(&ota_info);
    }
    return ret;
}


/*******************************************************************************
* 函 数 名: app_ota_by_4g
* 功能描述: 通过命令来进行ota升级,该函数与升级的命令关联,通过4g方式传输bin文件
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
static void app_ota_by_4g(void)
{
    uint32_t baud_rate = BAUD_RATE_115200;
    uint8_t server_addr[16] = "115.238.53.60";
    uint8_t server_port[8] = "7777";

    mcuboot.flash_init();

    struct Adapter* adapter =  AdapterDeviceFindByName(ADAPTER_4G_NAME);
    adapter->socket.socket_id = 0;

    AdapterDeviceOpen(adapter);
    AdapterDeviceControl(adapter, OPE_INT, &baud_rate);
    AdapterDeviceConnect(adapter, CLIENT, server_addr, server_port, IPV4);
    MdelayKTask(100);
    while(1)
    {
        /* step1:Confirm the start signal of transmission. */
        get_start_signal(adapter);
        KPrintf("start receive ota bin file.\n");
        /* step2:start receive bin file,first wait for 4s. */
        MdelayKTask(4000);
        if(0 == ota_data_recv(adapter))
        {
            break;
        } 
    }
    mcuboot.flash_deinit();
    KPrintf("ota file done,start reboot.\n");
    MdelayKTask(2000);
    mcuboot.op_reset();
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0),ota, app_ota_by_4g, ota by 4g function);
#endif


#ifdef OTA_BY_PLATFORM
#define FRAME_LEN   1024   //每帧数据的数据包长度
static uint8_t MqttRxbuf[2048];
static uint8_t FrameBuf[FRAME_LEN];
static OTA_TCB AliOTA;
/*******************************************************************************
* 函 数 名: PropertyVersion
* 功能描述: 向服务器上传当前设备版本信息
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
static void PropertyVersion(void)
{
    uint8_t tempbuff[128];
    ota_info_t ota_info;

    memset(tempbuff,0,128);  
    memset(&ota_info, 0, sizeof(ota_info_t));

    mcuboot.op_flash_read(FLAG_FLAH_ADDRESS, (void*)&ota_info, sizeof(ota_info_t)); 					                                                                       //清空临时缓冲区	
	sprintf(tempbuff,"{\"id\": \"1\",\"params\": {\"version\": \"%s\"}}",ota_info.os.version);

	MQTT_PublishDataQs1("/ota/device/inform/iv74JbFgzhv/D001",tempbuff,strlen(tempbuff));  //发送等级QS=1的PUBLISH报文  	
}


/*-------------------------------------------------*/
/*函数名：OTA下载数据                              */
/*参  数：size：本次下载量                         */
/*参  数：offset：本次下载偏移量                   */
/*返回值：无                                       */
/*-------------------------------------------------*/
void OTA_Download(int size, int offset)
{
	uint8_t temp[256];
	memset(temp,0,256);
	sprintf(temp,"{\"id\": \"1\",\"params\": {\"fileInfo\":{\"streamId\":%d,\"fileId\":1},\"fileBlock\":{\"size\":%d,\"offset\":%d}}}",AliOTA.streamId,size,offset);
	MQTT_PublishDataQs0("/sys/iv74JbFgzhv/D001/thing/file/download",temp,strlen(temp));
}

/*******************************************************************************
* 函 数 名: app_ota_by_platform
* 功能描述: 通过命令来进行ota升级,该函数与升级的命令关联,通过云平台MQTT进行升级
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
static void app_ota_by_platform(void)
{
    int datalen;
    int ret = 0;
    ota_info_t ota_info;
    uint32_t flashdestination = DOWN_FLAH_ADDRESS;

    mcuboot.flash_init();
    memset(&ota_info, 0, sizeof(ota_info_t));
    mcuboot.op_flash_read(FLAG_FLAH_ADDRESS, (void*)&ota_info, sizeof(ota_info_t));
    ota_info.status = OTA_STATUS_DOWNLOADING;
    UpdateOTAFlag(&ota_info);

    if((AdapterNetActive() == 0) && (MQTT_Connect() == 0))
    {
        KPrintf("Log in to aliyun mqtt successfully.\n");
        MQTT_SubscribeTopic("/sys/iv74JbFgzhv/D001/thing/service/property/set");  //发送订阅Topic报文
        MQTT_SubscribeTopic("/sys/iv74JbFgzhv/D001/thing/file/download_reply");   //发送订阅Topic报文
        PropertyVersion();
    } 
    while(1)
    {
        memset(MqttRxbuf,0,sizeof(MqttRxbuf));
        datalen = MQTT_Recv(MqttRxbuf, sizeof(MqttRxbuf));
        if(datalen > 0 && (MqttRxbuf[0] == 0x30))
        {
            MQTT_DealPublishData(MqttRxbuf, datalen);
            if(sscanf((char *)Aliyun_mqtt.cmdbuff,"/ota/device/upgrade/iv74JbFgzhv/D001{\"code\":\"1000\",\"data\":{\"size\":%d,\"streamId\":%d,\"sign\":\"%*32s\",\"dProtocol\":\"mqtt\",\"version\":\"%11s\"",&AliOTA.size,&AliOTA.streamId,AliOTA.version)==3)
            {
                KPrintf("ota file size:%d\r\n",AliOTA.size);
                KPrintf("ota file id:%d\r\n",AliOTA.streamId);
                KPrintf("ota file version:%s\r\n",AliOTA.version);
                if(mcuboot.op_flash_erase(DOWN_FLAH_ADDRESS,AliOTA.size != kStatus_Success))
                {
                    KPrintf("Failed to erase target fash!\n");
                    ret = -1;
                    break;
                }
                AliOTA.counter = (AliOTA.size%FRAME_LEN != 0)? (AliOTA.size/FRAME_LEN + 1):(AliOTA.size/FRAME_LEN);
				AliOTA.num = 1;                                          //下载次数,初始值为1
				AliOTA.downlen = FRAME_LEN;                              //记录本次下载量
				OTA_Download(AliOTA.downlen,(AliOTA.num - 1)*FRAME_LEN); //发送要下载的数据信息给服务器
            }

            if(strstr((char *)Aliyun_mqtt.cmdbuff,"download_reply"))
            {
                memset(FrameBuf,0,sizeof(FrameBuf));
                memcpy(FrameBuf, &MqttRxbuf[datalen-AliOTA.downlen-2], AliOTA.downlen);
                if(mcuboot.op_flash_write(flashdestination,FrameBuf,AliOTA.downlen) != kStatus_Success)
                {
                    KPrintf("current frame[%d] flash failed.\n",AliOTA.num-1);
                    ret = -1;
                    break;
                }
                else
                {
                    KPrintf("current frame[%d] is written to flash 0x%x address successful.\n", AliOTA.num -1, flashdestination);
                    KPrintf("Current progress is %d/%d\r\n",AliOTA.num,AliOTA.counter); 
                    flashdestination += AliOTA.downlen;
                    AliOTA.num++; 
                }

                if(AliOTA.num < AliOTA.counter) //如果小于总下载次数
                {                                     
                    AliOTA.downlen = FRAME_LEN;                                //记录本次下载量
                    OTA_Download(AliOTA.downlen,(AliOTA.num - 1)*FRAME_LEN);   //发送要下载的数据信息给服务器
                }
                else if(AliOTA.num == AliOTA.counter) //如果等于总下载次数,说明是最后一次下载
                {
                    if(AliOTA.size%FRAME_LEN == 0)    //判断固件大小是否是FRAME_LEN的整数倍
                    {
                        AliOTA.downlen = FRAME_LEN;                              //记录本次下载量
                        OTA_Download(AliOTA.downlen,(AliOTA.num - 1)*FRAME_LEN); //发送要下载的数据信息给服务器
                    }
                    else
                    {
                        AliOTA.downlen = AliOTA.size%FRAME_LEN;                   //记录本次下载量
                        OTA_Download(AliOTA.downlen,(AliOTA.num - 1)*FRAME_LEN);  //发送要下载的数据信息给服务器	
                    }
                }

                else //下载完毕
                {
                    ret = 0;
                    break;
                }
            }

        }
    }
    if(0 == ret) 
    {
        ota_info.down.size = AliOTA.size;
        ota_info.down.crc32= calculate_crc32(DOWN_FLAH_ADDRESS, AliOTA.size);

        memset(ota_info.down.version,0,sizeof(ota_info.down.version)); 
        strncpy(ota_info.down.version, AliOTA.version, sizeof(ota_info.down.version));

        memset(ota_info.down.description,0,sizeof(ota_info.down.description)); 
        strncpy(ota_info.down.description, "MQTT OTA bin.",sizeof(ota_info.down.description));

        ota_info.status = OTA_STATUS_READY;
    
        memset(ota_info.error_message,0,sizeof(ota_info.error_message)); 
        strncpy(ota_info.error_message, "No error message!",sizeof(ota_info.error_message));

        UpdateOTAFlag(&ota_info);
    } 
    else 
    {
        ota_info.status = OTA_STATUS_ERROR;

        memset(ota_info.error_message,0,sizeof(ota_info.error_message));
        strncpy(ota_info.error_message, "Failed to download firmware to download partition!",sizeof(ota_info.error_message));

        UpdateOTAFlag(&ota_info);
    }
    mcuboot.flash_deinit();
    KPrintf("ota file done,start reboot.\n");
    MdelayKTask(2000);
    mcuboot.op_reset();
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0),aliyun, app_ota_by_platform, ota by 4g function);
#endif


/*******************************************************************************
* 函 数 名: app_clear_jumpflag
* 功能描述: 跳转app成功后,在app中调用将lastjumpflag重置为0XCDCDCDCD
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
void app_clear_jumpflag(void)
{
    ota_info_t ota_info;
    mcuboot.flash_init();
    //跳转成功设置lastjumpflag为JUMP_SUCCESS_FLAG
    memset(&ota_info, 0, sizeof(ota_info_t));
    mcuboot.op_flash_read(FLAG_FLAH_ADDRESS, (void*)&ota_info, sizeof(ota_info_t));
    ota_info.lastjumpflag = JUMP_SUCCESS_FLAG;
    UpdateOTAFlag(&ota_info);
    mcuboot.flash_deinit();
}


/*******************************************************************************
* 函 数 名: ota_entry
* 功能描述: bootloader的入口函数
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
void ota_entry(void)
{
    uint8_t ch1, ch2;
    uint32_t ret;
    uint32_t timeout = 1000;

    mcuboot.board_init();

    mcuboot.print_string("Please press 'space' key into menu in 10s !!!\r\n");
    
    while(timeout)
    { 
        ret = (SerialKeyPressed((uint8_t*)&ch1));
        if(ret) break;
        timeout--;
        mcuboot.op_delay(10);
    }

    while(1)
    {

        if((ret)&&(ch1 == 0x20))
        {
            mcuboot.print_string("\r\nPlease slecet:");
            
            mcuboot.print_string("\r\n 1:run app");
            mcuboot.print_string("\r\n 2:update app");
            mcuboot.print_string("\r\n 3:reboot \r\n");


            ch2 = GetKey();
            switch(ch2)
            {
                case 0x31:   
                    BootLoaderJumpApp();
                    break;

                case 0x32:
                    Update();
                    BootLoaderJumpApp();
                    break;

                case 0x33:
                    mcuboot.op_reset();
                default:
                    break;
            }
        }
        //10s内不按下空格键默然进行升级,升级完成后跳转
        else
        {
            Update();
            BootLoaderJumpApp();
        } 
    }
}