/*
 * Copyright 2018-2020 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/**
* @file flash.c
* @brief support flexspi norflash function
* @version 2.0 
* @author AIIT XUOS Lab
* @date 2023-04-03
*/
 
#include <stdio.h>
#include <xs_base.h>
#include "flash.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/
#define APP_FLASH_SIZE  0x100000   //Application package size is limited to 1M
#define FLASH_PAGE_SIZE 256        //ÿ��д��256���ֽ�
/*******************************************************************************
 * Prototypes
 ******************************************************************************/
uint8_t NorFlash_BUFFER[4096];         //4K buffer cache              
uint8_t buffer[FLASH_PAGE_SIZE];       //256 bytes buffer cache
/*******************************************************************************
 * Variables
 ******************************************************************************/
/*! @brief FLEXSPI NOR flash driver Structure in XIP config */
extern flexspi_nor_config_t Qspiflash_config;
/*! @brief FLEXSPI NOR flash driver Structure in flash driver */
static flexspi_nor_config_t norConfig;

/*******************************************************************************
 * Code
 ******************************************************************************/
/* Get FLEXSPI NOR Configuration Block */
void FLEXSPI_NorFlash_GetConfig(flexspi_nor_config_t *config)
{
    /* Copy norflash config block from xip config */
    memcpy(config, &Qspiflash_config, sizeof(flexspi_nor_config_t));
#ifndef HYPER_FLASH //QSPI Flash
    /* Override some default config */
    config->memConfig.deviceType           = kFLEXSPIDeviceType_SerialNOR;
    config->memConfig.deviceModeType       = kDeviceConfigCmdType_Generic;
    config->memConfig.serialClkFreq        = kFLEXSPISerialClk_30MHz; //Safe Serial Flash Frequencey
    config->ipcmdSerialClkFreq             = kFLEXSPISerialClk_30MHz; //Safe Clock frequency for IP command
    config->memConfig.controllerMiscOption = FSL_ROM_FLEXSPI_BITMASK(kFLEXSPIMiscOffset_SafeConfigFreqEnable);//Always enable Safe configuration Frequency

    /* Read Status */
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_READSTATUS] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_SDR, FLEXSPI_1PAD, 0x05U, READ_SDR, FLEXSPI_1PAD, 0x1U);

    /* Write Enable */
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_WRITEENABLE] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_SDR, FLEXSPI_1PAD, 0x06U, STOP, FLEXSPI_1PAD, 0x0U);

    /* Page Program - quad mode */
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_PAGEPROGRAM + 0U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_SDR, FLEXSPI_1PAD, 0x32U, RADDR_SDR, FLEXSPI_1PAD, 0x18U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_PAGEPROGRAM + 1U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(WRITE_SDR, FLEXSPI_4PAD, 0x04U, STOP, FLEXSPI_1PAD, 0x0U);

    /* Sector Erase */
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_SDR, FLEXSPI_1PAD, 0xD7U, RADDR_SDR, FLEXSPI_1PAD, 0x18U);
#else
    /* Override some default config */
    config->memConfig.deviceType          = kFLEXSPIDeviceType_SerialNOR;
    config->memConfig.deviceModeType      = kDeviceConfigCmdType_Generic;
    config->memConfig.lutCustomSeqEnable  = true;
    config->memConfig.busyOffset          = 15U;
    config->memConfig.busyBitPolarity     = 1U;
    config->ipcmdSerialClkFreq            = kFLEXSPISerialClk_30MHz; //Safe Clock frequency for IP command
    config->serialNorType                 = kSerialNorType_HyperBus;
    // Read Status
    // 0
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_READSTATUS] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x00U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_READSTATUS + 1U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0xAAU);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_READSTATUS + 2U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x05U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_READSTATUS + 3U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x70U);
    // 1
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_READSTATUS + 4U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0xA0U, RADDR_DDR, FLEXSPI_8PAD, 0x18U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_READSTATUS + 5U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CADDR_DDR, FLEXSPI_8PAD, 0x10U, DUMMY_RWDS_DDR, FLEXSPI_8PAD, 0x0BU);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_READSTATUS + 6U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(READ_DDR, FLEXSPI_8PAD, 0x04U, STOP, FLEXSPI_1PAD, 0x00U);

    // Write Enable
    // 0
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_WRITEENABLE] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x00U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_WRITEENABLE + 1U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0xAAU);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_WRITEENABLE + 2U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x05U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_WRITEENABLE + 3U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0xAAU);
    // 1
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_WRITEENABLE + 4U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x00U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_WRITEENABLE + 5U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x55U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_WRITEENABLE + 6U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x02U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_WRITEENABLE + 7U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x55U);

    // Page Program
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_PAGEPROGRAM] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x00U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_PAGEPROGRAM + 1U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0xAAU);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_PAGEPROGRAM + 2U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x05U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_PAGEPROGRAM + 3U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0xA0U);
    // 1
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_PAGEPROGRAM + 4U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, RADDR_DDR, FLEXSPI_8PAD, 0x18U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_PAGEPROGRAM + 5U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CADDR_DDR, FLEXSPI_8PAD, 0x10U, WRITE_DDR, FLEXSPI_8PAD, 0x80U);

    // Erase Sector
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x00U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR + 1U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0xAAU);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR + 2U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x05U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR + 3U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x80U);
    // 1
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR + 4U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x00U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR + 5U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0xAAU);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR + 6U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x05U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR + 7U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0xAAU);
    // 2
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR + 8U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x00U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR + 9U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x55U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR + 10U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x02U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR + 11U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, CMD_DDR, FLEXSPI_8PAD, 0x55U);
    // 3
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR + 12U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x00U, RADDR_DDR, FLEXSPI_8PAD, 0x18U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR + 13U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CADDR_DDR, FLEXSPI_8PAD, 0x10U, CMD_DDR, FLEXSPI_8PAD, 0x00U);
    config->memConfig.lookupTable[4U * NOR_CMD_LUT_SEQ_IDX_ERASESECTOR + 14U] =
    FSL_ROM_FLEXSPI_LUT_SEQ(CMD_DDR, FLEXSPI_8PAD, 0x30U, STOP, FLEXSPI_1PAD, 0x0U);

    // LUT customized sequence
    config->memConfig.lutCustomSeq[NOR_CMD_INDEX_WRITEENABLE].seqNum = 2U;
    config->memConfig.lutCustomSeq[NOR_CMD_INDEX_WRITEENABLE].seqId  = NOR_CMD_LUT_SEQ_IDX_WRITEENABLE;
    config->memConfig.lutCustomSeq[NOR_CMD_INDEX_READSTATUS].seqNum  = 2U;
    config->memConfig.lutCustomSeq[NOR_CMD_INDEX_READSTATUS].seqId   = NOR_CMD_LUT_SEQ_IDX_READSTATUS;
    config->memConfig.lutCustomSeq[NOR_CMD_INDEX_PAGEPROGRAM].seqNum = 2U;
    config->memConfig.lutCustomSeq[NOR_CMD_INDEX_PAGEPROGRAM].seqId  = NOR_CMD_LUT_SEQ_IDX_PAGEPROGRAM;
    config->memConfig.lutCustomSeq[NOR_CMD_INDEX_ERASESECTOR].seqNum = 4U;
    config->memConfig.lutCustomSeq[NOR_CMD_INDEX_ERASESECTOR].seqId  = NOR_CMD_LUT_SEQ_IDX_ERASESECTOR;
