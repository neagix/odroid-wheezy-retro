#!/bin/bash
## build script for XBMC on Debian
## @author neagix
#

UNSTABLE_PACKAGES="http://ftp.debian.org/debian/pool/main/t/taglib/libtag1-dev_1.8-2_armhf.deb http://ftp.debian.org/debian/pool/main/libr/librcd/librcd0_0.1.13-3_armhf.deb http://ftp.debian.org/debian/pool/main/a/aspell/libaspell15_0.60.7~20110707-1_armhf.deb http://ftp.debian.org/debian/pool/main/libr/librcc/librcc0_0.2.9-3.1_armhf.deb http://ftp.debian.org/debian/pool/main/t/taglib/libtag1-rusxmms_1.8-2_armhf.deb http://ftp.debian.org/debian/pool/main/t/taglib/libtag1-vanilla_1.8-2_armhf.deb http://ftp.debian.org/debian/pool/main/t/taglib/libtag1c2a_1.8-2_armhf.deb"

TMPDIR=$(mktemp xbmcpkg.XXXXX)

## retrieve unstable packages
for URL in $UNSTABLE_PACKAGES; do
	wget $URL -P $TMPDIR/ || exit $?
done

## install all downloaded packages
sudo dpkg -i $TMPDIR/*.deb || exit $?
rm -rf $TMPDIR

set -e

## regular Debian Wheezy packages
sudo aptitude install \
	python-dev libmpeg2-4-dev libsamplerate0-dev libmodplug-dev libcurl4-openssl-dev liblzo2-dev libyajl-dev libtinyxml-dev libsqlite3-dev libcdio-dev \
	libtaglib-cil-dev libjasper-dev libsdl-image1.2-dev libmicrohttpd-dev libssh-dev libsmbclient-dev libnfs-dev libusb-dev libudev-dev swig default-jre \
	gawk gperf libunzip-dev unzip zip libiso9660-dev

## configure process
./configure --prefix=/usr --build=armv7a-hardfloat-linux-gnueabi --host=armv7a-hardfloat-linux-gnueabi --mandir=/usr/share/man --infodir=/usr/share/info \
--datadir=/usr/share --sysconfdir=/etc --localstatedir=/var/lib --disable-dependency-tracking --docdir=/usr/share/doc/xbmc-9999 \
--disable-ccache --enable-optimizations --disable-airplay --disable-avahi --disable-libbluray --disable-libcap \
--disable-libcec --enable-dvdcss --disable-debug --enable-gles --enable-goom --disable-hal --enable-joystick \
--enable-neon --enable-nfs --disable-gl --disable-profiling --enable-projectm --enable-rsxs --disable-rtmp --enable-samba --enable-sdl \
--enable-ssh --enable-libusb --disable-upnp --disable-vaapi --disable-vdpau --enable-webserver --enable-x11 --enable-xrandr \
-with-platform=samsung-exynos --enable-exynos4 --enable-non-free --enable-mid --disable-mysql --disable-pulse

CFLAGS="-march=native -mfloat-abi=hard -mfpu=neon -ftree-vectorize -mvectorize-with-neon-quad -ffast-math -mcpu=cortex-a9 -mtune=cortex-a9 -mthumb -O2 -pipe -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2" \
	make -j5
