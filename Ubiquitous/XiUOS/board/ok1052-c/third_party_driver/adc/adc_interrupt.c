/*
 * Copyright (c) 2013 - 2016, Freescale Semiconductor, Inc.
 * Copyright 2016-2018 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/**
 * @file adc_interrupt.c
 * @brief Demo for ADC function
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2022.1.18
 */

#include "fsl_debug_console.h"
#include "board.h"
#include "fsl_adc.h"
#include "fsl_common.h"

#include "pin_mux.h"
#include "clock_config.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/

#define DEMO_ADC_BASE ADC1
#define DEMO_ADC_IRQn ADC1_IRQn
//#define DEMO_ADC_USER_CHANNEL 0U
#define DEMO_ADC_USER_CHANNEL 3U
#define DEMO_ADC_CHANNEL_GROUP 0U
#define EXAMPLE_ADC_IRQHandler ADC1_IRQHandler

#define adc_print KPrintf

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/
volatile bool g_AdcConversionDoneFlag;
volatile uint32_t g_AdcConversionValue;
volatile uint32_t g_AdcInterruptCounter;
const uint32_t g_Adc_12bitFullRange = 4096U;

/*******************************************************************************
 * Code
 ******************************************************************************/

//#define ADC_BUS_NAME_1 "adc1"
//#define ADC_DRV_NAME_1 "adc1_drv"
//#define ADC_1_DEVICE_NAME_0 "adc1_dev0"
//
//static struct Bus *adc_bus = NONE;     /* I2C bus handle */
//
//void AdcInit(const char *bus_name, const char *dev_name, const char  *drv_name)
//{
//    /* find I2C device and get I2C handle */
//    adc_bus = BusFind(bus_name);
//    if (NONE == adc_bus){
//        i2c_print("%s can't find %s bus!\n", __func__, bus_name);
//    }
//    else{
//        i2c_print("%s find %s bus!\n", __func__, bus_name);
//    }
//
//    adc_bus->owner_haldev = BusFindDevice(adc_bus, dev_name);
//    adc_bus->owner_driver = BusFindDriver(adc_bus, drv_name);
//
//    if(adc_bus->match(adc_bus->owner_driver, adc_bus->owner_haldev)){
//        i2c_print("i2c match drv %s  %p dev %s %p error\n", drv_name, adc_bus->owner_driver, dev_name, adc_bus->owner_haldev);
//    }
//    else{
//        i2c_print("HS3000Init successfully!write %p read %p\n",
//            adc_bus->owner_haldev->dev_done->write,
//            adc_bus->owner_haldev->dev_done->read);
//    }
//}
//
//void TestAdcInit(void)
//{
//    AdcInit(ADC_BUS_NAME_1, ADC_1_DEVICE_NAME_0, ADC_DRV_NAME_1);        /* init sensor */
//}

void EXAMPLE_ADC_IRQHandler(int vector, void *param)
{
    g_AdcConversionDoneFlag = true;
    /* Read conversion result to clear the conversion completed flag. */
    g_AdcConversionValue = ADC_GetChannelConversionValue(DEMO_ADC_BASE, DEMO_ADC_CHANNEL_GROUP);
    g_AdcInterruptCounter++;
/* Add for ARM errata 838869, affects Cortex-M4, Cortex-M4F Store immediate overlapping
  exception return operation might vector to incorrect interrupt */
#if defined __CORTEX_M && (__CORTEX_M == 4U)
    __DSB();
#endif
}

DECLARE_HW_IRQ(ADC1_IRQn, EXAMPLE_ADC_IRQHandler, NONE);

/*!
 * @brief Main function
 */
int test_adc(void)
{
    int cnt = 3;
    adc_config_t adcConfigStrcut;
    adc_channel_config_t adcChannelConfigStruct;

    EnableIRQ(DEMO_ADC_IRQn);

    adc_print("\r\nADC interrupt Example.\r\n");

    /*
     *  config->enableAsynchronousClockOutput = true;
     *  config->enableOverWrite =               false;
     *  config->enableContinuousConversion =    false;
     *  config->enableHighSpeed =               false;
     *  config->enableLowPower =                false;
     *  config->enableLongSample =              false;
     *  config->referenceVoltageSource =        kADC_ReferenceVoltageSourceVref;
     *  config->samplePeriodMode =              kADC_SamplePeriod2or12Clocks;
     *  config->clockSource =                   kADC_ClockSourceAD;
     *  config->clockDriver =                   kADC_ClockDriver1;
     *  config->resolution =                    kADC_Resolution12Bit;
     */
    ADC_GetDefaultConfig(&adcConfigStrcut);
    ADC_Init(DEMO_ADC_BASE, &adcConfigStrcut);
#if !(defined(FSL_FEATURE_ADC_SUPPORT_HARDWARE_TRIGGER_REMOVE) && FSL_FEATURE_ADC_SUPPORT_HARDWARE_TRIGGER_REMOVE)
    ADC_EnableHardwareTrigger(DEMO_ADC_BASE, false);
#endif

    /* Do auto hardware calibration. */
    if (kStatus_Success == ADC_DoAutoCalibration(DEMO_ADC_BASE))
    {
        adc_print("ADC_DoAntoCalibration() Done.\r\n");
    }
    else
    {
        adc_print("ADC_DoAutoCalibration() Failed.\r\n");
    }

    /* Configure the user channel and interrupt. */
    adcChannelConfigStruct.channelNumber                        = DEMO_ADC_USER_CHANNEL;
    adcChannelConfigStruct.enableInterruptOnConversionCompleted = true;
    g_AdcInterruptCounter                                       = 0U; /* Clear the interrupt counter. */

    adc_print("ADC Full Range: %d\r\n", g_Adc_12bitFullRange);
    while (cnt --)
    {
        adc_print("Press any key to get user channel's ADC value.\r\n");
        getchar();
        g_AdcConversionDoneFlag = false;
        /*
            When in software trigger mode, each conversion would be launched once calling the "ADC16_ChannelConfigure()"
            function, which works like writing a conversion command and executing it. For another channel's conversion,
            just to change the "channelNumber" field in channel configuration structure, and call the function
            "ADC_ChannelConfigure()"" again.
            Also, the "enableInterruptOnConversionCompleted" inside the channel configuration structure is a parameter
           for
            the conversion command. It takes affect just for the current conversion. If the interrupt is still required
            for the following conversion, it is necessary to assert the "enableInterruptOnConversionCompleted" every
           time
            for each command.
           */
        ADC_SetChannelConfig(DEMO_ADC_BASE, DEMO_ADC_CHANNEL_GROUP, &adcChannelConfigStruct);
        while (g_AdcConversionDoneFlag == false);
        adc_print("ADC Value: %d\r\n", g_AdcConversionValue);
        adc_print("ADC Interrupt Counter: %d\r\n", g_AdcInterruptCounter);
    }
}

SHELL_EXPORT_CMD (SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
                   adc, test_adc, ADC test );

