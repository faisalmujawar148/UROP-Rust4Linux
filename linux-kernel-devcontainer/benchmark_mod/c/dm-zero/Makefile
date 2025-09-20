obj-m           += zero.o
EXTRA_CFLAGS    += -Wno-error \
                   -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang

# Filter away the ftrivial-auto-var-init flag entirely
KBUILD_CFLAGS   := $(filter-out \
    -ftrivial-auto-var-init=zero-knowing-it-will-be-removed-from-clang \
    ,$(KBUILD_CFLAGS))

KBUILD_CFLAGS   := $(filter-out \
    -mstack-protector-guard-reg=gs \
    -mstack-protector-guard-symbol=__ref_stack_chk_guard \
    -mfunction-return=thunk-extern \
    -ftrivial-auto-var-init=zero-knowing-it-will-be-removed-from-clang \
    ,$(KBUILD_CFLAGS))


KERNEL_DIR ?= /workspaces/linux-kernel-devcontainer/linux-rust
PWD        := $(shell pwd)

all:
	make LLVM=1 -C $(KERNEL_DIR) M=$(PWD) modules

clean:
	make LLVM=1 -C $(KERNEL_DIR) M=$(PWD) clean
