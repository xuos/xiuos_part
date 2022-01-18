SRC_DIR := common gpio

ifeq ($(CONFIG_BSP_USING_LPUART),y)
  SRC_DIR += uart
endif

ifeq ($(CONFIG_BSP_USING_LWIP),y)
  SRC_DIR += ethernet
endif

ifeq ($(CONFIG_BSP_USING_SEMC),y)
  SRC_DIR += semc
endif

include $(KERNEL_ROOT)/compiler.mk
