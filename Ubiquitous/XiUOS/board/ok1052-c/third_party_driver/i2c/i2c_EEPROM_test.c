/*
 * The Clear BSD License
 * Copyright (c) 2015, Freescale Semiconductor, Inc.
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

#include "board.h"
#include "fsl_debug_console.h"
#include "fsl_gpio.h"

#include "fsl_lpi2c.h"
#include "i2c_EEPROM.h"

#include "pin_mux.h"
#include "clock_config.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/

#define i2c_print KPrintf

/*******************************************************************************
 * Prototypes
 ******************************************************************************/
/*!
 * @brief delay a while.
 */
void I2C_EEPROM_TEST ( void );

/*******************************************************************************
 * Variables
 ******************************************************************************/
/* The PIN status */
volatile bool g_pinSet = false;
/*******************************************************************************
 * Code
 ******************************************************************************/

/*!
* @brief I2C_EEPROM_TEST: Write and Read
 */

void I2C_EEPROM_TEST()
{
    uint8_t dataBuff[8] = {0};

    // read eeprom
    if ( !I2C_EEPROM_Read ( I2C_EEPROM_BASE, 0, dataBuff, 8 ) )
    {
        i2c_print ( "Read from EEPROM Success!!! dataBuff = %d , %d , %d , %d , %d , %d , %d , %d\r\n",
            dataBuff[0], dataBuff[1], dataBuff[2], dataBuff[3], dataBuff[4], dataBuff[5], dataBuff[6], dataBuff[7] );
    }

    //set data
    for ( uint8_t i = 0; i < 8; i++ )
    {
        dataBuff[i] = 8 - i;
    }

    //write data
    if ( !I2C_EEPROM_Write ( I2C_EEPROM_BASE, 0, dataBuff, 8 ) )
    {
        i2c_print ( "Write to EEPROM Success!!! dataBuff = %d , %d , %d , %d , %d , %d , %d , %d\r\n",
            dataBuff[0], dataBuff[1], dataBuff[2], dataBuff[3], dataBuff[4], dataBuff[5], dataBuff[6], dataBuff[7] );
    }

    //clear data
    memset ( dataBuff, 0, 8 );

    //read data
    if ( !I2C_EEPROM_Read ( I2C_EEPROM_BASE, 0, dataBuff, 8 ) )
    {
        i2c_print ( "Read from EEPROM Success!!! dataBuff = %d , %d , %d , %d , %d , %d , %d , %d\r\n",
            dataBuff[0], dataBuff[1], dataBuff[2], dataBuff[3], dataBuff[4], dataBuff[5], dataBuff[6], dataBuff[7] );
    }
}


/*!
 * @brief Main function
 */
int test_i2c ( void )
{
    BOARD_InitI2C1Pins();

    /* Print a note to terminal. */
    i2c_print ( "\r\n I2C_EEPROM example start ... \r\n" );
    I2C_EEPROM_Init();
    I2C_EEPROM_TEST();
}

SHELL_EXPORT_CMD ( SHELL_CMD_PERMISSION ( 0 ) | SHELL_CMD_TYPE ( SHELL_TYPE_CMD_MAIN ) | SHELL_CMD_PARAM_NUM ( 0 ),
                   I2cEE, test_i2c, i2c eeprom );

