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
 * @file connect_adc.c
 * @brief Demo for ADC function
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2022.1.18
 */

#include "board.h"
#include "fsl_adc.h"
#include "fsl_common.h"
#include "dev_adc.h"
#include "bus_adc.h"
#include "connect_adc.h"

#define ADC1_BASE_ADDR ADC1
#define ADC1_IRQ  ADC1_IRQn
#define ADC1_USER_CHANNEL 3U
#define ADC1_CHANNEL_GROUP 0U

#define ADC2_BASE_ADDR ADC2
#define ADC2_IRQ  ADC2_IRQn
#define ADC2_USER_CHANNEL 4U
#define ADC2_CHANNEL_GROUP 0U

#define adc_print KPrintf

#define ADC1_BUS_NAME "adc1"
#define ADC1_DRV_NAME "adc1_drv"
#define ADC1_DEV_NAME "adc1_dev"

#define ADC2_BUS_NAME "adc2"
#define ADC2_DRV_NAME "adc2_drv"
#define ADC2_DEV_NAME "adc2_dev"

volatile bool adc1_flag;
volatile uint32_t adc1_val;
volatile uint32_t adc1_irq_cnt;
volatile bool adc2_flag;
volatile uint32_t adc2_val;
volatile uint32_t adc2_irq_cnt;

/*******************************************************************************
 * Code
 ******************************************************************************/

void ADC1_IRQHandler(int vector, void *param)
{
    adc1_flag = true;
    /* Read conversion result to clear the conversion completed flag. */
    adc1_val = ADC_GetChannelConversionValue(ADC1_BASE_ADDR, ADC1_CHANNEL_GROUP);
    adc1_irq_cnt++;
/* Add for ARM errata 838869, affects Cortex-M4, Cortex-M4F Store immediate overlapping
  exception return operation might vector to incorrect interrupt */
#if defined __CORTEX_M && (__CORTEX_M == 4U)
    __DSB();
#endif
}

DECLARE_HW_IRQ(ADC1_IRQn, ADC1_IRQHandler, NONE);

void ADC2_IRQHandler(int vector, void *param)
{
    adc2_flag = true;
    /* Read conversion result to clear the conversion completed flag. */
    adc2_val = ADC_GetChannelConversionValue(ADC2_BASE_ADDR, ADC2_CHANNEL_GROUP);
    adc2_irq_cnt++;
/* Add for ARM errata 838869, affects Cortex-M4, Cortex-M4F Store immediate overlapping
  exception return operation might vector to incorrect interrupt */
#if defined __CORTEX_M && (__CORTEX_M == 4U)
    __DSB();
#endif
}

DECLARE_HW_IRQ(ADC2_IRQn, ADC2_IRQHandler, NONE);

uint32 Imrt1052AdcOpen(void *dev)
{
    struct AdcHardwareDevice *adc_dev = (struct AdcHardwareDevice *)dev;
    adc_config_t adc_cfg;

#ifdef BSP_USING_ADC1
    if (0 == strncmp(adc_dev->haldev.dev_name, ADC1_DEV_NAME, NAME_NUM_MAX)) {
        EnableIRQ(ADC1_IRQn);
        ADC_GetDefaultConfig(&adc_cfg);
        ADC_Init(ADC1, &adc_cfg);
#if !(defined(FSL_FEATURE_ADC_SUPPORT_HARDWARE_TRIGGER_REMOVE) && FSL_FEATURE_ADC_SUPPORT_HARDWARE_TRIGGER_REMOVE)
        ADC_EnableHardwareTrigger(ADC1, false);
#endif
        /* Do auto hardware calibration. */
        if (kStatus_Success == ADC_DoAutoCalibration(ADC1))
        {
            adc_print("ADC_DoAntoCalibration() Done.\r\n");
        }
        else
        {
            adc_print("ADC_DoAutoCalibration() Failed.\r\n");
        }
    }
#endif

#ifdef BSP_USING_ADC2
    if (0 == strncmp(adc_dev->haldev.dev_name, ADC2_DEV_NAME, NAME_NUM_MAX)) {
        EnableIRQ(ADC2_IRQn);
        ADC_GetDefaultConfig(&adc_cfg);
        ADC_Init(ADC2, &adc_cfg);
#if !(defined(FSL_FEATURE_ADC_SUPPORT_HARDWARE_TRIGGER_REMOVE) && FSL_FEATURE_ADC_SUPPORT_HARDWARE_TRIGGER_REMOVE)
        ADC_EnableHardwareTrigger(ADC2, false);
#endif
        /* Do auto hardware calibration. */
        if (kStatus_Success == ADC_DoAutoCalibration(ADC2))
        {
            adc_print("ADC_DoAntoCalibration() Done.\r\n");
        }
        else
        {
            adc_print("ADC_DoAutoCalibration() Failed.\r\n");
        }
    }
#endif

    return EOK;
}

uint32 Imrt1052AdcClose(void *dev)
{
    return EOK;
}

