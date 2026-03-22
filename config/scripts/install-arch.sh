#!/bin/bash

sudo pacman -S git alacritty dunst fastfetch flameshot ghostty kitty nvim picom rofi tmux;
cd ~/dotfiles/suckless/dwm;
sudo make clean install;
cd ..;
cd ~/dotfiles/suckless/slstatus;
sudo make clean install;

