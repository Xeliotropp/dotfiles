#!/bin/bash

systemctl --user import-environment WAYLAND_DISPLAY &
systemctl --user restart xdg-desktop-portal-wlr &
systemctl --user restart xdg-desktop-portal &
/usr/lib/xfce-polkit/xfce-polkit &
flameshot &
dunst &
wl-paste --type text --watch cliphist store &
swaybg -i ~/wallpapers/greenmountain.jpg
