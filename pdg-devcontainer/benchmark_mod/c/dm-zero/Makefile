obj-m += zero.o

EXTRA_CFLAGS += -Wno-error \
                -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang

# Filter away the ftrivial-auto-var-init flag entirely
KBUILD_CFLAGS := $(filter-out \
    -ftrivial-auto-var-init=zero-knowing-it-will-be-removed-from-clang \
    ,$(KBUILD_CFLAGS))

KBUILD_CFLAGS := $(filter-out \
    -mstack-protector-guard-reg=gs \
    -mstack-protector-guard-symbol=__ref_stack_chk_guard \
    -mfunction-return=thunk-extern \
    -ftrivial-auto-var-init=zero-knowing-it-will-be-removed-from-clang \
    ,$(KBUILD_CFLAGS))

# Fix the kernel directory path
KERNEL_DIR ?= /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust
PWD := $(shell pwd)

# Default target - try GCC first to avoid wllvm issues
all:
	@echo "Using kernel directory: $(KERNEL_DIR)"
	@if [ ! -d "$(KERNEL_DIR)" ]; then \
		echo "Error: Kernel directory $(KERNEL_DIR) does not exist"; \
		exit 1; \
	fi
	@echo "Building with GCC"
	make -C $(KERNEL_DIR) M=$(PWD) modules CC=gcc
	@if [ $$? -ne 0 ]; then \
		echo "GCC build failed, trying with clang..."; \
		make LLVM=1 -C $(KERNEL_DIR) M=$(PWD) modules; \
	fi

# Force clang build
clang:
	@echo "Using kernel directory: $(KERNEL_DIR)"
	@if [ ! -d "$(KERNEL_DIR)" ]; then \
		echo "Error: Kernel directory $(KERNEL_DIR) does not exist"; \
		exit 1; \
	fi
	@echo "Building with clang"
	make LLVM=1 -C $(KERNEL_DIR) M=$(PWD) modules

# Force GCC build
gcc:
	@echo "Using kernel directory: $(KERNEL_DIR)"
	@if [ ! -d "$(KERNEL_DIR)" ]; then \
		echo "Error: Kernel directory $(KERNEL_DIR) does not exist"; \
		exit 1; \
	fi
	@echo "Building with GCC"
	make -C $(KERNEL_DIR) M=$(PWD) modules CC=gcc

clean:
	@if [ -d "$(KERNEL_DIR)" ]; then \
		make -C $(KERNEL_DIR) M=$(PWD) clean; \
	else \
		echo "Warning: Kernel directory $(KERNEL_DIR) does not exist, cleaning local files only"; \
		rm -f *.o *.ko *.mod.c *.mod.o *.order *.symvers; \
	fi

install: all
	sudo insmod zero.ko

uninstall:
	sudo rmmod zero

# Test the dm-zero device (requires device-mapper tools)
test: install
	@echo "Testing the dm-zero device..."
	@echo "Note: This requires device-mapper tools (dmsetup) to be installed"
	@echo "Example usage:"
	@echo "  sudo dmsetup create zero_test --table '0 1024 zero'"
	@echo "  sudo dd if=/dev/mapper/zero_test bs=512 count=4 | hexdump -C"
	@echo "  sudo dmsetup remove zero_test"

.PHONY: all clang gcc clean install uninstall test