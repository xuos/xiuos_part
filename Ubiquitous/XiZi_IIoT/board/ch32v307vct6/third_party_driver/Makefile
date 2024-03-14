SRC_FILES := 
SRC_DIR := Peripheral

ifeq ($(CONFIG_BSP_USING_UART),y)
  SRC_DIR += uart
endif

ifeq ($(CONFIG_BSP_USING_GPIO),y)
  SRC_DIR += gpio
endif

ifeq ($(CONFIG_BSP_USING_ETH),y)
  SRC_DIR += ethernet
endif

include $(KERNEL_ROOT)/compiler.mk