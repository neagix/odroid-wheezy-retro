# retro variant #

## All versions ##
  * reinstalling some EGL package will overwrite the EGL drivers. Run **/root/bin/restore-vendor-EGL-libraries.sh** to restore them
  * you need different kernels for non-U2, see [SupportedDevices](SupportedDevices.md)

## Before 0.7.2 ##
  * some randomly generated MAC address can cause network to not come up, remove /etc/smsc95xx\_mac\_addr as a workaround

## 0.0.7 ##

  * an extra reboot might be needed if your ethernet doesn't come up
  * the default resolution of HDMI 1080p is bad for RetroArch, 720p is fine

## 0.0.3 ##

  * right after the first boot you need to change _/etc/udev/rules.d/70-persistent-net.rules_ because there will be 2 rules setup, remove the former and change the latter to "eth0"

## 0.0.2 ##

  * right after the first boot you need to change _/etc/udev/rules.d/70-persistent-net.rules_  because there will be 2 rules setup, remove the former and change the latter to "eth0"
  * rename _/etc/udev/rules.d/10-hkl\_mali.rules.dpkg-new_ to _/etc/udev/rules.d/10-hkl\_mali.rules_ and disable the relative chmod blocks in /etc/rc.local

# base variant #