#endif
}

 /**
 * @brief  ���������С
 * @note   None
 * @param  None
 * @retval Flash�����ߴ�
 */
uint32_t FLASH_GetSectorSize(void)
{
#ifndef HYPER_FLASH
    return 4096;//QSPI Flash Sector Size
#else
    return 256*1024UL;//Hyper Flash Sector Size
#endif
}

 /**
 * @brief  �����С��̳���
 * @note   None
 * @param  None
 * @retval 256 or 512 for QSPI Flash
 */
uint32_t FLASH_GetProgramCmd(void)
{
#ifndef HYPER_FLASH
    return 256;//QSPI Flash Page Program
#else
    return 512;//Hyper Flash Page Program
#endif
}
 /**
 * @brief  ��ʼ��Flash
 * @note   None
 * @param  None
 * @retval None
 */
void FLASH_Init(void)
{
    /* Clean up FLEXSPI NOR flash driver Structure */
    memset(&norConfig, 0U, sizeof(flexspi_nor_config_t));
    /* Setup FLEXSPI NOR Configuration Block */
    FLEXSPI_NorFlash_GetConfig(&norConfig);
    /* Initializes the FLEXSPI module for the other FLEXSPI APIs */
    ROM_FLEXSPI_NorFlash_Init(0, &norConfig);
    /* Reset the Flexspi's Cache */
    ROM_FLEXSPI_NorFlash_ClearCache(0);
}
 /**
 * @brief  ����ʼ��Flash
 * @note   None
 * @param  None
 * @retval None
 */
