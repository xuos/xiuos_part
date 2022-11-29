
#include <nuttx/config.h>

#include <sys/types.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include <stdbool.h>
#include <unistd.h>
#include <string.h>
#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <debug.h>

#include <arch/board/board.h>
#include "chip.h"
#include "hc32_uart.h"
#include "hc32_spi.h"

void hc32_test_console(void)
{
    char *dev_str = "/dev/console";
    char *test_chr = "test";
    int fd = 0, ret;

    fd = open(dev_str, 0x6);
    hc32_print("%s: open <%s> ret = %d\n", __func__, dev_str, fd);
    ret = write(fd, test_chr, strlen(test_chr));
    hc32_print("%s: open %d ret %d\n", __func__, fd, ret);
    close(fd);
}

void hc32_console_handle(char *buf)
{
    if(strncmp(buf, "console", 7) == 0)
    {
        hc32_test_console();
    }
    else if(strncmp(buf, "spi", 7) == 0)
    {
        hc32_print("start flash test ...\n");
        hc32_spiflash_test();
    }
}

