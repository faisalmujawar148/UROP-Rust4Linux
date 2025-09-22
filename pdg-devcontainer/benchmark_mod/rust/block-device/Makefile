obj-m += blkram.o
blkram-rust := blkram.rs
KERNEL_DIR ?= ../../../linux-rust

# Remove unnecessary flags
ccflags-remove-y += -fconserve-stack
asflags-remove-y += -fconserve-stack

# Add bitcode emission to Rust flags
KBUILD_RUSTFLAGS += --emit=llvm-bc

all:
	make -C $(KERNEL_DIR) M=$(PWD) modules LLVM=19

clean:
	make -C $(KERNEL_DIR) M=$(PWD) clean
	rm -f *.bc *.ll *.mod.c

extract-pdg:
	llvm-link-19 blkram.bc .blkram.mod.o.bc $(KERNEL_DIR)/rust/kernel.bc $(KERNEL_DIR)/rust/alloc.bc $(KERNEL_DIR)/rust/core.bc -o blkram_full.bc
	opt-19 -load /path/to/Program-Dependence-Graph-in-LLVM/build/libpdg.so -dot-pdg < blkram_full.bc > blkram_pdg.dot
	dot -Tpng blkram_pdg.dot -o blkram_pdg.png

.PHONY: all clean extract-pdg