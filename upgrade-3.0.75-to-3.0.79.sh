#!/bin/bash
## @author neagix
## customized kernel upgrade script from 3.0.75 to 3.0.79
#

set -e

ARCHIVE=$PWD/kernel-modules-3.0.79.tar.xz
wget "https://odroid-wheezy-retro.googlecode.com/files/kernel-modules-3.0.79.tar.xz" -O $ARCHIVE

cd /
tar xfv $ARCHIVE

wget "https://odroid-wheezy-retro.googlecode.com/files/zImage-3.0.79" -O /boot/zImage
wget "https://odroid-wheezy-retro.googlecode.com/files/uInitrd-3.0.79" -O /boot/uInitrd

echo "Success!"

echo "Please reboot to start using new kernel"
