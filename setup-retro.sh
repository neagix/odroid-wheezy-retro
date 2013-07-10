#!/bin/bash
## @author neagix
## build RetroArch and its cores with ARM optimizations
#

## stop on any error
set -e

export CFLAGS='-marm -mcpu=cortex-a9 -mtune=cortex-a9 -mfpu=neon -mfloat-abi=hard'
export CXXFLAGS='-marm -mcpu=cortex-a9 -mtune=cortex-a9 -mfpu=neon -mfloat-abi=hard'
export ASFLAGS='-marm -mcpu=cortex-a9 -mtune=cortex-a9 -mfpu=neon -mfloat-abi=hard'

function build_retroarch() {
	CONFIGOPTS="--enable-alsa --disable-oss --disable-jack --disable-pulse --enable-xvideo --enable-fbo --enable-x11 "
	CONFIGOPTS="$CONFIGOPTS --enable-opengl --enable-gles --disable-kms --disable-vg --enable-dylib --disable-ffmpeg"

	cd retroarch
	./configure $CONFIGOPTS && \
	make -j5
	strip retroarch tools/retroarch-joyconfig
	cp retroarch tools/retroarch-joyconfig ~/bin
}

function build_snes9x() {
	cd libretro-snes9x
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
