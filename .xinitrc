#!/bin/bash

# Wallpaper
feh --bg-fill --randomize ../wallpapers/* &

# Xset (disables screen sleep)
xset s off &
xset dpms 0 0 0 &

# Xresources
xrdb -merge ~/.Xresources

#policy kit authenticator
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

# Scripts
~/dotfiles/scripts/display.sh &
~/dotfiles/scripts/wallpaper.sh &

# Compositor
picom &

# Screenshot Daemon
flameshot &

# Steam
env MANGOHUD=1 steam -silent &

# Start dwm
exec dwm
