if pgrep -x "blueman-manager" > /dev/null; then
    pkill blueman-manager
else
    blueman-manager &
fi
