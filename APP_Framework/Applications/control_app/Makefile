SRC_DIR := plc_demo
SRC_DIR += modbus_tcp_server_demo

ifeq ($(CONFIG_RESOURCES_LWIP),y)

ifeq ($(CONFIG_USING_CONTROL_PLC_OPCUA), y)
	SRC_DIR += opcua_demo 
endif

endif

include $(KERNEL_ROOT)/compiler.mk
