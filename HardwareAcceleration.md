# Introduction #

List of some widely known hardware acceleration modes:
  * EXA, supported by the xf86-video-mali driver, although you don't need this
  * GLX, not supported - although it's already fast without any acceleration (120/130 FPS with glxgears)
  * EGL, GLESv1, GLESv2, this is supported and hardware-accelerated
  * G2D, this is the 2D hardware acceleration availble on Exynos chipsets, [read more here](http://www.phoronix.com/scan.php?page=news_item&px=MTA3MDE)

G2D is not currently working but the [xf86-video-sunxifb driver](https://github.com/ssvb/xf86-video-sunxifb) might in future add support for it.

Thanks to **mdrjr** and the other IRC guys for the completion of this information cheatsheet.

See also http://odroid.com/projects/opengles-linux/

# Details #

The trick to get properly working hardware acceleration is to install the Debian-provided GLES/EGL libraries and then overwrite them with the vendor-provided binaries. Also xorg.conf plays a notable role.

You can always run **/root/bin/restore-vendor-EGL-libraries.sh** to restore the correct drivers.

# HDMI output #

The current HDMI output is forced 24bit