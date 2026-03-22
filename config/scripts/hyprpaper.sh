#!/bin/bash
dir="/home/$USER/wallpapers/"
config_file="/home/$USER/dotfiles/hypr/hyprpaper.conf"
cd "$dir" || exit
selectpic(){
    wallpaper=$(ls "$dir" | rofi -dmenu -p "select a wallpaper:")
    if [[ $wallpaper == "q" || $wallpaper == "" ]]; then
        killall imv 2>/dev/null && exit 
    else
        action
    fi
}
action(){
    whattodo=$(echo -e "set" | rofi -dmenu -p "whatcha wanna do with it? ($wallpaper)")
    if [[ $whattodo == "set" ]]; then
        set_wall
    fi
}
set_wall(){
    hyprctl hyprpaper wallpaper "eDP-1,$dir$wallpaper"
    sed -i "s|path = ~/wallpapers/.*|path = ~/wallpapers/$wallpaper|" "$config_file"
    hyprctl hyprpaper wallpaper "eDP-1,~/wallpapers/$wallpaper"
}

selectpic
