#include "lv_sensor_info.h"

void* lvgl_thd_sensor_info_update_demo(void *parameter)
{
    double val = 0;
    while (1)
    {
        sensor_update_val(val + 0.1, O3);
        sensor_update_val(val, CO2);
        sensor_update_val(val + 0.2, NO2);
        sensor_update_val(val - 0.1, SO2);
        sensor_update_val(val + 0.3, AQS);
        sensor_update_val(val - 0.3, O2);
        sensor_update_val(val + 0.3, TEMPERATURE);
        val += 0.3;
        PrivTaskDelay(10);
    }
}

pthread_t lvgl_task;
static int lvgl_sensor_info_update_demo(void)
{
    pthread_attr_t attr;
    attr.schedparam.sched_priority = 25;
    attr.stacksize = 4096;

    PrivTaskCreate(&lvgl_task, &attr, lvgl_thd_sensor_info_update_demo, NULL);

    return 0;
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0),lvgl_sensor_info_update_demo, lvgl_sensor_info_update_demo, lvgl_sensor_info_update_demo );

