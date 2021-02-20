KVERSION := `uname -r`
KDIR := /lib/modules/${KVERSION}/build
OPTIONS := lg4ff_dfgt_altmap

default:
	$(MAKE) -C $(KDIR) M=$$PWD

install:
	$(MAKE) -C $(KDIR) M=$$PWD modules_install
	depmod -A

load:
	rmmod hid-logitech 2> /dev/null || true
	rmmod hid-logitech-new 2> /dev/null || true
	modprobe hid-logitech-new ${OPTIONS}

load_debug:
	rmmod hid-logitech 2> /dev/null || true
	rmmod hid-logitech-new 2> /dev/null || true
	modprobe hid-logitech-new dyndbg=+p ${OPTIONS}

unload:
	rmmod hid-logitech-new
	modprobe hid-logitech

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

