SRC_DIR :=

ifeq ($(CONFIG_RESOURCES_LWIP),y)
	SRC_DIR += lwip_demo

ifeq ($(CONFIG_USING_CONTROL_PLC_OPCUA), y)
	SRC_DIR += opcua_demo
endif

endif

include $(KERNEL_ROOT)/compiler.mk
