//
// low-level driver routines for pl011 UART.
//

#include "uart.h"
#include "actracer.h"
#include "ns16550.h"
#include "uart_common_ope.h"

// the UART control registers are memory-mapped
// at address UART0. this macro returns the
// address of one of the registers.

// the transmit output buffer.
#define UART_TX_BUF_SIZE 32
// static char uart_tx_buf[UART_TX_BUF_SIZE];
uint64_t uart_tx_w; // write next to uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE]
uint64_t uart_tx_r; // read next from uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE]

void uartinit(void)
{
    // // disable uart
    // UART_WRITE_REG(CR, 0);

    // // disable interrupts.
    // UART_WRITE_REG(IMSC, 0);

    // // in qemu, it is not necessary to set baudrate.
    // // enable FIFOs.
    // // set word length to 8 bits, no parity.
    // UART_WRITE_REG(LCRH, LCRH_FEN | LCRH_WLEN_8BIT);

    // // enable RXE, TXE and enable uart.
    // UART_WRITE_REG(CR, 0x301);

    // // enable transmit and receive interrupts.
    // UART_WRITE_REG(IMSC, INT_RX_ENABLE | INT_TX_ENABLE);

    _debug_uart_init();
}

// if the UART is idle, and a character is waiting
// in the transmit buffer, send it.
// caller must hold uart_tx_lock.
// called from both the top- and bottom-half.
void uartstart()
{
    // while (1) {
    //     if (uart_tx_w == uart_tx_r) {
    //         // transmit buffer is empty.
    //         return;
    //     }

    //     if (UART_READ_REG(FR) & FR_TXFF) {
    //         // the UART transmit holding register is full,
    //         // so we cannot give it another byte.
    //         // it will interrupt when it's ready for a new byte.
    //         return;
    //     }

    //     int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
    //     uart_tx_r += 1;

    //     // maybe uartputc() is waiting for space in the buffer.

    //     UART_WRITE_REG(DR, c);
    // }
}

void uartputc(uint8_t c)
{
    // while (uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE)
    //     ;
    // uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    // uart_tx_w += 1;
    // uartstart();
    // return;
    _debug_uart_putc((int)c);
}

// read one input character from the UART.
// return -1 if none is waiting.
static uint8_t uartgetc(void)
{
    // if (UART_READ_REG(FR) & FR_RXFE)
    //     return 0xFF;
    // else
    //     return UART_READ_REG(DR);
    return 0xFF;
}

static uint32_t UartGetIrqnum()
{
    return 0;
}

static struct XiziSerialDriver hardkernel_serial_driver = {
    .sys_serial_init = uartinit,
    .get_serial_irqnum = UartGetIrqnum,
    .putc = uartputc,
    .getc = uartgetc,
};

struct XiziSerialDriver* hardkernel_uart_init(struct TraceTag* hardkernel_tag)
{
    hardkernel_serial_driver.sys_serial_init();
    return &hardkernel_serial_driver;
}