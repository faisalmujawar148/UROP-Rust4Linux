obj-m += simple_driver.o
KERNEL_DIR ?= ../../../linux-rust

CLANG_FLAGS_MODULE += -fno-conserve-stack
KBUILD_CFLAGS_REMOVE   += -fconserve-stack
KBUILD_AFLAGS_REMOVE   += -fconserve-stack
all:
	make -C $(KERNEL_DIR) M=$(PWD) modules CC=gcc

clean:
	make -C $(KERNEL_DIR) M=$(PWD) clean CC=gcc

install:
	sudo insmod simple_driver.ko

uninstall:
	sudo rmmod simple_driver



.PHONY: all clean install uninstall test