SRC_DIR :=

ifeq ($(CONFIG_USING_CONTROL_PLC_OPCUA), y)
	SRC_DIR += opcua
endif

SRC_FILES += interoperability.c

include $(KERNEL_ROOT)/compiler.mk
