picom -b &
xset r rate 200 35 &
xrandr -s 1920x1080 &
setxkbmap -layout us,bg -variant ,phonetic -option grp:ctrl_space_toggle,ctrl:nocaps &
~/.config/suckless/dwm/autostart.sh &
/usr/bin/pulseaudio --start &
slstatus &
exec dwm
