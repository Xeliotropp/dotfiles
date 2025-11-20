#!/bin/bash
sudo chmod +x ~/dotfiles/add-dotfiles.sh
pacman -S i3 polybar fastfetch picom rofi tmux kitty base-devel
ln -s ~/dotfiles/i3 ~/.config/i3
ln -s ~/dotfiles/polybar ~/.config/polybar
ln -s ~/dotfiles/fastfetch ~/.config/fastfetch
ln -s ~/dotfiles/picom ~/.config/picom
ln -s ~/dotfiles/rofi ~/.config/rofi
ln -s ~/dotfiles/scripts ~/.config/scripts
ln -s ~/dotfiles/tmux ~/.config/tmux
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/wallpapers ~/wallpapers
ln -s ~/dotfiles/.zshrc ~/.zshrc
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
