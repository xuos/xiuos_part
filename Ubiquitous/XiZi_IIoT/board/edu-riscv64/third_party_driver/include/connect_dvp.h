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
* @file connect_dvp.h
* @brief define edu-riscv64-board DVP init function
* @version 2.0 
* @author AIIT XUOS Lab
* @date 2022-11-21
*/
#ifndef CONNECT_DVP_H
#define CONNECT_DVP_H
#include <device.h>

#ifdef __cplusplus
extern "C" {
#endif

#define REG_SCCB_READ 0x12U
#define REG_SCCB_WRITE 0x13U
#define SCCB_REG_LENGTH 0x08U
#define IOCTRL_CAMERA_START_SHOT (20)
#define SET_DISPLAY_ADDR (21)
#define SET_AI_ADDR (22)
#define IOCTRL_CAMERA_OUT_SIZE_RESO (23)


typedef struct 
{
    uintptr_t r_addr;
    uintptr_t g_addr;
    uintptr_t b_addr;
}RgbAddress;

typedef struct 
{
    uintptr_t pdata; 
    uint32_t length;
}_ioctl_shoot_para;

typedef struct 
{
    uint32_t width;         // width   The width  of image
    uint32_t height;        // height  The height of image
}_ioctl_set_reso;

int HwDvpInit(void);

#ifdef __cplusplus
}
#endif

#endif