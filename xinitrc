#!/bin/bash

feh --bg-scale ~/pics/redtrees.jpg

#unclutter -root -idle 3 -noevents &

# disable for now, weirds out urxvt caret and doesn't work properly with opacity
#xcompmgr &

xrdb -merge ~/.Xresources

xmodmap ~/.xmodmaprc

exec xmonad
