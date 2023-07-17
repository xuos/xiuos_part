ifeq ($(CONFIG_ADD_XIZI_FETURES),y)
SRC_FILES += lwip_mqtt_demo.c
include $(KERNEL_ROOT)/compiler.mk
endif

include $(KERNEL_ROOT)/.config
ifeq ($(CONFIG_ADD_NUTTX_FETURES),y)
    include $(APPDIR)/Make.defs
    CSRCS += lwip_mqtt_demo.c
    include $(APPDIR)/Application.mk
endif

