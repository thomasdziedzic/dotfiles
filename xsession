#!/bin/bash

feh --bg-scale ~/pics/redtrees.jpg

#unclutter -root -idle 3 &

# disable for now, weirds out urxvt caret and doesn't work properly with opacity
#xcompmgr &

xrdb -merge ~/.Xresources

xmodmap ~/.xmodmaprc

# notifications!
/usr/lib/notification-daemon-1.0/notification-daemon &

# needed for nm-applet
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# ck-launch-session dbus-launch needed nm-applet permissions
exec ck-launch-session dbus-launch ~/.cabal/bin/xmonad
