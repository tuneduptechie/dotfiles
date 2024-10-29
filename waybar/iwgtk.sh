if pgrep -x "iwgtk" > /dev/null; then
    pkill iwgtk
else
    iwgtk &
fi
