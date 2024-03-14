/*
 * Copyright (c) 2006-2022, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2019-06-21     flybreak     first version
 */

/**
* @file sample_mb_master.c
* @brief support freemodbus port for XiUOS
* @version 3.0 
* @author AIIT XUOS Lab
* @date 2023-10-12
*/

/*************************************************
File name: sample_mb_master.c
Description: support freemodbus port for XiUOS
Others: 
History: 
1. Date: 2023-10-12
Author: AIIT XUOS Lab
Modification: 
1、support XiUOS for master demo.
*************************************************/

#include <transform.h>

#ifdef ADD_RTTHREAD_FEATURES
#include <rtthread.h>
#endif

#include "mb.h"
#include "mb_m.h"

#ifdef ADD_RTTHREAD_FEATURES
#ifdef PKG_MODBUS_MASTER_SAMPLE
#define SLAVE_ADDR      MB_SAMPLE_TEST_SLAVE_ADDR
#define PORT_NUM        MB_MASTER_USING_PORT_NUM
#define PORT_BAUDRATE   MB_MASTER_USING_PORT_BAUDRATE
#else
#define SLAVE_ADDR      0x01
#define PORT_NUM        3
#define PORT_BAUDRATE   115200
#endif
#define PORT_PARITY     MB_PAR_EVEN

#define MB_POLL_THREAD_PRIORITY  10
#define MB_SEND_THREAD_PRIORITY  RT_THREAD_PRIORITY_MAX - 1

#define MB_SEND_REG_START  2
#define MB_SEND_REG_NUM    2

#define MB_POLL_CYCLE_MS   500

static void send_thread_entry(void *parameter)
{
    eMBMasterReqErrCode error_code = MB_MRE_NO_ERR;
    rt_uint16_t error_count = 0;
    USHORT data[MB_SEND_REG_NUM] = {0};

    while (1)
    {
        /* Test Modbus Master */
        data[0] = (USHORT)(rt_tick_get() / 10);
        data[1] = (USHORT)(rt_tick_get() % 10);

        error_code = eMBMasterReqWriteMultipleHoldingRegister(SLAVE_ADDR,          /* salve address */
                                                              MB_SEND_REG_START,   /* register start address */
                                                              MB_SEND_REG_NUM,     /* register total number */
                                                              data,                /* data to be written */
                                                              RT_WAITING_FOREVER); /* timeout */

        /* Record the number of errors */
        if (error_code != MB_MRE_NO_ERR)
        {
            error_count++;
        }
    }
}

static void mb_master_poll(void *parameter)
{
    eMBMasterInit(MB_RTU, PORT_NUM, PORT_BAUDRATE, PORT_PARITY);
    eMBMasterEnable();

    while (1)
    {
        eMBMasterPoll();
        rt_thread_mdelay(MB_POLL_CYCLE_MS);
    }
}

static int mb_master_sample(int argc, char **argv)
{
    static rt_uint8_t is_init = 0;
    rt_thread_t tid1 = RT_NULL, tid2 = RT_NULL;

    if (is_init > 0)
    {
        rt_kprintf("sample is running\n");
        return -RT_ERROR;
    }
    tid1 = rt_thread_create("md_m_poll", mb_master_poll, RT_NULL, 512, MB_POLL_THREAD_PRIORITY, 10);
    if (tid1 != RT_NULL)
    {
        rt_thread_startup(tid1);
    }
    else
    {
        goto __exit;
    }

    tid2 = rt_thread_create("md_m_send", send_thread_entry, RT_NULL, 512, MB_SEND_THREAD_PRIORITY, 10);
    if (tid2 != RT_NULL)
    {
        rt_thread_startup(tid2);
    }
    else
    {
        goto __exit;
    }

    is_init = 1;
    return RT_EOK;

__exit:
    if (tid1)
        rt_thread_delete(tid1);
    if (tid2)
        rt_thread_delete(tid2);

    return -RT_ERROR;
}
MSH_CMD_EXPORT(mb_master_sample, run a modbus master sample);
#endif

#ifdef ADD_XIZI_FEATURES
#define SLAVE_ADDR      0x01
#define PORT_NUM        4
#define PORT_BAUDRATE   115200
#define PORT_PARITY     MB_PAR_NONE

#define MB_POLL_THREAD_PRIORITY  22
#define MB_SEND_THREAD_PRIORITY  22

#define MB_SEND_REG_START  2
#define MB_SEND_REG_NUM    2

#define MB_POLL_CYCLE_MS   500

static pthread_t tid1, tid2;

static void *send_thread_entry(void *parameter)
{
    eMBMasterReqErrCode error_code = MB_MRE_NO_ERR;
    uint16_t error_count = 0;
    USHORT data[MB_SEND_REG_NUM] = {0};

    while (1) {
        /* Test Modbus Master */
        data[0] = (USHORT)(PrivGetTickTime() / 10);
        data[1] = (USHORT)(PrivGetTickTime() % 10);

        error_code = eMBMasterReqWriteMultipleHoldingRegister(SLAVE_ADDR,          /* salve address */
                                                              MB_SEND_REG_START,   /* register start address */
                                                              MB_SEND_REG_NUM,     /* register total number */
                                                              data,                /* data to be written */
                                                              0); /* timeout */

        /* Record the number of errors */
        if (error_code != MB_MRE_NO_ERR) {
            error_count++;
        }
    }
}

static void *mb_master_poll(void *parameter)
{
    eMBMasterInit(MB_RTU, PORT_NUM, PORT_BAUDRATE, PORT_PARITY);
    eMBMasterEnable();

    while (1) {
        eMBMasterPoll();
        PrivTaskDelay(MB_POLL_CYCLE_MS);
    }
}

static int mb_master_sample(void)
{
    static uint8_t is_init = 0;

    if (is_init > 0) {
        printf("sample is running\n");
        return -1;
    }

    pthread_attr_t attr;
    attr.schedparam.sched_priority = MB_POLL_THREAD_PRIORITY;
    attr.stacksize = 2048;

    char task1_name[] = "md_m_poll";
    pthread_args_t args;
    args.pthread_name = task1_name;

    PrivTaskCreate(&tid1, &attr, &mb_master_poll, (void *)&args);
    PrivTaskStartup(&tid1);

    attr.schedparam.sched_priority = MB_SEND_THREAD_PRIORITY;
    attr.stacksize = 2048;

    char task2_name[] = "md_m_send";
    args.pthread_name = task2_name;

    PrivTaskCreate(&tid2, &attr, &send_thread_entry, (void *)&args);
    PrivTaskStartup(&tid2);

    is_init = 1;
    return 0;
}
PRIV_SHELL_CMD_FUNCTION(mb_master_sample, run a modbus master sample, PRIV_SHELL_CMD_MAIN_ATTR);
#endif

