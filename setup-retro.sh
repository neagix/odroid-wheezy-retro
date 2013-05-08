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
}

if [ ! -d retroarch ]; then
	git clone https://github.com/neagix/RetroArch.git retroarch --depth=0
fi
build_retroarch
