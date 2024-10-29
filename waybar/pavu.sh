if pgrep -x "pavucontrol" > /dev/null; then
    pkill pavucontrol
else
    pavucontrol &
fi
