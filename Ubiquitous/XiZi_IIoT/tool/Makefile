SRC_DIR := 

ifeq ($(CONFIG_TOOL_SHELL),y)
  SRC_DIR += shell
endif

ifeq ($(CONFIG_TOOL_USING_OTA),y)
  SRC_DIR += bootloader
endif

ifeq ($(CONFIG_TOOL_USING_UVCAN),y)
  SRC_DIR += libcanard
endif


include $(KERNEL_ROOT)/compiler.mk
