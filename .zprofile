if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    slstatus -s | dwl -s ~/dotfiles/config/dwl/autostart.sh
fi
