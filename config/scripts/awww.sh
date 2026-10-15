#!/bin/bash

#Original AUTHOR: ABDELRHMAN NILE (PIRATE)
#github: https://github.com/AbdelrhmanNile

#Modified by: Xeliotropp
#github: https://github.com/Xeliotropp

# this script WILL NOT WORK if you don't have awww, feh (for preview) and rofi, please install them first

dir="/home/$USER/wallpapers/" # wallpapers folder, change it to yours, make sure that it ends with a /
cd $dir
wallpaper="none is selected" 
set="awww img --transition-type grow --transition-pos center --transition-duration 1.0"
view="feh"

########################-FUNCTION FOR SELECTING A WALLPAPER-###################
selectpic(){
    wallpaper=$(ls $dir | rofi -dmenu -p "select a wallpaper: ($wallpaper)")

    if [[ $wallpaper == "q" || $wallpaper == "" ]]; then
        killall feh && exit 
    else
        action
    fi
}
###############################################################################

#########################-FUNCTION FOR TAKING AN ACTION ON THE SELECTED WALLPAPER-#########################
action(){
  whattodo=$(echo -e "view\nset" | rofi -dmenu -p "whatcha wanna do with it? ($wallpaper)")
    if [[ $whattodo == "set" ]]; then
        set_wall
    else
        view_wall
    fi
}
#############################################################################################################

########-FUNCTION TO SET THE SELECTED WALLPAPER, BUT IT IS NOT PERMANANT, THE CHANGE WILL BE UNDONE AFTER LOGOUT OR REBOOT-#######
set_wall(){
    $set $wallpaper #&& killall feh &
}
###################################################################################################################################

####################-FUNCTION TO VIEW THE WALLPAPER-######################
view_wall(){
    $view $wallpaper &
    set_after_view
}
###########################################################################

##############-FUNCTION TO PROMPT THE USER AFTER VIEWING THE WALLPAPER-#######################
set_after_view(){
  setorno=$(echo -e "set\ngo back" | rofi -dmenu -p "wanna set it? ($wallpaper)")

  if [[ $setorno == "set" ]]; then
      set_wall && killall feh
    else
      killall feh && wch
    fi
}
################################################################################################

###################-MAIN-####################
selectpic
