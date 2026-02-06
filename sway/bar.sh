#!/bin/bash
date_formatted=$(date "+%H:%M:%S")
battery_status=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | tr -d ' ')
echo "battery $battery_status | $date_formatted |"
