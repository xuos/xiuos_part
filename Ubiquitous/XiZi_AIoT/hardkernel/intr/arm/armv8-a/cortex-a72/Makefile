SRC_FILES := vector.S trampoline.S $(BOARD)/trap_common.c error_debug.c hard_spinlock.S

ifeq ($(BOARD), ok1028a-c)
SRC_DIR := gicv3
SRC_FILES += $(BOARD)/
endif


include $(KERNEL_ROOT)/compiler.mk