/*
 * Copyright (c) 2020 RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author            Notes
 * 2018-11-06     balanceTWK        first version
 * 2019-04-23     WillianChan       Fix GPIO serial number disorder
*/

/**
* @file connect_gpio.c
* @brief support gpio function using bus driver framework
* @version 1.0
* @author AIIT XUOS Lab
* @date 2021-04-25
*/

/*************************************************
File name: connect_gpio.c
Description: support  gpio configure and register to bus framework
Others: take RT-Thread v4.0.2/bsp/stm32/libraries/HAL_Drivers/drv_gpio.c for references
                https://github.com/RT-Thread/rt-thread/tree/v4.0.2
History:
1. Date: 2021-04-25
Author: AIIT XUOS Lab
Modification: add bus driver framework support for gpio
*************************************************/

#include <device.h>
#include <board.h>

#define STM32_PIN_NUMBERS 100 // [48, 64, 100, 144]

#define ITEM_NUM(items) sizeof(items)/sizeof(items[0])

struct PinIndex
{
    int index;
    GPIO_Type *gpio;
    uint32_t pin;
};

struct PinIrq
{
    uint8 port_source;
    uint8 pin_source;
    enum IRQn irq_exti_channel;
    uint32 exti_line;
};

static const struct PinIndex pins[] = {
    {0, GPIO1, 0},
    {1, GPIO1, 1},
    {2, GPIO1, 2},
    {3, GPIO1, 3},
    {4, GPIO1, 4},
    {5, GPIO1, 5},
    {6, GPIO1, 6},
    {7, GPIO1, 7},
    {8, GPIO1, 8},
    {9, GPIO1, 9},
    {10, GPIO1, 10},
    {11, GPIO1, 11},
    {12, GPIO1, 12},
    {13, GPIO1, 13},
    {14, GPIO1, 14},
    {15, GPIO1, 15},
    {16, GPIO2, 0},
    {17, GPIO2, 1},
    {18, GPIO2, 2},
    {19, GPIO2, 3},
    {20, GPIO2, 4},
    {21, GPIO2, 5},
    {22, GPIO2, 6},
    {23, GPIO2, 7},
    {24, GPIO2, 8},
    {25, GPIO2, 9},
    {26, GPIO2, 10},
    {27, GPIO2, 11},
    {28, GPIO2, 12},
    {29, GPIO2, 13},
    {30, GPIO2, 14},
    {31, GPIO2, 15},
    {32, GPIO3, 0},
    {33, GPIO3, 1},
    {34, GPIO3, 2},
    {35, GPIO3, 3},
    {36, GPIO3, 4},
    {37, GPIO3, 5},
    {38, GPIO3, 6},
    {39, GPIO3, 7},
    {40, GPIO3, 8},
    {41, GPIO3, 9},
    {42, GPIO3, 10},
    {43, GPIO3, 11},
    {44, GPIO3, 12},
    {45, GPIO3, 13},
    {46, GPIO3, 14},
    {47, GPIO3, 15},
    {-1, 0u, -1}
};

struct PinIrqHdr pin_irq_hdr_tab[] = {};

const struct PinIndex *GetPin(uint8_t pin)
{
    const struct PinIndex *index;

    if (pin < ITEM_NUM(pins)){
        index = &pins[pin];
        if (index->index == -1)
            index = NONE;
    }
    else{
        index = NONE;
    }

    return index;
}

static int32 GpioConfigMode(int mode, const struct PinIndex* index)
{
    gpio_pin_config_t gpio_config;
    NULL_PARAM_CHECK(index);

    switch (mode)
    {
        case GPIO_CFG_OUTPUT:
            gpio_config.direction = kGPIO_DigitalOutput;
            gpio_config.interruptMode = kGPIO_NoIntmode;
            break;
        case GPIO_CFG_INPUT:
            gpio_config.direction = kGPIO_DigitalInput;
            gpio_config.interruptMode = kGPIO_NoIntmode;
            break;
        case GPIO_CFG_INPUT_PULLUP:
            gpio_config.direction = kGPIO_DigitalInput;
            gpio_config.interruptMode = kGPIO_IntRisingEdge;
            break;
        case GPIO_CFG_INPUT_PULLDOWN:
            gpio_config.direction = kGPIO_DigitalInput;
            gpio_config.interruptMode = kGPIO_IntFallingEdge;
            break;
        case GPIO_CFG_OUTPUT_OD:
            gpio_config.direction = kGPIO_DigitalOutput;
            break;
        default:
            break;
    }
    GPIO_PinInit(index->gpio, index->pin, &gpio_config);
    return EOK;
}

