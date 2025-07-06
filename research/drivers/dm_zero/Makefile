obj-m += zero.o
EXTRA_CFLAGS += -Wno-error

KVER := 5.15.0-141-generic

all:
	make -C /lib/modules/$(KVER)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(KVER)/build M=$(PWD) clean

