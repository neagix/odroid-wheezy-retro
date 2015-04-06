# Introduction #

**odroid-wheezy-dev-retro** contains a git repository forked from [RetroArch](http://themaister.net/retroarch.html).

To build [RetroArch](http://themaister.net/retroarch.html) and snes9x-next core:

```
cd sources
./setup-retro.sh
```

# Details #

[RetroArch](http://themaister.net/retroarch.html) is fastly evolving thus I only merge the fork from upstream when it's known to not break.

Read more at http://www.libretro.org/ and http://themaister.net/retroarch.html

# Additional features #

There are only a few additional features from original RetroArch, most notably:
  * possibility to halt the system from RetroArch menu
  * input keypresses are not passed over from RGUI menu to emulated core
  * possibility to debug core input events

See also [post with summary](http://neagix.blogspot.com/2013/05/some-patches-for-retroarch.html).