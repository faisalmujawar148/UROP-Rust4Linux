obj-m += simple_driver.o


export LLVM_COMPILER=clang
export CC=wllvm
export HOSTCC=wllvm

# Kernel source tree
KERNEL_DIR ?= /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust

# Default to clang unless WLLVM is explicitly requested
ifdef USE_WLLVM
    export LLVM_COMPILER := clang
    export CC := wllvm
    export HOSTCC := wllvm
    CC_STRING := wllvm
else
    CC_STRING := clang
endif

all:
	@echo "Using kernel directory: $(KERNEL_DIR)"
	@if [ ! -d "$(KERNEL_DIR)" ]; then \
		echo "ERROR: Kernel directory $(KERNEL_DIR) does not exist!"; \
		exit 1; \
	fi
	@echo "Building with $(CC_STRING)"
	make LLVM=1 -C $(KERNEL_DIR) M=$(PWD) modules

clean:
	make LLVM=1 -C $(KERNEL_DIR) M=$(PWD) clean

install:
	sudo insmod simple_driver.ko

uninstall:
	sudo rmmod simple_driver

test:
	@echo "Testing C simple driver..."
	@echo "test data" | sudo tee /dev/simple_bench_c
	@sudo cat /dev/simple_bench_c
	@cat /proc/simple_bench_c_stats

# Extract bitcode if wllvm/extract-bc is available
extract-bc: simple_driver.ko
	@if command -v extract-bc >/dev/null 2>&1; then \
		extract-bc simple_driver.ko && \
		echo "Bitcode extracted to simple_driver.ko.bc"; \
	else \
		echo "extract-bc not found. Install wllvm to enable bitcode extraction."; \
	fi
