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

/// this file is only used for debug
#include "libserial.h"
#include "usyscall.h"

uint32_t Xil_In32(intptr_t Addr)
{
    return *(volatile uint32_t*)Addr;
}
void Xil_Out32(intptr_t Addr, uint32_t Value)
{
    uint32_t* LocalAddr = (uint32_t*)Addr;
    *LocalAddr = Value;
}
#define XUartPs_IsTransmitFull(BaseAddress) \
    ((*(volatile uint32_t*)((BaseAddress) + 0x002CU) & (uint32_t)0x00000010U) == (uint32_t)0x00000010U)
#define XUartPs_WriteReg(BaseAddress, RegOffset, RegisterValue) \
    Xil_Out32((BaseAddress) + (uint32_t)(RegOffset), (uint32_t)(RegisterValue))

#define XUartPs_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (uint32_t)(RegOffset))
#define XUartPs_IsReceiveData(BaseAddress) \
    !((Xil_In32((BaseAddress) + 0x002CU) & (uint32_t)0x00000002U) == (uint32_t)0x00000002U)

uint8_t XUartPs_RecvByte(uint32_t BaseAddress)
{
    uint32_t RecievedByte;
    /* Wait until there is data */
    while (!XUartPs_IsReceiveData(BaseAddress)) {
        ;
    }
    RecievedByte = XUartPs_ReadReg(BaseAddress, 0x0030U);
    /* Return the byte received */
    return (uint8_t)RecievedByte;
}

#define USER_UART_BASE 0x6FFFF000

static bool init_uart_mmio()
{
    static int mapped = 0;
    if (mapped == 0) {
        if (-1 == mmap(USER_UART_BASE, 0xE0001000, 4096, true)) {
            return false;
        }
        mapped = 1;
    }
    return true;
}

static void putc(char c)
{
    if (c == '\n') {
        while (XUartPs_IsTransmitFull(USER_UART_BASE)) {
            ;
        }

        XUartPs_WriteReg(USER_UART_BASE, 0x0030U, (uint32_t)'\r');
    }

    while (XUartPs_IsTransmitFull(USER_UART_BASE)) {
        ;
    }

    XUartPs_WriteReg(USER_UART_BASE, 0x0030U, (uint32_t)c);
}

char getc(void)
{
    if (!init_uart_mmio()) {
        return 0xFF;
    }
    return XUartPs_RecvByte(USER_UART_BASE);
}

static void printint(int xx, int base, int sgn)
{
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint32_t x;

    neg = 0;
    if (sgn && xx < 0) {
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    }

    i = 0;
    do {
        buf[i++] = digits[x % base];
    } while ((x /= base) != 0);
    if (neg)
        buf[i++] = '-';

    while (--i >= 0)
        putc(buf[i]);
}

// Print to usart. Only understands %d, %x, %p, %s.
void printf(char* fmt, ...)
{
    if (!init_uart_mmio()) {
        return;
    }
    char* s;
    int c, i, state;
    uint32_t* ap;

    state = 0;
    ap = (uint32_t*)(void*)&fmt + 1;
    for (i = 0; fmt[i]; i++) {
        c = fmt[i] & 0xff;
        if (state == 0) {
            if (c == '%') {
                state = '%';
            } else {
                putc(c);
            }
        } else if (state == '%') {
            if (c == 'd') {
                printint(*ap, 10, 1);
                ap++;
            } else if (c == 'x' || c == 'p') {
                printint(*ap, 16, 0);
                ap++;
            } else if (c == 's') {
                s = (char*)*ap;
                ap++;
                if (s == 0)
                    s = "(null)";
                while (*s != 0) {
                    putc(*s);
                    s++;
                }
            } else if (c == 'c') {
                putc(*ap);
                ap++;
            } else if (c == '%') {
                putc(c);
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc('%');
                putc(c);
            }
            state = 0;
        }
    }
}