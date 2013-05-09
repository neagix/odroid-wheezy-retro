#!/bin/bash
## @author neagix
## customized kernel upgrade script from 3.0.63 to 3.0.75
#

apt-get remove linux-image-3.0.75-odroidu2

set -e

## set to 1 to generate the uImage
HAS_MMC=0

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
if [ $HAS_MMC -eq 1 ]; then
	echo "Generating kernel u-boot image... "
	mv $BOOT/uImage $BOOT/uImage-3.0.63
	mkimage -A arm -O linux -T kernel -C none -a $IMX_KERNEL_ADDR -e $IMX_KERNEL_ADDR -d $kfile $BOOT/uImage
fi

echo "Generating initrd u-boot image... "
mv $BOOT/uInitrd $BOOT/uInitrd-3.0.63
mkimage -A arm -O linux -T ramdisk -C gzip -a 0x0 -e 0x0 -n "$idesc" -d "$ifile" $BOOT/uInitrd

## no dtb to update

echo "Success!"