static __inline int32 Bit2Bitnum(uint32 bit)
{
    for (int i = 0; i < 32; i++){
        if ((1UL << i) == bit){
            return i;
        }
    }
    return -1;
}

static __inline int32 Bitno2Bit(uint32 bitno)
{
    if (bitno <= 32) {
        return 1UL << bitno;
    }
    else {
        return 0;
    }
}
static const struct PinIrq *GetPinIrq(uint16_t pin)
{
    static struct PinIrq irq;
    const struct PinIndex* index = GetPin(pin);

    if (index == NONE) {
        return NONE;
    }

    irq.exti_line = index->pin;
    irq.pin_source = Bit2Bitnum(index->pin);
    irq.port_source = ((uint32_t)index->gpio - GPIO1_BASE) / (GPIO2_BASE - GPIO1_BASE);
    switch (irq.pin_source)
    {
        case 0 :
            irq.irq_exti_channel = GPIO1_INT0_IRQn;
            break;
        case 1 :
            irq.irq_exti_channel = GPIO1_INT1_IRQn;
            break;
        case 2 :
            irq.irq_exti_channel = GPIO1_INT2_IRQn;
            break;
        case 3 :
            irq.irq_exti_channel = GPIO1_INT3_IRQn;
            break;
        case 4 :
            irq.irq_exti_channel = GPIO1_INT4_IRQn;
            break;
        case 5 :
            irq.irq_exti_channel = GPIO1_INT5_IRQn;
            break;
        case 6 :
            irq.irq_exti_channel = GPIO1_INT6_IRQn;
            break;
        case 7 :
            irq.irq_exti_channel = GPIO1_INT7_IRQn;
            break;
        default :
            return NONE;
    }

    return &irq;
};
static int32 GpioIrqRegister(int32 pin, int32 mode, void (*hdr)(void *args), void *args)
{
    const struct PinIndex* index = GetPin(pin);
    int32 irqindex = -1;

    irqindex = Bit2Bitnum(index->pin);
    if (irqindex < 0 || irqindex >= ITEM_NUM(pin_irq_hdr_tab)) {
        return -ENONESYS;
    }

    x_base level = CriticalAreaLock();
    if (pin_irq_hdr_tab[irqindex].pin == pin   &&
        pin_irq_hdr_tab[irqindex].hdr == hdr   &&
        pin_irq_hdr_tab[irqindex].mode == mode &&
        pin_irq_hdr_tab[irqindex].args == args
    )
    {
        CriticalAreaUnLock(level);
        return EOK;
    }
    if (pin_irq_hdr_tab[irqindex].pin != -1) {
        CriticalAreaUnLock(level);
        return -EDEV_BUSY;
    }
    pin_irq_hdr_tab[irqindex].pin = pin;
    pin_irq_hdr_tab[irqindex].hdr = hdr;
    pin_irq_hdr_tab[irqindex].mode = mode;
    pin_irq_hdr_tab[irqindex].args = args;
    CriticalAreaUnLock(level);

    return EOK;
}

static uint32 GpioIrqFree(int32 pin)
{
    const struct PinIndex* index = GetPin(pin);
    int32 irqindex = -1;

    irqindex = Bit2Bitnum(index->pin);
    if (irqindex < 0 || irqindex >= ITEM_NUM(pin_irq_hdr_tab)) {
        return -ENONESYS;
    }

    x_base level = CriticalAreaLock();
    if (pin_irq_hdr_tab[irqindex].pin == -1){
        CriticalAreaUnLock(level);
        return EOK;
    }
    pin_irq_hdr_tab[irqindex].pin  = -1;
    pin_irq_hdr_tab[irqindex].hdr  = NONE;
    pin_irq_hdr_tab[irqindex].mode = 0;
    pin_irq_hdr_tab[irqindex].args = NONE;
    CriticalAreaUnLock(level);

    return EOK;
}

