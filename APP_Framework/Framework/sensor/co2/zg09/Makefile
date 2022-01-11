include $(KERNEL_ROOT)/.config

ifeq ($(CONFIG_ADD_NUTTX_FETURES),y)
    include $(APPDIR)/Make.defs
    CSRCS += zg09.c
    include $(APPDIR)/Application.mk
endif

ifeq ($(CONFIG_ADD_XIUOS_FETURES),y)
    SRC_FILES := zg09.c
    include $(KERNEL_ROOT)/compiler.mk
endif