uint32 Imrt1052AdcRead(void *dev, struct BusBlockReadParam *read_param)
{
    struct AdcHardwareDevice *adc_dev = (struct AdcHardwareDevice *)dev;
    adc_channel_config_t ch_cfg;

#ifdef BSP_USING_ADC1
    if (0 == strncmp(adc_dev->haldev.dev_name, ADC1_DEV_NAME, NAME_NUM_MAX)) {
        /* Configure the user channel and interrupt. */
        ch_cfg.channelNumber = ADC1_USER_CHANNEL;
        ch_cfg.enableInterruptOnConversionCompleted = true;
        adc1_irq_cnt = 0U; /* Clear the interrupt counter. */
        adc1_flag = false;
        ADC_SetChannelConfig(ADC1, ADC1_CHANNEL_GROUP, &ch_cfg);
        while (adc1_flag == false);

        adc_print("ADC Value: %d\r\n", adc1_val);
        adc_print("ADC Interrupt Counter: %d\r\n", adc1_irq_cnt);
    }
#endif

#ifdef BSP_USING_ADC2
    if (0 == strncmp(adc_dev->haldev.dev_name, ADC2_DEV_NAME, NAME_NUM_MAX)) {
        /* Configure the user channel and interrupt. */
        ch_cfg.channelNumber = ADC2_USER_CHANNEL;
        ch_cfg.enableInterruptOnConversionCompleted = true;
        adc2_irq_cnt = 0U; /* Clear the interrupt counter. */
        adc2_flag = false;
        ADC_SetChannelConfig(ADC2, ADC2_CHANNEL_GROUP, &ch_cfg);
        while (adc2_flag == false);

        adc_print("ADC Value: %d\r\n", adc2_val);
        adc_print("ADC Interrupt Counter: %d\r\n", adc2_irq_cnt);
    }
#endif

    return adc1_val;
}

static uint32 Imrt1052AdcDrvConfigure(void *drv, struct BusConfigureInfo *configure_info)
{
    NULL_PARAM_CHECK(drv);
    NULL_PARAM_CHECK(configure_info);

    x_err_t ret = EOK;
    uint8 adc_channel;

    struct AdcDriver *adc_drv = (struct AdcDriver *)drv;
    struct AdcHardwareDevice *adc_dev = (struct AdcHardwareDevice *)adc_drv->driver.owner_bus->owner_haldev;
    struct Imrt1052HwAdc *adc_cfg = (struct Imrt1052HwAdc *)adc_dev->haldev.private_data;

    switch (configure_info->configure_cmd)
    {
        case OPE_CFG:
            adc_cfg->adc_channel = *(uint8 *)configure_info->private_data;
            if (adc_cfg->adc_channel > 18) {
                KPrintf("Imrt1052AdcDrvConfigure set adc channel(0-18) %u error!", adc_cfg->adc_channel);
                adc_cfg->adc_channel = 0;
                ret = ERROR;
            }
            break;
        default:
            break;
    }

    return ret;
}

static const struct AdcDevDone dev_done =
{
    Imrt1052AdcOpen,
    Imrt1052AdcClose,
    NONE,
    Imrt1052AdcRead,
};

int Imrt1052HwAdcInit(void)
{
    x_err_t ret = EOK;

#ifdef BSP_USING_ADC1
    static struct AdcBus adc1_bus;
    static struct AdcDriver adc1_drv;
    static struct AdcHardwareDevice adc1_dev;
    static struct Imrt1052HwAdc adc1_cfg;

    adc1_drv.configure = Imrt1052AdcDrvConfigure;

    ret = AdcBusInit(&adc1_bus, ADC1_BUS_NAME);
    if (ret != EOK) {
        KPrintf("ADC1 bus init error %d\n", ret);
        return ERROR;
    }

    ret = AdcDriverInit(&adc1_drv, ADC1_DRV_NAME);
    if (ret != EOK) {
        KPrintf("ADC1 driver init error %d\n", ret);
        return ERROR;
    }
    ret = AdcDriverAttachToBus(ADC1_DRV_NAME, ADC1_BUS_NAME);
    if (ret != EOK) {
        KPrintf("ADC1 driver attach error %d\n", ret);
        return ERROR;
    }

    adc1_dev.adc_dev_done = &dev_done;

    ret = AdcDeviceRegister(&adc1_dev, (void *)&adc1_cfg, ADC1_DEV_NAME);
    if (ret != EOK) {
        KPrintf("ADC1 device register error %d\n", ret);
        return ERROR;
    }

    ret = AdcDeviceAttachToBus(ADC1_DEV_NAME, ADC1_BUS_NAME);
    if (ret != EOK) {
        KPrintf("ADC1 device register error %d\n", ret);
        return ERROR;
    }
#endif

#ifdef BSP_USING_ADC2
    static struct AdcBus adc2_bus;
    static struct AdcDriver adc2_drv;
    static struct AdcHardwareDevice adc2_dev;
    static struct Imrt1052HwAdc adc2_cfg;

    adc2_drv.configure = Imrt1052AdcDrvConfigure;

    ret = AdcBusInit(&adc2_bus, ADC2_BUS_NAME);
    if (ret != EOK) {
        KPrintf("ADC2 bus init error %d\n", ret);
        return ERROR;
    }

    ret = AdcDriverInit(&adc2_drv, ADC2_DRV_NAME);
    if (ret != EOK) {
        KPrintf("ADC2 driver init error %d\n", ret);
        return ERROR;
    }
    ret = AdcDriverAttachToBus(ADC2_DRV_NAME, ADC2_BUS_NAME);
    if (ret != EOK) {
        KPrintf("ADC2 driver attach error %d\n", ret);
        return ERROR;
    }

    adc2_dev.adc_dev_done = &dev_done;

    ret = AdcDeviceRegister(&adc2_dev, (void *)&adc2_cfg, ADC2_DEV_NAME);
    if (ret != EOK) {
        KPrintf("ADC2 device register error %d\n", ret);
        return ERROR;
    }

    ret = AdcDeviceAttachToBus(ADC2_DEV_NAME, ADC2_BUS_NAME);
    if (ret != EOK) {
        KPrintf("ADC2 device register error %d\n", ret);
        return ERROR;
    }
#endif

    return ret;
}

