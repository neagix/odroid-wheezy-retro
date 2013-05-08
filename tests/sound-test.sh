#!/bin/bash
## @author neagix
## run this as 'emuser'
#

wget -q --continue "https://odroid-wheezy-retro.googlecode.com/files/dial_up_modem_noises.wav" -O dial_up_modem_noises.wav
echo "You should now hear dial-up modem noises for approximately 20 seconds"
aplay dial_up_modem_noises.wav
