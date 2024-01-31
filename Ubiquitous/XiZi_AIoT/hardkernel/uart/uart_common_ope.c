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
 * @file uart_common_ope.c
 * @brief support uart common operation
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.11.20
 */
#include "uart_common_ope.h"
#include "assert.h"

struct PrintProxy {
    struct TraceTag uart_driver_tag;
    struct XiziSerialDriver* serial;
};

static struct PrintProxy* const proxy()
{
    static struct PrintProxy serial_proxy;
    return &serial_proxy;
}

int serial_init(struct TraceTag* uart_driver_tag)
{
    proxy()->uart_driver_tag = *uart_driver_tag;
    proxy()->serial = AchieveResource(&proxy()->uart_driver_tag);
    return 0;
}

static void PrintInt(int xx, int base, int sign)
{
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i;
    uint32_t x;

    if (sign && (sign = xx < 0)) {
        x = -xx;
    } else {
        x = xx;
    }

    i = 0;

    do {
        buf[i++] = digits[x % base];
    } while ((x /= base) != 0);

    if (sign)
        buf[i++] = '-';

    while (--i >= 0)
        proxy()->serial->putc(buf[i]);
}

void KPrintf(char* fmt, ...)
{
    int i, c;
    uint32_t* argp;
    char* s;

    if (fmt == 0) {
        KPrintf("null fmt");
        return;
    }

    argp = (uint32_t*)(void*)(&fmt + 1);

    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
        if (c != '%') {
            proxy()->serial->putc(c);
            continue;
        }

        c = fmt[++i] & 0xff;

        if (!c)
            break;

        switch (c) {
        case 'd':
            PrintInt(*argp++, 10, 1);
            break;

        case 'x':
        case 'p':
            PrintInt(*argp++, 16, 0);
            break;

        case 's':
            if ((s = (char*)*argp++) == 0) {
                s = "(null)";
            }

            for (; *s; s++) {
                proxy()->serial->putc(*s);
            }
            break;

        case '%':
            proxy()->serial->putc('%');
            break;

        default:
            // Print unknown % sequence to draw attention.
            proxy()->serial->putc('%');
            proxy()->serial->putc(c);
            break;
        }
    }
}