static int32 GpioIrqEnable(x_base pin)
{
    const struct PinIndex* index = GetPin(pin);
    int32 irqindex = -1;
    const struct PinIrq *irq;
    gpio_pin_config_t gpio_config;

    irqindex = Bit2Bitnum(index->pin);
    if (irqindex < 0 || irqindex >= ITEM_NUM(pin_irq_hdr_tab)){
        return -ENONESYS;
    }
    x_base level = CriticalAreaLock();
    if (pin_irq_hdr_tab[irqindex].pin == -1) {
        CriticalAreaUnLock(level);
        return -ENONESYS;
    }

    irq = GetPinIrq(pin);
    if (irq == NONE){
        CriticalAreaUnLock(level);
        return -ENONESYS;
    }

    switch (pin_irq_hdr_tab[irqindex].mode)
    {
    case GPIO_IRQ_EDGE_RISING:
        gpio_config.direction = kGPIO_DigitalInput;
        gpio_config.interruptMode = kGPIO_IntRisingEdge;
        break;
    case GPIO_IRQ_EDGE_FALLING:
        gpio_config.direction = kGPIO_DigitalInput;
        gpio_config.interruptMode = kGPIO_IntFallingEdge;
        break;
    case GPIO_IRQ_EDGE_BOTH:
        gpio_config.direction = kGPIO_DigitalInput;
        gpio_config.interruptMode = kGPIO_IntRisingOrFallingEdge;
        break;
    }

    GPIO_PinInit(index->gpio, index->pin, &gpio_config);
    GPIO_PortEnableInterrupts(index->gpio, index->pin);
    CriticalAreaUnLock(level);
    return EOK;
}

static int32 GpioIrqDisable(x_base pin)
{
    const struct PinIndex* index = GetPin(pin);
    const struct PinIrq *irq;

    irq = GetPinIrq(index->pin);
    NULL_PARAM_CHECK(irq);

    GPIO_PortDisableInterrupts(index->gpio, index->pin);
    return EOK;
}

static uint32 Stm32PinConfigure(struct PinParam *param)
{
    NULL_PARAM_CHECK(param);
    int ret = EOK;

    const struct PinIndex *index = GetPin(param->pin);
    switch(param->cmd)
    {
        case GPIO_CONFIG_MODE:
            GpioConfigMode(param->mode, index);
            break;
        case GPIO_IRQ_REGISTER:
            ret = GpioIrqRegister(param->pin,param->irq_set.irq_mode,param->irq_set.hdr,param->irq_set.args);
            break;
        case GPIO_IRQ_FREE:
            ret = GpioIrqFree(param->pin);
            break;
        case GPIO_IRQ_ENABLE:
            ret = GpioIrqEnable(param->pin);
            break;
        case GPIO_IRQ_DISABLE:
            ret = GpioIrqDisable(param->pin);
            break;
        default:
            ret = -EINVALED;
            break;
    }

    return ret;
}

static uint32 Stm32PinInit(void)
{
    static x_bool pin_init_flag = RET_FALSE;

    if (!pin_init_flag) {
        pin_init_flag = RET_TRUE;
    }

    return EOK;
}

static uint32 Stm32GpioDrvConfigure(void *drv, struct BusConfigureInfo *configure_info)
{
    NULL_PARAM_CHECK(drv);
    NULL_PARAM_CHECK(configure_info);

    x_err_t ret = EOK;
    struct PinParam *param;

    switch (configure_info->configure_cmd)
    {
        case OPE_INT:
            ret = Stm32PinInit();
            break;
        case OPE_CFG:
            param = (struct PinParam *)configure_info->private_data;
            ret = Stm32PinConfigure(param);
            break;
        default:
            break;
    }

    return ret;
}

uint32 Stm32PinWrite(void *dev, struct BusBlockWriteParam *write_param)
{
    NULL_PARAM_CHECK(dev);
    NULL_PARAM_CHECK(write_param);
    struct PinStat *pinstat = (struct PinStat *)write_param->buffer;
    const struct PinIndex* index = GetPin(pinstat->pin);
    NULL_PARAM_CHECK(index);

    if (GPIO_LOW == pinstat->val) {
        GPIO_PinWrite(index->gpio, index->pin, 0);
    } else {
        GPIO_PinWrite(index->gpio, index->pin, 1);
    }
    return EOK;
}

