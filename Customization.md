# How to change user name #

```
usermod -m -d /home/neagix -l neagix emuser
groupmod -n neagix emuser
```

Then edit /etc/rc.local and change there emuser to your selected user (neagix in this example, that is mine! :) )

Change the password by running passwd.

If there is external access to the device, then please consider using proper passwords

# Customize hostname #

Change:
  * /etc/hostname
  * /etc/hosts

# Other references #

Change home directory references in .fluxbox/startup

# Start RetroArch automatically #

Modify ~/.fluxbox/startup accordingly!

# Remove all unwanted packages #

You can remove all installed packages by restoring the original dpkg selections.
Run the following as **root**:

```
apt-get install dselect
dpkg --clear-selections
dpkg --set-selections < /root/original-dpkg-selections.txt
apt-get update
apt-get -u dselect-upgrade
```

Please note that fluxbox will be broken after doing this.

# Desktop icons #

The icons you see are managed by [idesk](https://github.com/neagix/idesk). You can add/change/remove icons by looking into the ~/.idesktop directory