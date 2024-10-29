if pgrep -x "nm-applet" > /dev/null && pgrep -x "protonvpn-app" > /dev/null; then
    pkill nm-applet
    pkill protonvpn-app
else
    nm-applet &
    protonvpn-app &
fi
