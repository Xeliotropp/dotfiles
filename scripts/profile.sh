#!/bin/bash
if [ "$(cat /sys/class/power_supply/AC0/online 2>/dev/null)" = "1" ]; then
    profile="Balanced"
else
    profile="Quiet"
fi

asusctl profile -P "$profile"
notify-send "$(asusctl profile -p)"
