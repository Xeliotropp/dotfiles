#!/bin/bash

systemctl --user import-environment WAYLAND_DISPLAY &
systemctl --user restart xdg-desktop-portal-wlr &
systemctl --user restart xdg-desktop-portal &
/usr/libexec/xfce-polkit &
flameshot &
dunst &
wl-paste --type text --watch cliphist store &
wl-copy &
swaybg -i ~/wallpapers/greenmountain.jpg
