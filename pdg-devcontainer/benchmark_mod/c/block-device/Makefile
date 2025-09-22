obj-m += blkram.o
KERNEL_DIR ?= ../../../linux-rust

CLANG_FLAGS_MODULE += -fno-conserve-stack
KBUILD_CFLAGS_REMOVE   += -fconserve-stack
KBUILD_AFLAGS_REMOVE   += -fconserve-stack
all:
	make -C $(KERNEL_DIR) M=$(PWD) modules CC=gcc

clean:
	make -C $(KERNEL_DIR) M=$(PWD) clean CC=gcc

install:
	sudo insmod blkram.ko

uninstall:
	sudo rmmod blkram



.PHONY: all clean install uninstall test