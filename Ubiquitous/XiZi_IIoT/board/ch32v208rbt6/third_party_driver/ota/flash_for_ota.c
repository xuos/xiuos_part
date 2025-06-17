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
* @file flash_for_ota.c
* @brief support flash function
* @version 2.0 
* @author AIIT XUOS Lab
* @date 2023-11-20
*/
 
#include <xizi.h>
#include <stdio.h>
#include "flash_for_ota.h"
#include "ch32v20x_flash.h"

#if 0
uint8_t NorFlash_BUFFER[4096];         //4K buffer cache
uint8_t buffer[FLASH_PAGE_SIZE];       //256 bytes buffer cache
#endif



/*******************************************************************************
* 函 数 名: FLASH_Init
* 功能描述: Flash接口初始化,需在进行Flash相关操作前进行调用
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
void FLASH_Init(void)
{
    #if 0
    /* Update LUT Table for Status, Write Enable, Erase and Program */
    ROM_FLEXSPI_NorFlash_UpdateLut(0, NOR_CMD_LUT_SEQ_IDX_READSTATUS, (const uint32_t *)FlashLookupTable.ReadStatus_Seq, 10U);
    /* Use 30MHz Flexspi clock for safe operation */
    flexspi_clock_config(0, kFLEXSPISerialClk_30MHz, kFLEXSPIClk_DDR);
    extern flexspi_nor_config_t Qspiflash_config;
    flexspi_config_mcr1(0, &Qspiflash_config.memConfig);
    flexspi_configure_dll(0, &Qspiflash_config.memConfig);
    ROM_FLEXSPI_NorFlash_ClearCache(0);
    #endif
}


/*******************************************************************************
* 函 数 名: FLASH_DeInit
* 功能描述: Flash接口反初始化，需在完成Flash相关操作后进行调用
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
void FLASH_DeInit(void)
{
    #if 0
    lookuptable_t clearlut;
    memset(&clearlut, 0, sizeof(lookuptable_t));
    ROM_FLEXSPI_NorFlash_UpdateLut(0, NOR_CMD_LUT_SEQ_IDX_READSTATUS, (const uint32_t *)FlashLookupTable.ReadStatus_Seq, 10U);
    /* Use 30MHz Flexspi clock for safe operation */
    flexspi_clock_config(0, kFLEXSPISerialClk_30MHz, kFLEXSPIClk_DDR);
    #endif
}

/*******************************************************************************
* 函 数 名: Flash_Erase
* 功能描述: 以扇区为擦除单位擦除Flash指定长度的空间,最终擦除的字节可能大于imageSize
* 形    参: start_addr:擦除区域起始地址
            imageSize:要擦除的字节数
* 返 回 值: 如果函数执行成功,状态值为 kStatus_Success,否则状态值为其他错误码 
*******************************************************************************/
status_t Flash_Erase(uint32_t start_addr, uint32_t imageSize)
{
    uint32_t page_count;
    uint32_t pageNum = (imageSize%FLASH_PAGE_FAST_SIZE != 0)? (imageSize/FLASH_PAGE_FAST_SIZE + 1):(imageSize/FLASH_PAGE_FAST_SIZE);

    FLASH_Unlock_Fast();
    for(page_count = 0; page_count < pageNum; page_count++)
    {
        FLASH_ErasePage_Fast(start_addr + (page_count * FLASH_PAGE_FAST_SIZE));
    }
    FLASH_Lock_Fast();

    return (status_t)kStatus_Success;
}

/*******************************************************************************
* 函 数 名: Flash_Write
* 功能描述: 写入W25QXX在指定地址开始写入指定长度的数据 
* 形    参: pBuffer:数据存储区
            WriteAddr:开始写入的地址
            NumByteToWrite:要写入的字节数(最大65535)  
* 返 回 值: 如果函数执行成功,状态值为 kStatus_Success,否则状态值为其他错误码 
* 注    释: 该函数带擦除操作
*******************************************************************************/
status_t Flash_Write(uint32_t WriteAddr, uint8_t *pBuffer, uint32_t NumByteToWrite)
{
    uint32_t page_count;
    uint32_t pageNum = (NumByteToWrite%FLASH_PAGE_FAST_SIZE != 0)? (NumByteToWrite/FLASH_PAGE_FAST_SIZE + 1):(NumByteToWrite/FLASH_PAGE_FAST_SIZE);

    FLASH_Unlock_Fast();
    for(page_count = 0; page_count < pageNum; page_count++)
    {
        FLASH_ProgramPage_Fast(WriteAddr + (page_count * FLASH_PAGE_FAST_SIZE), (uint32_t *)&pBuffer[page_count * FLASH_PAGE_FAST_SIZE]);
    }
    FLASH_Lock_Fast();

    return (status_t)kStatus_Success;
}

