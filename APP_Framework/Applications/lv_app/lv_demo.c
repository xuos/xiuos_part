/*
 * Copyright (c) 2006-2021, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author        Notes
 * 2021-10-17     Meco Man      First version
 */
#include <lvgl.h>
#include <lv_port_indev_template.h>
#include "lv_demo_calendar.h"
#include <transform.h>

void* lvgl_thread(void *parameter)
{
    /* display demo; you may replace with your LVGL application at here */
    lv_demo_calendar();

    /* handle the tasks of LVGL */
    while(1)
    {
        lv_task_handler();
        PrivTaskDelay(10);
    }
}

pthread_t lvgl_task;
static int lvgl_demo_init(void)
{
    pthread_attr_t attr;
    attr.schedparam.sched_priority = 20;
    attr.stacksize = 4096;

    PrivTaskCreate(&lvgl_task, &attr, lvgl_thread, NULL);

    return 0;
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0),lvgl_demo_init, lvgl_demo_init, lvgl_demo_init );

