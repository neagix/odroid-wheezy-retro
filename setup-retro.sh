#!/bin/bash
## @author: neagix
## update scripts, pull all necessary sources and build them
#

## stop on any error
set -e

git fetch
if [ $(git log HEAD..origin/master | grep sh) ]; then
	echo "Some scripts updated, please run again"
	git pull -v &
	exit
fi

function build_retroarch() {
	DEFOPTS="--enable-alsa --disable-oss --disable-jack --disable-pulse --enable-xvideo"

	cd retroarch
	./configure $DEFOPTS --enable-x11 --enable-opengl --enable-gles --disable-kms --disable-vg && \
	make -j5
	strip retroarch tools/retroarch-joyconfig
	cp retroarch tools/retroarch-joyconfig ~/bin
}

function build_snes9x() {
	cd libretro-snes9x
	CFLAGS="$CFLAGS -mfpu=neon -mfloat-abi=hard" CXXFLAGS="$CXXFLAGS -mfpu=neon -mfloat-abi=hard" ASFLAGS="$ASFLAGS -mfpu=neon -mfloat-abi=hard" \
	make -j5 -f Makefile.libretro
	strip snes9x_next_libretro.so
	cp snes9x_next_libretro.so ~/.retroarch/cores/snes9x.so
}

if [ ! -d retroarch ]; then
	git clone https://github.com/neagix/RetroArch.git retroarch --depth=0
fi
build_retroarch

if [ ! -d libretro-snes9x ]; then
	git clone https://github.com/libretro/snes9x-next.git libretro-snes9x --depth=0
fi
build_snes9x

## see also https://github.com/libretro/libretro-super
