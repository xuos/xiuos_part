include $(KERNEL_ROOT)/.config
ifeq ($(CONFIG_ADD_NUTTX_FETURES),y)
    include $(APPDIR)/Make.defs
    CSRCS += double_list.c single_list.c
    include $(APPDIR)/Application.mk
endif

ifeq ($(CONFIG_ADD_XIUOS_FETURES),y)
    SRC_FILES := double_list.c single_list.c
    include $(KERNEL_ROOT)/compiler.mk
endif