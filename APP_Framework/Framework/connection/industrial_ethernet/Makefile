all: COMPILER

CUR_DIR := $(shell pwd)
OPLK_ROOT := $(CUR_DIR)/openPOWERLINK
LIBOPLKMN := $(OPLK_ROOT)/stack/lib/xiuos/arm/liboplkmn.a
LIBOPLKCN := $(OPLK_ROOT)/stack/lib/xiuos/arm/liboplkcn.a
LIBOPLK_BUILD_DIR := $(OPLK_ROOT)/stack/build/xiuos
OPLK_TOOLCHAIN := $(OPLK_ROOT)/cmake/toolchain-xiuos-arm-none-eabi-gnu.cmake

.PHONY: $(LIBOPLKMN) $(LIBOPLKCN)
$(LIBOPLKMN) $(LIBOPLKCN)&:
	cd $(LIBOPLK_BUILD_DIR) && \
		rm -rf CMakeFiles proj cmake_install.cmake CMakeCache.txt Makefile && \
		cmake -DCMAKE_TOOLCHAIN_FILE=$(OPLK_TOOLCHAIN) ../.. && \
		cmake --build . --target install

LIBOPLKMN := $(LIBOPLKMN:$(CUR_DIR)/%=%)
LIBOPLKCN := $(LIBOPLKCN:$(CUR_DIR)/%=%)

SRC_FILES := $(LIBOPLKMN) $(LIBOPLKCN)

ifeq ($(CONFIG_CONNECTION_ADAPTER_ETHERCAT),y)
	SRC_DIR += ethercat
endif

include $(KERNEL_ROOT)/compiler.mk
