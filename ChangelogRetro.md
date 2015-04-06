# odroid-wheezy-retro image #
## 0.9.0 (not yet released) ##
  * odroid-linux-3.8.y version 3.8.13.23 (commit eeb6b107abb32f3305fbdc658fca8e22e25a7b3b)
  * dropped support of Hardkernel kernel upgrade script (different .config)
  * most recent Debian Wheezy packages
  * most recent RetroArch (lima driver) + cores
  * libdrm with Exynos support
  * [limare](https://github.com/tobiasjakobi/lima-drm/tree/master/limare)
  * support of framebuffer console (VTs!)
  * disabled automatic boot to X
  * removed some development packages
  * added Maze and Pong public domain roms
  * removed RetroArch Phoenix

## 0.8.2 ##
  * now using hardkernel official 3.8.13.10 linux kernel
  * fixed support of Hardkernel upgrade script
  * added MFC firmware (s5p-mfc.fw)
  * supports XBMC (not included)
  * most recent Debian 7.1 packages
  * most recent RetroArch + cores
  * fixed bug with network at 1st boot
  * removed X11 -dev packages

## 0.8.1 ##
  * compiled RetroArch with NEON-optimized sound resampler (thanks to Squarepusher)
  * enabled page flipping for smoother RetroArch experience
  * added vim and missing packages for eduke32 and RetroArch-Phoenix
  * removed modelviewer core, added all cores
  * added libretro-super
  * enabled all joystick drivers in kernel

## 0.8.0 ##

  * added following cores: BSNES(C++ 98), DOSbox,  gambatte, genesis plus GX, hatari, nestopia, PCSX-ReARMed, PrBoom, SNES9x-next, TyrQuake, VBA-next and the modelviewer
  * switched to official RetroArch git tree (removed for now the poweroff patch, the button release patch and the input debugging patch)
  * added RetroArch-Phoenix for easier configuration
  * added eduke32, poweroff and retroarch-phoenix icons
  * better desktop icons settings
  * added /etc/asound.conf to solve ALSA sound issues on HDMI output
  * added a custom udev script so that plugged gamepads are automatically readable by default user (no more chmod/chown needed)
  * upgraded Debian packages

## 0.7.4 ##
  * fixed MAC address generation (thanks to **mdrjr** for tip)
  * supported by Hardkernel upgrade scripts

## 0.7.3 ##
  * added [eduke32](http://neagix.blogspot.com/2013/06/duke-nukem-3d-on-odroid.html) binary

## 0.7.2 ##
  * disabled /etc/smsc95xx\_mac\_addr creation (causes network down issue with some values)
  * now using EXT4 without journal instead of EXT2

## 0.7.1 ##
  * kernel 3.0.80, removed some modules (netfilter etc)
  * added [idesk](https://github.com/neagix/idesk) as desktop manager
  * added all quicklaunch icons (lxterm, glxgears, es2gears, glmark2-es2, retroarch)
  * other minor improvements/fixes
  * version bump (to 0.7)

## 0.0.7 ##
  * kernel 3.0.79 (with disabled fan PWM kern.log verbosity)
  * added [xf86-video-sunxifb](https://github.com/ssvb/xf86-video-sunxifb)
  * added glmark2-es2 binary
  * updated RetroArch binary
  * enabled HDMI 1080p output
  * using EXT2 instead of EXT4 (see https://wiki.linaro.org/WorkingGroups/Kernel/Projects/FlashCardSurvey)
  * fixed a few issues related to bootstrapping

## 0.0.6 ##
  * reboot after 1st time boot (bootstrap)
  * kernel 3.0.75 and wifi drivers
  * removed apt cache

## 0.0.5 ##
  * fixed issue with network udev rules (for real)

## 0.0.4 ##
  * added Frognes public domain ROM
  * improvements to shipped scripts and default configuration

## 0.0.3 ##
  * fixed issue with network udev rules (uneffective)
  * use package udev rule to assign /dev/ump and /dev/mali permissions

## 0.0.2 ##
  * initial release