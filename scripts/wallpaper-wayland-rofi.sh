#!/bin/bash
#MODIFIED FOR SWAY/WAYLAND
#ORIGINAL AUTHOR: ABDELRHMAN NILE (PIRATE)
#github: https://github.com/AbdelrhmanNile
# this script requires rofi and either imv/swaybg or swww
#
dir="/home/$USER/wallpapers/" # wallpapers folder, change it to yours, make sure that it ends with a /
cd $dir
wallpaper="none is selected" 
set="swaymsg output '*' bg" # Sway command for setting wallpaper
set_mode="fill" # fill, fit, stretch, center, tile
view="imv" # imv is a Wayland image viewer (or use 'feh' which works via XWayland)
startup_config_file="/home/$USER/.config/sway/config" # Sway config file
########################-FUNCTION FOR SELECTING A WALLPAPER-###################
selectpic(){
    wallpaper=$(ls $dir | rofi -dmenu -p "select a wallpaper: ($wallpaper)")
    if [[ $wallpaper == "q" || $wallpaper == "" ]]; then
        killall imv feh 2>/dev/null && exit 
    else
        action
    fi
}
###############################################################################
#########################-FUNCTION FOR TAKING AN ACTION ON THE SELECTED WALLPAPER-#########################
action(){
  whattodo=$(echo -e "view\nset\nset (permanant)" | rofi -dmenu -p "whatcha wanna do with it? ($wallpaper)")
    if [[ $whattodo == "set" ]]; then
        set_wall
    elif [[ $whattodo == "set (permanant)" ]]; then
      set_permanant
    else
        view_wall
    fi
}
#############################################################################################################
########-FUNCTION TO SET THE SELECTED WALLPAPER, BUT IT IS NOT PERMANANT, THE CHANGE WILL BE UNDONE AFTER LOGOUT OR REBOOT-#######
set_wall(){
    $set "$dir$wallpaper" $set_mode
}
###################################################################################################################################
####################-FUNCTION TO VIEW THE WALLPAPER-######################
view_wall(){
    $view "$dir$wallpaper" &
    set_after_view
}
###########################################################################
##############-FUNCTION TO PROMPT THE USER AFTER VIEWING THE WALLPAPER-#######################
set_after_view(){
  setorno=$(echo -e "set (permanant)\ngo back" | rofi -dmenu -p "wanna set it? ($wallpaper)")
  if [[ $setorno == "set (permanant)" ]]; then
      set_permanant
    else
      killall imv feh 2>/dev/null && selectpic
    fi
}
################################################################################################
#########-FUNCTION TO SET THE WALLPAPER permanantly, IT WILL MODIFY YOUR START UP CONFIG FILE-###########
set_permanant(){
  set_wall
  # Remove old wallpaper line
  sed -i '/output.*bg.*fill/d' $startup_config_file
  sed -i '/output.*bg.*fit/d' $startup_config_file
  sed -i '/output.*bg.*stretch/d' $startup_config_file
  sed -i '/output.*bg.*center/d' $startup_config_file
  sed -i '/output.*bg.*tile/d' $startup_config_file
  # Add new wallpaper line
  echo "output * bg $dir$wallpaper $set_mode" >> $startup_config_file
}
#########################################################################################################
###################-MAIN-####################
selectpic
