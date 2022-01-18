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

#include "fsl_lpi2c.h"
#include "i2c_RTC_RX8010.h"

#include "pin_mux.h"
#include "clock_config.h"
/*******************************************************************************
 * Definitions
 ******************************************************************************/
#define EXAMPLE_DELAY_COUNT 8000000

#undef GETCHAR
#define GETCHAR getchar
#undef PUTCHAR
#define PUTCHAR putchar

#define rtc_print KPrintf

///////////RX8010///////////

#define RX8010_SEC     0x10
#define RX8010_MIN     0x11
#define RX8010_HOUR    0x12
#define RX8010_WDAY    0x13
#define RX8010_MDAY    0x14
#define RX8010_MONTH   0x15
#define RX8010_YEAR    0x16
#define RX8010_YEAR    0x16
#define RX8010_RESV17  0x17
#define RX8010_ALMIN   0x18
#define RX8010_ALHOUR  0x19
#define RX8010_ALWDAY  0x1A
#define RX8010_TCOUNT0 0x1B
#define RX8010_TCOUNT1 0x1C
#define RX8010_EXT     0x1D
#define RX8010_FLAG    0x1E
#define RX8010_CTRL    0x1F

/* 0x20 to 0x2F are user registers */
#define RX8010_RESV30  0x30
#define RX8010_RESV31  0x31
#define RX8010_IRQ     0x32

#define RX8010_EXT_WADA  0x04 //BIT(3)

#define RX8010_FLAG_VLF  0x02 //BIT(1)
#define RX8010_FLAG_AF   0x04 //BIT(3)
#define RX8010_FLAG_TF   0x08 //BIT(4)
#define RX8010_FLAG_UF   0x10 //BIT(5)

#define RX8010_CTRL_AIE  0x04 //BIT(3)
#define RX8010_CTRL_UIE  0x10 //BIT(5)
#define RX8010_CTRL_STOP 0x20 //BIT(6)
#define RX8010_CTRL_TEST 0x40 //BIT(7)

#define RX8010_ALARM_AE  0x40 //BIT(7)

#define RX8010_TEST_TIME 10000

#define BCD_DATA_LEN     20

/*******************************************************************************
 * Prototypes
 ******************************************************************************/
/*******************************************************************************
 * Variables
 ******************************************************************************/
/*******************************************************************************
 * Code
 ******************************************************************************/

// change BCD format date to BIN format
uint8_t bcd2bin(uint8_t data)
{
    int i = 0;
    uint8_t ret = 0;
    uint8_t mask[4] = {0x01, 0x02, 0x04, 0x08};

    //LOW
    for(i = 0; i < 4; i++)
    {
        if(mask[i] & data)
        {
            ret += mask[i];
        }
    }

    //HIGH
    for(i = 0; i < 4; i++)
    {
        if(mask[i] & (data >> 4))
        {
            ret += (mask[i] * 10);
        }
    }

    return ret;
}

// change BIN format to BCD format
uint8_t bin2bcd(uint8_t dataH, uint8_t dataL)
{
    return (dataH << 4) | dataL;
}

// 8010 initialization
int rx8010_init(void)
{
    uint8_t flag = 0;
    uint8_t data = 0;
    uint8_t ctrl[2];
    int need_clear = 0, err = 0;

    err = I2C_Read(I2C_BASE, RX8010_FLAG, &flag, 1);
    flag &= ~(RX8010_FLAG_VLF);

    err = I2C_Write(I2C_BASE, RX8010_FLAG, &flag, 1);
    /* Initialize reserved registers as specified in datasheet */

    data = 0xD8;
    err = I2C_Write(I2C_BASE, RX8010_RESV17, &data, 1);

    data = 0x00;
    err = I2C_Write(I2C_BASE, RX8010_RESV30, &data, 1);

    data = 0x08;
    err = I2C_Write(I2C_BASE, RX8010_RESV31, &data, 1);

    data = 0x00;
    err = I2C_Write(I2C_BASE, RX8010_IRQ, &data, 1);

    err = I2C_Read(I2C_BASE, RX8010_FLAG, ctrl, 2);

    if(ctrl[0] & RX8010_FLAG_VLF)
    {
        rtc_print("\r\n Frequency stop was detected\r\n");
    }

    if(ctrl[0] & RX8010_FLAG_AF)
    {
        rtc_print("\r\n Alarm was detected\r\n");
        need_clear = 1;
    }

    if(ctrl[0] & RX8010_FLAG_TF)
    {
        need_clear = 1;
    }

    if(ctrl[0] & RX8010_FLAG_UF)
    {
        need_clear = 1;
    }

    if(need_clear)
    {
        ctrl[0] &= ~(RX8010_FLAG_AF | RX8010_FLAG_TF | RX8010_FLAG_UF);
        err = I2C_Write(I2C_BASE, RX8010_FLAG, ctrl,1);

        if(!err)
        {
            return err;
        }
    }

    return err;
}


