SRC_FILES := entry.S trampoline.S $(BOARD)/trap_common.c $(BOARD)/trap.c $(BOARD)/plic.c error_debug.c hard_spinlock.S

ifeq ($(BOARD), jh7110)
SRC_DIR := gicv3
SRC_FILES += $(BOARD)/
endif


include $(KERNEL_ROOT)/compiler.mk