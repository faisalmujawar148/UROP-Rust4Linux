obj-m += hello.o

# Compiler flags to suppress warnings and avoid problematic flags
EXTRA_CFLAGS += -Wno-error

# Filter out problematic compiler flags that might cause issues with clang
KBUILD_CFLAGS := $(filter-out \
    -ftrivial-auto-var-init=zero-knowing-it-will-be-removed-from-clang \
    -mstack-protector-guard-reg=gs \
    -mstack-protector-guard-symbol=__ref_stack_chk_guard \
    -mfunction-return=thunk-extern \
    ,$(KBUILD_CFLAGS))

# Set kernel directory
KERNEL_DIR ?= /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust
PWD := $(shell pwd)

# Default target - try GCC first, then clang if needed
all:
	@echo "Using kernel directory: $(KERNEL_DIR)"
	@echo "Building with GCC"
	make -C $(KERNEL_DIR) M=$(PWD) modules CC=gcc
	@if [ $$? -ne 0 ]; then \
		echo "GCC build failed, trying with clang..."; \
		make LLVM=1 -C $(KERNEL_DIR) M=$(PWD) modules; \
	fi

# Force clang build
clang:
	@echo "Using kernel directory: $(KERNEL_DIR)"
	@echo "Building with clang"
	make LLVM=1 -C $(KERNEL_DIR) M=$(PWD) modules

# Force GCC build
gcc:
	@echo "Using kernel directory: $(KERNEL_DIR)"
	@echo "Building with GCC"
	make -C $(KERNEL_DIR) M=$(PWD) modules CC=gcc

clean:
	make -C $(KERNEL_DIR) M=$(PWD) clean

install: all
	sudo insmod hello.ko

uninstall:
	sudo rmmod hello

test: install
	@echo "Testing the hello device..."
	@if [ -c /dev/hello ]; then \
		echo "Device /dev/hello exists"; \
		cat /dev/hello; \
	else \
		echo "Device /dev/hello not found"; \
	fi

.PHONY: all clang gcc clean install uninstall test