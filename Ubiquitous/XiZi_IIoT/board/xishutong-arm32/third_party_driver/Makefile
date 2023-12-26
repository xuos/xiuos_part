SRC_DIR += common

ifeq ($(CONFIG_BSP_USING_UART),y)
  SRC_DIR += usart
endif

ifeq ($(CONFIG_BSP_USING_GPIO),y)
  SRC_DIR += gpio
endif

ifeq ($(CONFIG_BSP_USING_ETHERNET),y)
  SRC_DIR += ethernet
endif

ifeq ($(CONFIG_BSP_USING_W5500),y)
  SRC_DIR += ethernet_wiz
endif

ifeq ($(CONFIG_BSP_USING_SDIO),y)
  SRC_DIR += sdio
endif

ifeq ($(CONFIG_BSP_USING_SPI),y)
  SRC_DIR += spi
endif

ifeq ($(CONFIG_BSP_USING_EXTSDRAM),y)
  SRC_DIR += sdram
endif

include $(KERNEL_ROOT)/compiler.mk