// check format and get BCD format date like 2018-06-21 16:29:30
int get_bcd_date(uint8_t* date, uint8_t* bcd_date)
{
    uint8_t tempBuff[BCD_DATA_LEN] = {0};
    uint8_t temp = 0;
    int j = 0;

    if(( date[0] != '2')
        ||(date[1] != '0')
        ||(date[4] != '-')
        ||(date[7] != '-')
        ||(date[10] != ' ')
        ||(date[13] != ':')
        ||(date[16] != ':'))
    {
        return -1;
    }

    for(int i = 0; i < BCD_DATA_LEN - 1; i++)
    {
        if((date[i] >= '0') && (date[i] <= '9'))
        {
            tempBuff[j] = date[i] - '0';
            j++;
        }
    }

    if(j != 14)
    {
        return -1;
    }

    // year
    bcd_date[5] = bin2bcd(tempBuff[2], tempBuff[3]);

    // month
    temp = tempBuff[4] * 10 + tempBuff[5];

    if((temp < 1) || (temp > 12))
    {
        return -1;
    }

    bcd_date[4] = bin2bcd(tempBuff[4], tempBuff[5]);

    // day
    temp = tempBuff[6] * 10 + tempBuff[7];

    if((temp < 1)||(temp > 31))
    {
        return -1;
    }

    bcd_date[3] = bin2bcd(tempBuff[6], tempBuff[7]);

    // hour
    temp = tempBuff[8] * 10 + tempBuff[9];

    if((temp < 1)||(temp > 24))
    {
        return -1;
    }

    bcd_date[2] = bin2bcd(tempBuff[8], tempBuff[9]);

    // minute
    temp = tempBuff[10] * 10 + tempBuff[11];

    if((temp < 1)||(temp > 59))
    {
        return -1;
    }

    bcd_date[1] = bin2bcd(tempBuff[10], tempBuff[11]);

    // second
    temp = tempBuff[12] * 10 + tempBuff[13];

    if(( temp < 1)||(temp > 59))
    {
        return -1;
    }

    bcd_date[0] = bin2bcd(tempBuff[12], tempBuff[13]);
    return 0;
}

// setup time
int rx8010_set_time(uint8_t* asc_date)
{
    uint8_t bcd_date[6];
    int ret, err;

    if(get_bcd_date(asc_date, bcd_date))
    {
        rtc_print("\r\n Date format error! \r\n");
        return -1;
    }

    err = I2C_Write(I2C_BASE, RX8010_SEC, bcd_date, 3);
    err |= I2C_Write(I2C_BASE, RX8010_MDAY, &bcd_date[3], 3);
    return err;
}

// get rx8010 time
int rx8010_get_time(void)
{
    uint8_t date[7];
    uint8_t dateRsul[7];
    uint8_t flagreg;
    int err;
    err = I2C_Read(I2C_BASE, RX8010_FLAG, &flagreg, 1);

    if(flagreg & RX8010_FLAG_VLF)
    {
        rtc_print("\r\n Frequency stop was detected\r\n");
        return 1;
    }

    err = I2C_Read(I2C_BASE, RX8010_SEC, date, 7);
    dateRsul[0] = bcd2bin(date[RX8010_SEC - RX8010_SEC] & 0x7f);
    dateRsul[1] = bcd2bin(date[RX8010_MIN - RX8010_SEC] & 0x7f);
    dateRsul[2] = bcd2bin(date[RX8010_HOUR - RX8010_SEC] & 0x3f);
    dateRsul[4] = bcd2bin(date[RX8010_MDAY - RX8010_SEC] & 0x3f);
    dateRsul[5] = bcd2bin(date[RX8010_MONTH - RX8010_SEC] & 0x1f);
    dateRsul[6] = bcd2bin(date[RX8010_YEAR - RX8010_SEC]);
    dateRsul[3] = date[RX8010_WDAY - RX8010_SEC] & 0x7f;
    rtc_print("\r\n Read datetime from RX8010:    20%d%d-%d%d-%d%d  %d%d:%d%d:%d%d   \r\n",
            dateRsul[6]/10, dateRsul[6]%10, dateRsul[5]/10, dateRsul[5]%10, dateRsul[4]/10, dateRsul[4]%10,
            dateRsul[2]/10, dateRsul[2]%10, dateRsul[1]/10, dateRsul[1]%10, dateRsul[0]/10, dateRsul[0]%10);
    return 0;
}

void test_rtc_rx8010(int argc, char *argv[])
{
    BOARD_InitI2C1Pins();
    I2C_Init();
    rx8010_init();

    if(argc == 2)
    {
        rx8010_set_time(argv[1]);
    }
    else
    {
        rx8010_get_time();
    }

}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)| SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN)| SHELL_CMD_PARAM_NUM(3),
                   rtc, test_rtc_rx8010, i2c rtc "date time");