void FLASH_DeInit(void)
{
    /* Clear the FlexSPI LUT to avoid unexpected erase or program operion trigger */
    memset(&norConfig, 0U, sizeof(flexspi_nor_config_t));
    ROM_FLEXSPI_NorFlash_UpdateLut(0, NOR_CMD_LUT_SEQ_IDX_READSTATUS, norConfig.memConfig.lookupTable, sizeof(norConfig.memConfig.lookupTable)-(4*NOR_CMD_LUT_SEQ_IDX_READSTATUS));
    /* Reset the Flexspi's Cache */
    ROM_FLEXSPI_NorFlash_ClearCache(0);
}

 /**
 * @brief  ����Flash����
 * @note   �ù��ܽ�ɾ��һ��Flash����������
 * @param  addr: ����������ʼ��ַ
 * @retval ���ز������
 */
status_t FLASH_EraseSector(uint32_t addr)
{
    status_t status;
    addr &= 0x0FFFFFFF;

    __disable_irq();
    status = ROM_FLEXSPI_NorFlash_Erase(0, &norConfig, addr, norConfig.sectorSize);
    __enable_irq();

    return status;
}

 /**
 * @brief  дFlashһ��ҳ
 * @note   �ֽ���С�ڵ���һҳ
 * @param  addr: ��ʼ��ַ
 * @param  buf : д��������ʼָ��
 * @param  len : �ֽ���
 * @retval kStatus_Success�����
 */
status_t FLASH_WritePage(uint32_t addr, const uint32_t *buf, uint32_t len)
{
    status_t status;
    addr &= 0x0FFFFFFF;
    __disable_irq();
    norConfig.pageSize = len;
    status = ROM_FLEXSPI_NorFlash_ProgramPage(0, &norConfig, addr, buf);
    __enable_irq();

    return status;
}
 /**
 * @brief  ��Flash����
 * @param  addr: ��ʼ��ַ
 * @param  buf : ������ָ��
 * @param  len : �ֽ���
 * @retval kStatus_Success�����
 */
status_t FLASH_Read(uint32_t addr, uint32_t *buf, uint32_t len)
{
    status_t status;
    flexspi_xfer_t flashXfer;

    addr &= 0x0FFFFFFF;

    flashXfer.operation = kFLEXSPIOperation_Read;
    flashXfer.seqNum = 1;
    flashXfer.seqId = NOR_CMD_LUT_SEQ_IDX_READ;
    flashXfer.baseAddress = addr;
    flashXfer.isParallelModeEnable = false;	
    flashXfer.rxBuffer = buf;
    flashXfer.rxSize = len;

    __disable_irq();
    ROM_FLEXSPI_NorFlash_ClearCache(0);
    status = ROM_FLEXSPI_NorFlash_CommandXfer(0, &flashXfer);
    __enable_irq();

    return status;
}

 /**
 * @brief  ����flashָ����ַָ�����ȵĿռ�
 * @param  start_addr: ��ʼ��ַ
 * @param  byte_cnt : Ҫ�������ֽ���
 * @retval kStatus_Success�������ɹ�
 */
status_t flash_erase(uint32_t start_addr, uint32_t byte_cnt)
{
    uint32_t addr;
    status_t status;

    addr = start_addr;
    while(addr < (byte_cnt + start_addr))
    {
        status = FLASH_EraseSector(addr);
        if(status != kStatus_Success)
        {
            return status;
        }
        addr += FLASH_GetSectorSize();
    }
    return status;
}

 /**
 * @brief  ��flashָ����ַд��ָ�����ȵ�����
 * @param  start_addr: ��ʼ��ַ
 * @param  buf : ����buffer
 * @param  byte_cnt : Ҫд����ֽ���
 * @retval kStatus_Success��д��ɹ�
 */
status_t flash_write(uint32_t start_addr, uint8_t *buf, uint32_t byte_cnt)
{
    return FLASH_WritePage(start_addr, (void *)buf, byte_cnt);
}

 /**
 * @brief  ��flashָ����ʼ��ȡһ�����ȵ����ݵ�������
 * @param  start_addr: ��ʼ��ַ
 * @param  buf : ����buffer
 * @param  byte_cnt : Ҫ��ȡ���ֽ���
 * @retval kStatus_Success����ȡ�ɹ�
 */
