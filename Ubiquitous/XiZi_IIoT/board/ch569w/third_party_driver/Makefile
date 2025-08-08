SRC_DIR := Peripheral

SRC_DIR += sys

ifeq ($(CONFIG_BSP_USING_UART),y)
  SRC_DIR += uart
endif

include $(KERNEL_ROOT)/compiler.mk
