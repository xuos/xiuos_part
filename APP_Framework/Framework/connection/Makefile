SRC_FILES := adapter.c adapter_agent.c

ifeq ($(CONFIG_CONNECTION_ADAPTER_LORA),y)
	SRC_DIR += lora
endif

ifeq ($(CONFIG_CONNECTION_ADAPTER_4G),y)
	SRC_DIR += 4g
endif

ifeq ($(CONFIG_CONNECTION_ADAPTER_NB),y)
	SRC_DIR += nbiot
endif

ifeq ($(CONFIG_CONNECTION_ADAPTER_WIFI),y)
	SRC_DIR += wifi
endif

ifeq ($(CONFIG_CONNECTION_ADAPTER_ETHERNET),y)
	SRC_DIR += ethernet
endif

ifeq ($(CONFIG_CONNECTION_ADAPTER_BLUETOOTH),y)
	SRC_DIR += bluetooth
endif

ifeq ($(CONFIG_CONNECTION_ADAPTER_ZIGBEE),y)
	SRC_DIR += zigbee
endif

ifeq ($(CONFIG_CONNECTION_ADAPTER_5G),y)
	SRC_DIR += 5g
endif

include $(KERNEL_ROOT)/compiler.mk