status_t flash_read(uint32_t addr, uint8_t *buf, uint32_t len)
{   
    /* For FlexSPI Memory ReadBack, use IP Command instead of AXI command for security */
    if((addr >= 0x60000000) && (addr < 0x70000000))
    {
        return FLASH_Read(addr, (void *)buf, len);
    }
        
    else
    {
        void* result = memcpy(buf, (void*)addr, len);
        if(result == NULL)
        {
            return (status_t)kStatus_Fail;  
        } 
        else 
        {
            return (status_t)kStatus_Success;  
        }
        
    }
}

 /**
 * @brief  ʵ����������flash��ַ�ռ�֮������ݿ���
 * @param  srcAddr: Դflash����ʼ��ַ
 * @param  dstAddr : Ŀ��flash����ʼ��ַ
 * @param  imageSize : Ҫ������flash�ռ��С,��λΪ�ֽ�
 * @retval kStatus_Success�������ɹ�
 */
status_t flash_copy(uint32_t srcAddr,uint32_t dstAddr, uint32_t imageSize)
{   
    uint32_t PageNum, Remain, i;
    status_t status;

    if((srcAddr == dstAddr) || imageSize > (APP_FLASH_SIZE + 1))
    {
        return (status_t)kStatus_Fail;
    }

    status = flash_erase(dstAddr,imageSize);
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
        status = flash_read(srcAddr + i*FLASH_PAGE_SIZE, buffer, sizeof(buffer));
        if(status != kStatus_Success)
        {
            KPrintf("Read flash 0x%08x failure !\r\n", srcAddr + i*FLASH_PAGE_SIZE);
            return status;
        }
        status = flash_write(dstAddr+ i*FLASH_PAGE_SIZE, buffer, FLASH_PAGE_SIZE);
        if(status != kStatus_Success)
        {
            KPrintf("Write flash 0x%08x failure !\r\n", dstAddr + i*FLASH_PAGE_SIZE);
            return status;
        }
    }

    if(Remain)
    {
        memset(buffer, 0, sizeof(buffer));
        status = flash_read(srcAddr + i*FLASH_PAGE_SIZE, buffer, Remain);
        if(status != kStatus_Success)
        {
            KPrintf("Read flash 0x%08x failure !\r\n", srcAddr + i*FLASH_PAGE_SIZE);
            return status;
        }
        status = flash_write(dstAddr+ i*FLASH_PAGE_SIZE, buffer, Remain);
        if(status != kStatus_Success)
        {
            KPrintf("Write flash 0x%08x failure !\r\n", dstAddr + i*FLASH_PAGE_SIZE);
            return status;
        }
    }

    return (status_t)kStatus_Success; 
}

status_t NOR_FLASH_Erase(uint32_t app_base_addr,uint32_t imageSize)
{
    uint16_t i;
    uint32_t sectorNum = (imageSize%4096 != 0)? (imageSize/4096 + 1):(imageSize/4096);
    
    for(i=0;i<sectorNum;i++)
    {
       status_t status = FLASH_EraseSector(app_base_addr+i*SECTOR_SIZE);
    
        if (status != kStatus_Success)
        {
            KPrintf("Erase_Sector 0x%x faild!\r\n",i*SECTOR_SIZE);
            return status;
        }
    }
    return kStatus_Success;
}

void NorFlash_Write_PageProgram(uint8_t* pBuffer,uint32_t WriteAddr,uint16_t NumByteToWrite)
{
    uint8_t temp_data[256] = {0xff};

    memcpy(temp_data,pBuffer,NumByteToWrite);
    
   status_t status = FLASH_WritePage(WriteAddr,(void *)temp_data,FLASH_PAGE_SIZE);
    if (status != kStatus_Success)
    {
        KPrintf("Write_PageProgram 0x%x faild!\r\n",WriteAddr);
    }
} 

