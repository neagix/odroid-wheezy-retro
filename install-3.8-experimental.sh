#!/bin/bash
## script to test kernel 3.8 on neagix' Debian image
## @author neagix
#

if [ $UID != 0 ]; then
	echo "Please run with root privileges"
	exit 1
fi

set -e

BASEURL=http://oph.mdrjr.net/neagix/odroid-linux-3.8

wget -q $BASEURL/modules-3.8.tar.bz -O - | tar xfjv - -C/
wget -q $BASEURL/uInitrd-3.8.13.6 -O /boot/uInitrd
wget -q $BASEURL/zImage-3.8.13.6 -O /boot/zImage
