SRC_DIR := Peripheral

SRC_DIR += sys

ifeq ($(CONFIG_BSP_USING_UART),y)
  SRC_DIR += uart
endif

ifeq ($(CONFIG_BSP_USING_SPI),y)
  SRC_DIR += spi
endif

include $(KERNEL_ROOT)/compiler.mk
