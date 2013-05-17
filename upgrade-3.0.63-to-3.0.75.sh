#!/bin/bash
## @author neagix
## customized kernel upgrade script from 3.0.63 to 3.0.75
## also copies wifi drivers
## for MMC version, please run with HAS_MMC=1 environment variable
#

apt-get remove linux-image-3.0.75-odroidu2

set -e

# Using imx flash kernel function as it's the same for origen
IMX_KERNEL_ADDR=0x40008000
BOOT="/boot"
## this kfile is created by the deb package
kfile=/boot/vmlinuz-3.0.75-odroidu2

## this comes from my compilation
ifile=/boot/initrd.img-3.0.74
idesc="Debian Wheezy initrd"

wget --continue "https://odroid-wheezy-retro.googlecode.com/files/initrd.img-3.0.74" -O /boot/initrd.img-3.0.74
wget --continue http://dn.odroid.com/Ubuntu_U2/20130503/update_for_mali/linux-3.0.75-odroidu2_20130503.tar.gz
tar xkvf linux-3.0.75-odroidu2_20130503.tar.gz
cd linux-3.0.75-odroidu2_20130503
dpkg -i *.deb

echo "Copying dpkg-installed vmlinux to $BOOT/zImage"
mv $BOOT/zImage $BOOT/zImage-3.0.63
cp $kfile $BOOT/zImage

##NOTE: you need this if you are using MMC
if [[ "$HAS_MMC" == "1" ]; then
	echo "Generating kernel u-boot image... "
	mv $BOOT/uImage $BOOT/uImage-3.0.63
	mkimage -A arm -O linux -T kernel -C none -a $IMX_KERNEL_ADDR -e $IMX_KERNEL_ADDR -d $kfile $BOOT/uImage
fi

echo "Generating initrd u-boot image... "
mv $BOOT/uInitrd $BOOT/uInitrd-3.0.63
mkimage -A arm -O linux -T ramdisk -C gzip -a 0x0 -e 0x0 -n "$idesc" -d "$ifile" $BOOT/uInitrd

## no dtb to update

echo "Install Ralink's rt5370 USB WiFi Dongle driver"
cat > /etc/modprobe.d/blacklist-ralink.conf << "EOF"
blacklist rt2x00usb
blacklist rt2x00lib
blacklist rt2800usb
blacklist rt2800lib
EOF
if [ ! -f /lib/firmware/rt2870.bin ]; then
	cp rt2870.bin /lib/firmware/
fi

if [ ! -f /etc/Wireless/RT2870STA/RT2870STA.dat ]; then
	mkdir -p /etc/Wireless/RT2870STA
	cp RT2870STA.dat /etc/Wireless/RT2870STA/
fi
cp rt5370sta.ko /lib/modules/3.0.75-odroidu2/kernel/drivers/net/wireless/

echo "Success!"

echo "Please reboot to start using new kernel"
