
# include $(APPDIR)/Application.mk
# ifeq ($(CONFIG_ADD_NUTTX_FETURES),y)
    # include $(APPDIR)/Make.defs
    # CSRCS += $(wildcard src/*/*.c) $(wildcard support/*.c)
    # include $(APPDIR)/Application.mk
# endif

# ifeq ($(CONFIG_ADD_XIZI_FEATURES),y)
	SRC_DIR := 
	ifeq ($(CONFIG_APP_BENCHMARK), y)
		SRC_DIR += src
		SRC_DIR += support
	endif
	include $(KERNEL_ROOT)/compiler.mk
# endif
