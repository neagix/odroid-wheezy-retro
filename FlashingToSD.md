# Introduction #

**NOTE:** you should know what you are doing, possible data loss if you dump the SD image to the wrong /dev device!

```
   wget http://oph.mdrjr.net/neagix/get-current-release.cgi -O debian-wheezy-dev-retro-current.img.xz
   unxz debian-wheezy-dev-retro-current.img.xz
   sudo dd if=debian-wheezy-dev-retro-current.img of=/dev/mmcblk0 bs=16M

   ## at this point eject and re-insert SD card!

   sudo resize2fs /dev/mmcblk0p2
```

The last command will resize the main EXT4 partition to the maximum available space.
The boot partition (at /dev/mmcblk0p1) is 128M.

When you are done installing device will be ready for access via SSH or X11. You might want to run the tests in ~/sources/tests before doing any [Customization](Customization.md)

# The importance of being e139 #

If you are customizing the partition to the extent that you re-create it, you might want to save you a few troubles by keeping the same UUID that Hardkernel uses:

```
   tune2fs -U e139ce78-9841-40fe-8823-96a304a09859 /dev/mmcblk0p2
```

# To know more #

Interesting pointers about SD wearout:

http://wiki.laptop.org/go/How_to_Damage_a_FLASH_Storage_Device

Although not 100% quality, you can start reading from there; this is also an interesting post mentioned there: http://www.olpcnews.com/forum/index.php?topic=4993.msg33266

A more authoritative (and technical) source:
