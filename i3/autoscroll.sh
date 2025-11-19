#!/bin/bash

if pgrep -x "autoscroll" > /dev/null; then
  pkill autoscroll
else
  xinput set-button-map "pointer:Logitech MX Master 3S" 1 2 3 4 5 6 7 8 9
fi
