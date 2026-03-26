#!/bin/bash
#hyprpanel -q
#hyprpanel
#sleep .5
killall linux-wallpaperengine
sleep .5
linux-wallpaperengine --no-fullscreen-pause --no-audio-processing -f 60 -s --scaling stretch --screen-root DP-2 --bg 2312414926 &
sleep .5
linux-wallpaperengine --no-fullscreen-pause --no-audio-processing -f 60 -s --scaling stretch --screen-root HDMI-A-1 --bg 2312414926 &
#hhttps://steamcommunity.com/sharedfiles/filedetails/?id=3674238605