uint32 Stm32PinRead(void *dev, struct BusBlockReadParam *read_param)
{
    NULL_PARAM_CHECK(dev);
    NULL_PARAM_CHECK(read_param);
    struct PinStat *pinstat = (struct PinStat *)read_param->buffer;
    const struct PinIndex* index = GetPin(pinstat->pin);
    NULL_PARAM_CHECK(index);

    if(GPIO_PinRead(index->gpio, index->pin) == GPIO_LOW) {
        pinstat->val = GPIO_LOW;
    } else {
        pinstat->val = GPIO_HIGH;
    }
    return pinstat->val;
}

static const struct PinDevDone dev_done =
{
    .open  = NONE,
    .close = NONE,
    .write = Stm32PinWrite,
    .read  = Stm32PinRead,
};

int Stm32HwGpioInit(void)
{
    x_err_t ret = EOK;

    static struct PinBus pin;

    ret = PinBusInit(&pin, PIN_BUS_NAME);
    if (ret != EOK) {
        KPrintf("gpio bus init error %d\n", ret);
        return ERROR;
    }

    static struct PinDriver drv;
    drv.configure = &Stm32GpioDrvConfigure;

    ret = PinDriverInit(&drv, PIN_DRIVER_NAME, NONE);
    if (ret != EOK) {
        KPrintf("pin driver init error %d\n", ret);
        return ERROR;
    }
    ret = PinDriverAttachToBus(PIN_DRIVER_NAME, PIN_BUS_NAME);
    if (ret != EOK) {
        KPrintf("pin driver attach error %d\n", ret);
        return ERROR;
    }

    static struct PinHardwareDevice dev;
    dev.dev_done = &dev_done;

    ret = PinDeviceRegister(&dev, NONE, PIN_DEVICE_NAME);
    if (ret != EOK) {
        KPrintf("pin device register error %d\n", ret);
        return ERROR;
    }
    ret = PinDeviceAttachToBus(PIN_DEVICE_NAME, PIN_BUS_NAME);
    if (ret != EOK) {
        KPrintf("pin device register error %d\n", ret);
        return ERROR;
    }

    return ret;
}

static __inline void PinIrqHdr(int irqno)
{
    const struct PinIndex* index = GetPin(irqno);
    const struct PinIrq *irq;

    irq = GetPinIrq(index->pin);
    NULL_PARAM_CHECK(irq);

    GPIO_ClearPinsInterruptFlags(index->gpio, index->pin);

    if (pin_irq_hdr_tab[irqno].hdr){
       pin_irq_hdr_tab[irqno].hdr(pin_irq_hdr_tab[irqno].args);
    }
}

void EXTI0_IRQHandler(int irq_num, void *arg)
{
    PinIrqHdr(0);
}
DECLARE_HW_IRQ(GPIO1_INT0_IRQn, EXTI0_IRQHandler, NONE);

void EXTI1_IRQHandler(int irq_num, void *arg)
{
    PinIrqHdr(1);
}
DECLARE_HW_IRQ(GPIO1_INT1_IRQn, EXTI1_IRQHandler, NONE);

void EXTI2_IRQHandler(int irq_num, void *arg)
{
    PinIrqHdr(2);
}
DECLARE_HW_IRQ(GPIO1_INT2_IRQn, EXTI2_IRQHandler, NONE);

void EXTI3_IRQHandler(int irq_num, void *arg)
{
    PinIrqHdr(3);
}
DECLARE_HW_IRQ(GPIO1_INT3_IRQn, EXTI3_IRQHandler, NONE);

void EXTI4_IRQHandler(int irq_num, void *arg)
{
    PinIrqHdr(4);
}
DECLARE_HW_IRQ(GPIO1_INT4_IRQn, EXTI4_IRQHandler, NONE);

void EXTI5_IRQHandler(int irq_num, void *arg)
{
    PinIrqHdr(5);
}
DECLARE_HW_IRQ(GPIO1_INT5_IRQn, EXTI5_IRQHandler, NONE);

void EXTI6_IRQHandler(int irq_num, void *arg)
{
    PinIrqHdr(6);
}
DECLARE_HW_IRQ(GPIO1_INT6_IRQn, EXTI6_IRQHandler, NONE);

void EXTI7_IRQHandler(int irq_num, void *arg)
{
    PinIrqHdr(7);
}
DECLARE_HW_IRQ(GPIO1_INT7_IRQn, EXTI7_IRQHandler, NONE);

