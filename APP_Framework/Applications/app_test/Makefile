include $(KERNEL_ROOT)/.config
ifeq ($(CONFIG_ADD_NUTTX_FETURES),y)
    include $(APPDIR)/Make.defs

    ifeq ($(CONFIG_USER_TEST_SEMC),y)
        CSRCS += test_extsram.c
    endif

    ifeq ($(CONFIG_USER_TEST_LCD),y)
        CSRCS += test_lcd.c
    endif

    ifeq ($(CONFIG_BSP_USING_TOUCH),y)
        CSRCS += test_touch.c
    endif

    ifeq ($(CONFIG_MUSL_LIBC),y)
        CSRCS += test_musl.c
    endif

    include $(APPDIR)/Application.mk

endif

ifeq ($(CONFIG_ADD_XIZI_FETURES),y)
    SRC_FILES := test_shell.c

    ifeq ($(CONFIG_USER_TEST_ADC),y)
        SRC_FILES += test_adc.c
    endif

    ifeq ($(CONFIG_USER_TEST_DAC),y)
        SRC_FILES += test_dac.c
    endif

    ifeq ($(CONFIG_USER_TEST_SEMC),y)
        SRC_FILES += test_extsram.c
    endif

    ifeq ($(CONFIG_USER_TEST_LCD),y)
        SRC_FILES +=
    endif

    include $(KERNEL_ROOT)/compiler.mk
endif