/*******************************************************************************
* 函 数 名: Flash_Read
* 功能描述: 读Flash内容
* 形    参: addr:读取区域起始地址
            buf:数据存储区
            len:要读取的字节数
* 返 回 值: 如果函数执行成功，状态值为 kStatus_Success，否则状态值为其他错误码 
*******************************************************************************/
status_t Flash_Read(uint32_t addr, uint8_t *buf, uint32_t len)
{
    uint32_t i;
    for(i=0;i<len;i++)
    {
        *buf++ = *(uint8_t*)addr++;
    }
    return 0;
}


/*******************************************************************************
* 函 数 名: Flash_Copy
* 功能描述: 实现flash数据在分区之间的拷贝
* 形    参: srcAddr:源flash的起始地址
            dstAddr:目标flash的起始地址;
            imageSize:要拷贝的flash空间大小,单位为字节
* 返 回 值: 如果函数执行成功，状态值为 kStatus_Success，否则状态值为其他错误码 
*******************************************************************************/
status_t Flash_Copy(uint32_t srcAddr,uint32_t dstAddr, uint32_t imageSize)
{   
    #if 0
    uint32_t PageNum, Remain, i;
    status_t status;

    if((srcAddr == dstAddr) || imageSize > APP_FLASH_SIZE)
    {
        return (status_t)kStatus_Fail;
    }

    status = Flash_Erase(dstAddr,imageSize);
    if(status != kStatus_Success)
    {
        KPrintf("Erase flash 0x%08x failure !\r\n",dstAddr);
        return status;
    }

    PageNum = imageSize/FLASH_PAGE_SIZE;
    Remain = imageSize%FLASH_PAGE_SIZE;

    for(i=0;i<PageNum;i++)
    {
        memset(buffer, 0, sizeof(buffer));
        status = Flash_Read(srcAddr + i*FLASH_PAGE_SIZE, buffer, sizeof(buffer));
        if(status != kStatus_Success)
        {
            KPrintf("Read flash 0x%08x failure !\r\n", srcAddr + i*FLASH_PAGE_SIZE);
            return status;
        }
        status = Flash_Write(dstAddr+ i*FLASH_PAGE_SIZE, buffer, FLASH_PAGE_SIZE);
        if(status != kStatus_Success)
        {
            KPrintf("Write flash 0x%08x failure !\r\n", dstAddr + i*FLASH_PAGE_SIZE);
            return status;
        }
    }

    if(Remain)
    {
        memset(buffer, 0, sizeof(buffer));
        status = Flash_Read(srcAddr + i*FLASH_PAGE_SIZE, buffer, Remain);
        if(status != kStatus_Success)
        {
            KPrintf("Read flash 0x%08x failure !\r\n", srcAddr + i*FLASH_PAGE_SIZE);
            return status;
        }
        status = Flash_Write(dstAddr+ i*FLASH_PAGE_SIZE, buffer, Remain);
        if(status != kStatus_Success)
        {
            KPrintf("Write flash 0x%08x failure !\r\n", dstAddr + i*FLASH_PAGE_SIZE);
            return status;
        }
    }

    return (status_t)kStatus_Success; 
    #endif
    return 0;
}

/*******************************************************************************
* 函 数 名: NOR_FLASH_Write
* 功能描述: 写入W25QXX在指定地址开始写入指定长度的数据 
* 形    参: FlashAddress:用于存储当前写入Flash地址的指针，写入过程中会移动
            Data:要写入数据存储区
            DataLength:要写入的字节数
* 返 回 值: 如果函数执行成功,状态值为 kStatus_Success,否则状态值为其他错误码  
*******************************************************************************/
uint8_t packetNum = 0;
uint32_t dataLen = 0;
uint32_t WriteAddr;
uint8_t dataBuff[5*1024];
status_t NOR_FLASH_Write(uint32_t* FlashAddress, uint8_t* Data ,uint16_t DataLength,uint8_t doneFlag)
{
    #if 0
    status_t status;
    if(!doneFlag)
    {  
        memcpy(&dataBuff[dataLen],Data,DataLength);
        dataLen += DataLength;
        packetNum ++;
        if(1 == packetNum)
        {
            WriteAddr = *FlashAddress;
        }

        if(dataLen>=SECTOR_SIZE)
        {
            status = Flash_Write(WriteAddr,dataBuff,dataLen);
            if(status != kStatus_Success)
            {
                return status;
            } 
            packetNum = 0;
            dataLen = 0; 
        }
        *FlashAddress += DataLength;
    }
    else
    {
        status = Flash_Write(WriteAddr,dataBuff,dataLen);
        if(status != kStatus_Success)
        {
            return status;
        }
        packetNum = 0;
        dataLen = 0; 
    }
   return (status_t)kStatus_Success;;
   #endif
   return 0;
}
