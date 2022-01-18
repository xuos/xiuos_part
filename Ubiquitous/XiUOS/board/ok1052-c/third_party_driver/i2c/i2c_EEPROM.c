/*
 * The Clear BSD License
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2016-2017 NXP
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted (subject to the limitations in the disclaimer below) provided
 *  that the following conditions are met:
 *
 * o Redistributions of source code must retain the above copyright notice, this list
 *   of conditions and the following disclaimer.
 *
 * o Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 *
 * o Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * NO EXPRESS OR IMPLIED LICENSES TO ANY PARTY'S PATENT RIGHTS ARE GRANTED BY THIS LICENSE.
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "fsl_common.h"
#include "fsl_lpi2c.h"
#include "i2c_EEPROM.h"

/////////////////////////////EEPROM INIT/////////////////////////////////////////

void I2C_EEPROM_Init()
{
    lpi2c_master_config_t masterConfig = {0};
    /*
    * masterConfig.debugEnable = false;
    * masterConfig.ignoreAck = false;
    * masterConfig.pinConfig = kLPI2C_2PinOpenDrain;
    * masterConfig.baudRate_Hz = 100000U;
    * masterConfig.busIdleTimeout_ns = 0;
    * masterConfig.pinLowTimeout_ns = 0;
    * masterConfig.sdaGlitchFilterWidth_ns = 0;
    * masterConfig.sclGlitchFilterWidth_ns = 0;
    */
    LPI2C_MasterGetDefaultConfig ( &masterConfig );
    /* Change the default baudrate configuration */
    masterConfig.baudRate_Hz = I2C_EEPROM_BAUDRATE;
    /* Initialize the LPI2C master peripheral */
    LPI2C_MasterInit ( I2C_EEPROM_BASE, &masterConfig, I2C_EEPROM_CLOCK_FREQ );
}

//struct _lpi2c_master_transfer
//{
//    uint32_t
//        flags; /*!< Bit mask of options for the transfer. See enumeration #_lpi2c_master_transfer_flags for available
//                  options. Set to 0 or #kLPI2C_TransferDefaultFlag for normal transfers. */
//    uint16_t slaveAddress;       /*!< The 7-bit slave address. */
//    lpi2c_direction_t direction; /*!< Either #kLPI2C_Read or #kLPI2C_Write. */
//    uint32_t subaddress;         /*!< Sub address. Transferred MSB first. */
//    size_t subaddressSize;       /*!< Length of sub address to send in bytes. Maximum size is 4 bytes. */
//    void *data;                  /*!< Pointer to data to transfer. */
//    size_t dataSize;             /*!< Number of bytes to transfer. */
//};

status_t I2C_EEPROM_Write ( LPI2C_Type* base,uint32_t subAdd,uint8_t* dataBuff,uint16_t dataLen )
{
    // lpi2c_master_transfer_t *xfer = &(handle->xfer);
    lpi2c_master_transfer_t xfer;
    status_t status;
    xfer.slaveAddress = ( 0xA0>>1 );
    xfer.direction = kLPI2C_Write;
    xfer.subaddress = subAdd;
    xfer.subaddressSize = 0x01;
    xfer.data = dataBuff;
    xfer.dataSize = dataLen;
    xfer.flags = kLPI2C_TransferDefaultFlag;
    status = LPI2C_MasterTransferBlocking ( base, &xfer );
    return status;
}

uint32_t I2C_EEPROM_Read ( LPI2C_Type* base,uint32_t subAdd,uint8_t* dataBuffer, uint16_t dataLen )
{
    lpi2c_master_transfer_t masterXfer = {0};
    status_t reVal = kStatus_Fail;
    masterXfer.slaveAddress = ( 0XA0>>1 );
    masterXfer.direction = kLPI2C_Read;
    masterXfer.subaddress = subAdd;
    masterXfer.subaddressSize = 0x01;
    masterXfer.data = dataBuffer;
    masterXfer.dataSize = dataLen;
    masterXfer.flags = kLPI2C_TransferDefaultFlag;
    reVal = LPI2C_MasterTransferBlocking ( base, &masterXfer );

    if ( reVal != kStatus_Success )
    {
        return 1;
    }

    return 0;
}

/////////////////////////////////////////////////////////////////

