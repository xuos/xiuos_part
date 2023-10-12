SRC_DIR := freemodbus-latest

ifeq ($(CONFIG_CONNECTION_MODBUS_USING_RTU),y)
	SRC_FILES := adapter_modbus_rtu.c
endif

ifeq ($(CONFIG_CONNECTION_MODBUS_USING_TCP),y)
	SRC_FILES := adapter_modbus_tcp.c
endif

include $(KERNEL_ROOT)/compiler.mk
