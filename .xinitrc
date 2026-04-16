picom -b &
xset r rate 200 35 &
xrandr -s 1920x1080 &
setxkbmap -layout us,bg -variant ,phonetic -option grp:alt_shift_toggle,ctrl:nocaps &
autotiling &
/usr/lib/xfce-polkit/xfce-polkit &
exec i3
