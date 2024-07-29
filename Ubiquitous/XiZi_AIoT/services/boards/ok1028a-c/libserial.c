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

#define USER_UART_BASE 0x6FFFF000

#define UART0_BASE (0x09000000ULL)
#define UART0_REG(reg) ((volatile uint32_t*)(USER_UART_BASE + reg))

// the UART control registers.
// pl011
#define DR 0x00
#define FR 0x18
#define FR_RXFE (1 << 4) // recieve fifo empty
#define FR_TXFF (1 << 5) // transmit fifo full
#define FR_RXFF (1 << 6) // recieve fifo full
#define FR_TXFE (1 << 7) // transmit fifo empty
#define IBRD 0x24
#define FBRD 0x28
#define LCRH 0x2c
#define LCRH_FEN (1 << 4)
#define LCRH_WLEN_8BIT (3 << 5)
#define CR 0x30
#define IMSC 0x38
#define INT_RX_ENABLE (1 << 4)
#define INT_TX_ENABLE (1 << 5)
#define ICR 0x44

#define UART_READ_REG(reg) (*(UART0_REG(reg)))
#define UART_WRITE_REG(reg, v) (*(UART0_REG(reg)) = (v))

#define UART_TX_BUF_SIZE 32
static char uart_tx_buf[UART_TX_BUF_SIZE];
uint64_t uart_tx_w; // write next to uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE]
uint64_t uart_tx_r; // read next from uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE]

bool init_uart_mmio()
{
    static int mapped = 0;
    if (mapped == 0) {
        if (-1 == mmap(USER_UART_BASE, UART0_BASE, 4096, true)) {
            return false;
        }
        mapped = 1;
    }
    return true;
}

// if the UART is idle, and a character is waiting
// in the transmit buffer, send it.
// caller must hold uart_tx_lock.
// called from both the top- and bottom-half.
void uartstart()
{
    while (1) {
        if (uart_tx_w == uart_tx_r) {
            // transmit buffer is empty.
            return;
        }

        if (UART_READ_REG(FR) & FR_TXFF) {
            // the UART transmit holding register is full,
            // so we cannot give it another byte.
            // it will interrupt when it's ready for a new byte.
            return;
        }

        int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
        uart_tx_r += 1;

        // maybe uartputc() is waiting for space in the buffer.

        UART_WRITE_REG(DR, c);
    }
}

// add a character to the output buffer and tell the
// UART to start sending if it isn't already.
// blocks if the output buffer is full.
// because it may block, it can't be called
// from interrupts; it's only suitable for use
// by write().
void putc(char c)
{
    while (uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE)
        ;
    uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    uart_tx_w += 1;
    uartstart();
    return;
}

// read one input character from the UART.
// return -1 if none is waiting.
char getc(void)
{
    if (UART_READ_REG(FR) & FR_RXFE)
        return 0xFF;
    else
        return UART_READ_REG(DR);
}