void NorFlash_Write_NoCheck(uint8_t* pBuffer,uint32_t WriteAddr,uint16_t NumByteToWrite)   
{
    uint16_t pageRemain;	
    
    pageRemain = 256 - WriteAddr%256;//��ҳʣ����ֽ���
    
    if(NumByteToWrite <= pageRemain)
    {
        pageRemain = NumByteToWrite;//������256���ֽ�
    }

    while(1)
    {
        NorFlash_Write_PageProgram(pBuffer,WriteAddr,pageRemain);
        if(NumByteToWrite == pageRemain)
        {
            break;//д�������	
        }
        else //NumByteToWrite>pageRemain
        {
            pBuffer += pageRemain;
            WriteAddr += pageRemain;

            NumByteToWrite -= pageRemain;//��ȥ�Ѿ�д���˵��ֽ���
            if(NumByteToWrite > 256)
            {
                pageRemain = 256;//һ�ο���д��256���ֽ�
            }
            else 
            {
                pageRemain = NumByteToWrite;//����256���ֽ���
            }
        }
    }
} 

void NorFlash_Write(uint8_t* pBuffer,uint32_t WriteAddr,uint16_t NumByteToWrite)
{ 
    uint32_t secPos;
    uint16_t secOff;
    uint16_t secRemain;
    uint16_t i;    
    uint8_t *NorFlash_BUF = 0;

    NorFlash_BUF = NorFlash_BUFFER;//RAM������4K

    WriteAddr &= 0x0FFFFFFF;
    
    secPos = WriteAddr/SECTOR_SIZE;//������ַ  
    secOff = WriteAddr%SECTOR_SIZE;//�������ڵ�ƫ��
    secRemain = SECTOR_SIZE - secOff;//����ʣ��ռ��С
    
    if(NumByteToWrite <= secRemain)
    {
        secRemain = NumByteToWrite;//������4096���ֽ�	
    }	
    while(1) 
    {	
        FLASH_Read(FLASH_BASE + secPos*SECTOR_SIZE, (void *)NorFlash_BUF, SECTOR_SIZE);//������������������
        for(i=0;i<secRemain;i++)//У������
        {
            if(NorFlash_BUF[secOff+i] != 0xFF)
            {
                break;//��Ҫ����
            }
        }
        if(i < secRemain)//��Ҫ����
        {
            FLASH_EraseSector(FLASH_BASE + secPos*SECTOR_SIZE);
            for(i=0;i<secRemain;i++)//����
            {
                NorFlash_BUF[i+secOff] = pBuffer[i];
                        
            }
            NorFlash_Write_NoCheck(NorFlash_BUF,FLASH_BASE + secPos*4096,4096);//д����������  
        }
        else
        {
            NorFlash_Write_NoCheck(pBuffer,FLASH_BASE + WriteAddr,secRemain);//д�Ѿ������˵�,ֱ��д������ʣ������. 		
        }
                           
        if(NumByteToWrite == secRemain)
        {
            break;//д�������
        }
        else//д��δ����
        {
            secPos++;//������ַ��1
            secOff=0;//ƫ��λ��Ϊ0

            pBuffer += secRemain;//ָ��ƫ��
            WriteAddr += secRemain;//д��ַƫ��
            NumByteToWrite -= secRemain;//�ֽ����ݼ�
            if(NumByteToWrite > 4096)
            {
                secRemain = 4096;//��һ����������д����	
            }
            else
            {
                secRemain = NumByteToWrite;//��һ����������д����	
            }
        }
    }
}

#ifndef  USE_HIGHT_SPEED_TRANS
uint32_t NOR_FLASH_Write(uint32_t* FlashAddress, uint8_t* Data ,uint16_t DataLength)
{
    uint32_t WriteAddr;
    WriteAddr = *FlashAddress;
    NorFlash_Write(Data,WriteAddr,DataLength);
    *FlashAddress += DataLength;
    return 0;
}
#else
uint8_t packetNum = 0;
uint32_t dataLen = 0;
uint32_t WriteAddr;
uint8_t dataBuff[5*1024];
uint32_t NOR_FLASH_Write(uint32_t* FlashAddress, uint8_t* Data ,uint16_t DataLength,uint8_t doneFlag)
{
    if(!doneFlag)
    {  
        memcpy(&dataBuff[dataLen],Data,DataLength);
        dataLen += DataLength;
        packetNum ++;
        if(1 == packetNum)
        {
            WriteAddr = *FlashAddress;    		 
        }

        if(dataLen>=4096)
        {
            NorFlash_Write(dataBuff,WriteAddr,dataLen);
            packetNum = 0;
            dataLen = 0; 
        }
        *FlashAddress += DataLength;
    }
    else
    {
        NorFlash_Write(dataBuff,WriteAddr,dataLen);
        packetNum = 0;
        dataLen = 0; 
    }
   return (0);
}
#endif