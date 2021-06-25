SRC_FILES := adapter.c

ifeq ($(CONFIG_ADAPTER_LORA),y)
	SRC_DIR += lora
endif

ifeq ($(CONFIG_ADAPTER_4G),y)
	SRC_DIR += 4G
endif

ifeq ($(CONFIG_ADAPTER_NB),y)
	SRC_DIR += nbiot
endif

ifeq ($(CONFIG_ADAPTER_WIFI),y)
	SRC_DIR += wifi
endif

ifeq ($(CONFIG_ADAPTER_ETHERNET),y)
	SRC_DIR += ethernet
endif

ifeq ($(CONFIG_ADAPTER_BLUETOOTH),y)
	SRC_DIR += bluetooth
endif

ifeq ($(CONFIG_ADAPTER_ZIGBEE),y)
	SRC_DIR += zigbee
endif

ifeq ($(CONFIG_ADAPTER_5G),y)
	SRC_DIR += 5G
endif

include $(KERNEL_ROOT)/compiler.mk