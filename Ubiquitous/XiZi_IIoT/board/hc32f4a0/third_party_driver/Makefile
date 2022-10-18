SRC_DIR += common

ifeq ($(CONFIG_BSP_USING_UART),y)
  SRC_DIR += usart
endif

ifeq ($(CONFIG_BSP_USING_SPI),y)
  SRC_DIR += spi
endif

include $(KERNEL_ROOT)/compiler.mk
