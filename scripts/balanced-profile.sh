#!bin/bash

asusctl profile -P "Balanced"
notify-send "$(asusctl profile -p)"
