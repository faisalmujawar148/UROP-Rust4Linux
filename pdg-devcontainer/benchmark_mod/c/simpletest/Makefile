obj-m += simple_driver.o

# Kernel source tree
KERNEL_DIR ?= /workspaces/UROP-Rust4Linux/pdg-devcontainer/linux-rust

# Check if wllvm is available and executable
WLLVM_AVAILABLE := $(shell command -v wllvm 2> /dev/null && test -x "$$(command -v wllvm)" && echo "yes" || echo "no")

# Default to GCC to avoid wllvm issues, unless explicitly requested
ifdef USE_WLLVM
    ifeq ($(WLLVM_AVAILABLE),yes)
        export LLVM_COMPILER := clang
        export CC := wllvm
        export HOSTCC := wllvm
        CC_STRING := wllvm
        BUILD_CMD := make LLVM=1 -C $(KERNEL_DIR) M=$(PWD) modules
    else
        $(error wllvm requested but not available or not executable)
    endif
else ifdef USE_CLANG
    CC_STRING := clang
    BUILD_CMD := make LLVM=1 -C $(KERNEL_DIR) M=$(PWD) modules
else
    # Default to GCC (matches how the kernel was built)
    CC_STRING := gcc
    BUILD_CMD := make -C $(KERNEL_DIR) M=$(PWD) modules CC=gcc
endif

all:
	@echo "Using kernel directory: $(KERNEL_DIR)"
	@if [ ! -d "$(KERNEL_DIR)" ]; then \
		echo "ERROR: Kernel directory $(KERNEL_DIR) does not exist!"; \
		exit 1; \
	fi
	@echo "Building with $(CC_STRING)"
	@echo "wllvm available: $(WLLVM_AVAILABLE)"
	$(BUILD_CMD)

# Explicitly use GCC
gcc:
	@echo "Using kernel directory: $(KERNEL_DIR)"
	@echo "Building with GCC (forced)"
	make -C $(KERNEL_DIR) M=$(PWD) modules CC=gcc

# Explicitly use clang
clang:
	@echo "Using kernel directory: $(KERNEL_DIR)"
	@echo "Building with clang (forced)"
	make LLVM=1 -C $(KERNEL_DIR) M=$(PWD) modules

# Use wllvm (only if available)
wllvm:
	@if [ "$(WLLVM_AVAILABLE)" = "yes" ]; then \
		echo "Building with wllvm"; \
		export LLVM_COMPILER=clang && export CC=wllvm && export HOSTCC=wllvm && \
		make LLVM=1 -C $(KERNEL_DIR) M=$(PWD) modules; \
	else \
		echo "ERROR: wllvm is not available or not executable"; \
		echo "To install wllvm: pip install wllvm"; \
		echo "Make sure it's in your PATH and executable"; \
		exit 1; \
	fi

clean:
	@if [ -d "$(KERNEL_DIR)" ]; then \
		make -C $(KERNEL_DIR) M=$(PWD) clean; \
	else \
		echo "Kernel directory not found, cleaning local files only"; \
		rm -f *.o *.ko *.mod.c *.mod.o *.order *.symvers *.bc; \
	fi

install: all
	sudo insmod simple_driver.ko

uninstall:
	sudo rmmod simple_driver

test: install
	@echo "Testing C simple driver..."
	@echo "Module loaded. Check dmesg for benchmark results:"
	@dmesg | tail -10

# Extract bitcode if wllvm/extract-bc is available
extract-bc: 
	@if [ ! -f "simple_driver.ko" ]; then \
		echo "Building with wllvm first..."; \
		$(MAKE) wllvm; \
	fi
	@if command -v extract-bc >/dev/null 2>&1; then \
		extract-bc simple_driver.ko && \
		echo "Bitcode extracted to simple_driver.ko.bc"; \
	else \
		echo "extract-bc not found. Install wllvm to enable bitcode extraction:"; \
		echo "  pip install wllvm"; \
	fi

# Install wllvm
install-wllvm:
	@echo "Installing wllvm..."
	pip install wllvm
	@echo "wllvm installed. You can now use 'make wllvm' or 'make USE_WLLVM=1'"

.PHONY: all gcc clang wllvm clean install uninstall test extract-bc install-wllvm