SRC_DIR := MIMXRT1052  

ifeq ($(CONFIG_BSP_USING_LPUART),y)
  SRC_DIR += uart
endif

ifeq ($(CONFIG_BSP_USING_LWIP),y)
  SRC_DIR += ethernet
endif

include $(KERNEL_ROOT)/compiler.mk
