#!/bin/bash

feh --bg-scale ~/pics/redtrees.jpg

#unclutter -root -idle 3 &

# disable for now, weirds out urxvt caret and doesn't work properly with opacity
#xcompmgr &

xrdb -merge ~/.Xresources

exec ~/.cabal/bin/xmonad
