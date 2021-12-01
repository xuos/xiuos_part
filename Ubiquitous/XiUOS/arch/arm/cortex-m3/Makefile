ifeq ($(CONFIG_BOARD_CORTEX_M3_EVB),y)
SRC_FILES := boot.c
endif

ifeq ($(CONFIG_BOARD_STM32F103_NANO),y)
SRC_FILES := boot.S
endif

SRC_FILES += interrupt.c interrupt_vector.S

include $(KERNEL_ROOT)/compiler.mk
