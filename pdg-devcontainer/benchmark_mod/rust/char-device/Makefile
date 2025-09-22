obj-m += hello.o
KERNEL_DIR ?= ../../../linux-rust

CLANG_FLAGS_MODULE += -fno-conserve-stack
KBUILD_CFLAGS_REMOVE   += -fconserve-stack
KBUILD_AFLAGS_REMOVE   += -fconserve-stack
all:
	make -C $(KERNEL_DIR) M=$(PWD) modules CC=gcc

clean:
	make -C $(KERNEL_DIR) M=$(PWD) clean CC=gcc

install:
	sudo insmod hello.ko

uninstall:
	sudo rmmod hello



.PHONY: all clean install uninstall test