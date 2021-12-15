SRC_FILES := sensor.c

ifeq ($(CONFIG_SENSOR_HCHO),y)
	SRC_DIR += hcho
endif

ifeq ($(CONFIG_SENSOR_TVOC),y)
	SRC_DIR += tvoc
endif

ifeq ($(CONFIG_SENSOR_IAQ),y)
	SRC_DIR += iaq
endif

ifeq ($(CONFIG_SENSOR_CH4),y)
	SRC_DIR += ch4
endif

ifeq ($(CONFIG_SENSOR_CO2),y)
	SRC_DIR += co2
endif

ifeq ($(CONFIG_SENSOR_PM),y)
	SRC_DIR += pm
endif

ifeq ($(CONFIG_SENSOR_VOICE),y)
	SRC_DIR += voice
endif

ifeq ($(CONFIG_SENSOR_TEMPERATURE),y)
	SRC_DIR += temperature
endif

ifeq ($(CONFIG_SENSOR_HUMIDITY),y)
	SRC_DIR += humidity
endif

include $(KERNEL_ROOT)/compiler.mk
