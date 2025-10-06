obj-m += blkram.o
KERNEL_DIR ?= ../../../linux-rust

CLANG_FLAGS_MODULE += -fno-conserve-stack
KBUILD_CFLAGS_REMOVE   += -fconserve-stack
KBUILD_AFLAGS_REMOVE   += -fconserve-stack
all:
	make -C $(KERNEL_DIR) M=$(PWD) modules LLVM=1

clean:
	make -C $(KERNEL_DIR) M=$(PWD) clean LLVM=1

extract:
	make RUSTFLAGS="--emit=llvm-bc,obj" LLVM=1

install:
	sudo insmod zero.ko

uninstall:
	sudo rmmod zero



.PHONY: all clean install uninstall test