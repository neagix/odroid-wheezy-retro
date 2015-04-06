# Introduction #

odroid-wheezy-retro is a packaged SD image containing a minimal Debian Wheezy for ODROID devices (http://hardkernel.com/), very lightweight and thus tailored for development.

It comes in 3 _flavours_:

  1. **minimal**, a _bare metal_ Debian Wheezy with nothing more than the strictly necessary minimum to boot into X11 with [hardware acceleration](HardwareAcceleration.md) support. Perfect for server purposes; does not come pre-installed with development packages and tools
  1. **devel**, same as minimal but preinstalled with development packages and tools
  1. **retro**, this is the default, it's a devel distro containing also some binaries (RetroArch, es2gears, glmark2-es2)

All releases contain this project's cloned GIT repository and constitute a great starting point for your development/learning/retrodreams.

See also [SupportedDevices](SupportedDevices.md).

To get the current **retro** release:

```
wget http://oph.mdrjr.net/neagix/get-current-release.cgi
```

Then continue by reading [FlashingToSD](FlashingToSD.md).

**Please note that this distro is not officially supported by Hardkernel**

The SD images contain Hardkernel's Mali400 proprietary drivers so that you have fully working EGL, GLESv1, GLESv2 HardwareAcceleration (on X11). Demos to test such acceleration are included.

It is a good starting point for any development/hobby/emulation needs you might have.

Please also read [Goals](Goals.md) to know more about the underlying philosophy.

# Features #

  * very small (<200M packed), based on [odroid.us base rootfs](http://odroid.us/mediawiki/index.php?title=Debian_Wheezy_Instructions) image
  * using stable 3.0 kernel with wifi support
  * 24bit HDMI output
  * X11 hardware accelerated EGL, GLESv1 and GLESv2 (through Hardkernel's proprietary drivers)
  * boots automatically into Xorg with fluxbox
  * it will not automatically turn off HDMI output when idle (so be careful with your LCDs!), nor run any screensaver
  * basic development packages already installed (gcc, g++, make, autoconf, automake etc)
  * scripts to fetch and build my fork of retroarch (+ related libretro cores)
  * retroarch (with snes9x-next core) and retroarch-joyconfig ready-to-run binaries included
  * testing scripts for sound and 3D

The first time you boot the image it will automatically re-generate SSH keys and assign a random MAC address (see /root/bin/bootstrap.sh for reference), so it might take a few seconds longer. A reboot is issued after that.

Original release blog post: http://neagix.blogspot.com/2013/05/neagix-excellent-and-unofficial-debian.html

# How to use #

Flash the downloaded SD image and then enlarge the second partition (EXT4) to cover all your available space, see [FlashingToSD](FlashingToSD.md).

When logged in as _emuser_ you can fetch retroarch and related cores by entering the sources directory and running **setup-retro.sh**. You are invited to check what the script does to better understand, see also [RetroArch](RetroArch.md)

You are also invited to customize it, see [Customization](Customization.md).

If you have an issue with a specific piece of software please submit issues (or ask for support) on their relative project facilities. The issue tracker on this project shall be used for issues/improvements of the specific SD images.

# Default credentials #

If you plug your ODROID through ethernet it will get a DHCP address, then you can connect via SSH.

  * root / root
  * emuser / emuser

If you plan to use the device in any place with public access, it's advised to change the passwords. See also [Customization](Customization.md).

See [these instructions](http://www.debian-administration.org/articles/152) to enable password-less login.