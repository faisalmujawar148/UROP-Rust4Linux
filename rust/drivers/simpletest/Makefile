KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)


all:
	$(MAKE) -C $(KDIR) M=$(PWD) LLVM=1 modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

