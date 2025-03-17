/**
 ****************************************************************************************************
 * @file        sys.h
 * @author      ����ԭ���Ŷ�(ALIENTEK)
 * @version     V1.0
 * @date        2023-06-12
 * @brief       ϵͳ��ʼ������
 * @license     Copyright (c) 2020-2032, �������������ӿƼ����޹�˾
 ****************************************************************************************************
 * @attention
 * 
 * ʵ��ƽ̨:����ԭ�� ������ H750������
 * ������Ƶ:www.yuanzige.com
 * ������̳:www.openedv.com
 * ��˾��ַ:www.alientek.com
 * �����ַ:openedv.taobao.com
 * 
 ****************************************************************************************************
 */

#ifndef __SYS_H
#define __SYS_H

#include "stm32h7xx_hal.h"
#include "stm32h7xx_hal_rcc_ex.h"

/**
 * SYS_SUPPORT_OS���ڶ���ϵͳ�ļ����Ƿ�֧��OS
 * 0,��֧��OS
 * 1,֧��OS
 */
#define SYS_SUPPORT_OS 0

/* �������ø�����ʱ�� */
extern RCC_PeriphCLKInitTypeDef rcc_periph_clk_init_struct;

/* �������� */
void sys_cache_enable(void);                                                                /* ʹ��STM32H7��L1-Cache */
uint8_t sys_stm32_clock_init(uint32_t plln, uint32_t pllm, uint32_t pllp, uint32_t pllq);   /* ����ʱ�� */
void sys_qspi_enable_memmapmode(void);                                                      /* ʹ��QSPI�ڴ�ӳ��ģʽ */

#endif
