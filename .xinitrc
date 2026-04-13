picom -b &
xset r rate 200 35 &
xrandr -s 1920x1080 &
setxkbmap -layout us,bg -variant ,phonetic -option grp:ctrl_space_toggle,ctrl:nocaps &
autotiling &
exec i3
