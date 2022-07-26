OBJS := $(shell cat make.obj)

$(TARGET): $(OBJS) 
	@echo ------------------------------------------------
	@echo link $(TARGET)
	@$(CROSS_COMPILE)g++ -o $@ $($(LINK_FLAGS)) $(OBJS) $(LINK_MUSLLIB) $(LINK_LWIP) $(LIBCC)
	@echo ------------------------------------------------
	@$(CROSS_COMPILE)objcopy -O binary $@ XiZi-$(BOARD)$(COMPILE_TYPE).bin
	@$(CROSS_COMPILE)size $@