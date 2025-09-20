obj-m += simple_driver.o
KERNEL_DIR ?= ../../../linux-rust

CLANG_FLAGS_MODULE += -fno-conserve-stack
KBUILD_CFLAGS_REMOVE   += -fconserve-stack
KBUILD_AFLAGS_REMOVE   += -fconserve-stack
all:
	make LLVM=1 -C $(KERNEL_DIR) M=$(PWD) modules

clean:
	make LLVM=1 -C $(KERNEL_DIR) M=$(PWD) clean

install:
	sudo insmod simple_driver.ko

uninstall:
	sudo rmmod simple_driver

test:
	@echo "Testing Rust simple driver..."
	@echo "test data" | sudo tee /dev/simple_bench_rust
	@sudo cat /dev/simple_bench_rust

.PHONY: all clean install uninstall test