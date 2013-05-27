#!/bin/bash
## @author neagix
## customized kernel upgrade script from any 3.0 to 3.8.13
#

set -e

echo "NOTICE: this is experimental!"

ARCHIVE=$PWD/kernel-modules-3.8.13.tar.xz
wget "https://odroid-wheezy-retro.googlecode.com/files/kernel-modules-3.8.13.tar.xz" -O $ARCHIVE

cd /
tar xfv $ARCHIVE

mv -vi /boot/uInitrd /boot/uInitrd-`uname -r`
mv -vi /boot/zImage /boot/zImage-`uname -r`

wget "https://odroid-wheezy-retro.googlecode.com/files/zImage-3.8.13" -O /boot/zImage

## still using old uInitrd
wget "https://odroid-wheezy-retro.googlecode.com/files/uInitrd-3.0.79" -O /boot/uInitrd

echo "Success!"

echo "Please reboot to start using new kernel"
