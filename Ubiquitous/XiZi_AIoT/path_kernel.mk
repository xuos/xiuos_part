
export KERNELPATHS:= -I$(BSP_ROOT)

ifeq ($(CONFIG_LIB_NEWLIB),y)
KERNELPATHS += -I$(KERNEL_ROOT)/services/lib/newlib/include #
endif

ifeq ($(BSP_ROOT),$(KERNEL_ROOT)/services/boards/imx6q-sabrelite)
KERNELPATHS += \
	-I$(KERNEL_ROOT)/hardkernel \
	-I$(KERNEL_ROOT)/hardkernel/boot/include \
	-I$(KERNEL_ROOT)/hardkernel/boot/sdk/imx6/include \
	-I$(KERNEL_ROOT)/hardkernel/cpu/include  \
	-I$(KERNEL_ROOT)/hardkernel/cpu/sdk/imx6/include \
	-I$(KERNEL_ROOT)/hardkernel/clock/  \
	-I$(KERNEL_ROOT)/hardkernel/clock/arm/armv7-a/cortex-a9/imx6q-sabrelite/include \
	-I$(KERNEL_ROOT)/hardkernel/mmu/  \
	-I$(KERNEL_ROOT)/hardkernel/mmu/arm/armv7-a/cortex-a9/include  \
	-I$(KERNEL_ROOT)/hardkernel/intr/ \
	-I$(KERNEL_ROOT)/hardkernel/intr/arm/armv7-a/cortex-a9/ \
	-I$(KERNEL_ROOT)/hardkernel/intr/arm/armv7-a/cortex-a9/gicv2 \
	-I$(KERNEL_ROOT)/hardkernel/arch/arm/armv7-a/cortex-a9/preboot_for_nxp_imx6q_sabrelite/include \
	-I$(KERNEL_ROOT)/hardkernel/arch/arm/armv7-a/cortex-a9/ \
	-I$(KERNEL_ROOT)/hardkernel/uart/ \
	-I$(KERNEL_ROOT)/hardkernel/uart/arm/armv7-a/cortex-a9/uart_io_for_imx6q_sabrelite/include \
	-I$(KERNEL_ROOT)/hardkernel/uart/arm/armv7-a/cortex-a9/ \
	-I$(KERNEL_ROOT)/hardkernel/cache/ \
	-I$(KERNEL_ROOT)/hardkernel/cache/L1/arm/cortex-a9/ \
	-I$(KERNEL_ROOT)/hardkernel/cache/L2/pl310/ \
	-I$(KERNEL_ROOT)/softkernel/include \
	-I$(KERNEL_ROOT)/kernel_actracer/ \
	-I$(KERNEL_ROOT)/include
endif

KERNELPATHS += -I$(KERNEL_ROOT)/../../APP_Framework/Applications/general_functions/list #


