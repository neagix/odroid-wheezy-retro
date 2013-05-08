#!/bin/bash
## @author neagix
## run this as 'emuser'
#

echo "You should now see a demo running through snes9x emulation"
echo "- - - - - -"
DISPLAY=:0 retroarch "$HOME/roms/SNES9X Demo V1.16 (PD).smc"
