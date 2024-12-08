if pgrep -x "rofi" > /dev/null; then
    pkill rofi
else
    rofi -show power-menu -modi "power-menu:rofi-power-menu --choices=lockscreen/suspend/logout/reboot/shutdown" &
fi