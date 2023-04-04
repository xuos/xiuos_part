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
 
#include "flash.h"
#include "stdio.h"
#include "xs_base.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

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
 * @brief  获得扇区大小
 * @note   None
 * @param  None
 * @retval Flash扇区尺寸
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
 * @brief  获得最小编程长度
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
 * @brief  初始化Flash
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
 * @brief  反初始化Flash
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
 * @brief  擦除Flash扇区
 * @note   该功能将删除一个Flash扇区的内容
 * @param  addr: 擦除区域起始地址
 * @retval 返回操作结果
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
 * @brief  写Flash一个页
 * @note   字节数小于等于一页
 * @param  addr: 开始地址
 * @param  buf : 写入数据起始指针
 * @param  len : 字节数
 * @retval kStatus_Success：完成
 */
status_t FLASH_WritePage(uint32_t addr, const uint8_t *buf, uint32_t len)
{
    status_t status;
    addr &= 0x0FFFFFFF;
    __disable_irq();
    norConfig.pageSize = len;
    status = ROM_FLEXSPI_NorFlash_ProgramPage(0, &norConfig, addr, (const uint32_t *)buf);
    __enable_irq();

    return status;
}
 /**
 * @brief  读Flash内容
 * @param  addr: 开始地址
 * @param  buf : 读缓存指针
 * @param  len : 字节数
 * @retval kStatus_Success：完成
 */
status_t FLASH_Read(uint32_t addr, const uint8_t *buf, uint32_t len)
{
    status_t status;
    flexspi_xfer_t flashXfer;

    addr &= 0x0FFFFFFF;

    flashXfer.operation = kFLEXSPIOperation_Read;
    flashXfer.seqNum = 1;
    flashXfer.seqId = NOR_CMD_LUT_SEQ_IDX_READ;
    flashXfer.baseAddress = addr;
    flashXfer.isParallelModeEnable = false;	
    flashXfer.rxBuffer = (uint32_t *)buf;
    flashXfer.rxSize = len;

    __disable_irq();
    ROM_FLEXSPI_NorFlash_ClearCache(0);
    status = ROM_FLEXSPI_NorFlash_CommandXfer(0, &flashXfer);
    __enable_irq();

    return status;
}