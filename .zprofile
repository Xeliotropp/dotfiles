if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    # start-hyprland
    startx;
fi
