#!/bin/bash
echo "Installing packages"
sudo pacman -S i3 polybar fastfetch picom rofi tmux kitty base-devel nvim dunst git
echo "Moving the dotfiles"
sudo rm -rf ~/.config/i3 ~/.config/polybar ~/.config/fastfetch ~/.config/picom ~/.config/rofi ~/.config/scripts ~/.config/tmux ~/.config/kitty ~/.config/dunst ~/.config/nvim ~/wallpapers ~/.zshrc
ln -s ~/dotfiles/i3 ~/.config/i3
ln -s ~/dotfiles/polybar ~/.config/polybar
ln -s ~/dotfiles/fastfetch ~/.config/fastfetch
ln -s ~/dotfiles/picom ~/.config/picom
ln -s ~/dotfiles/scripts ~/.config/scripts
ln -s ~/dotfiles/tmux ~/.config/tmux
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/dunst ~/.config/dunst
ln -s ~/dotfiles/rofi ~/.config/rofi
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/wallpapers ~/wallpapers
ln -s ~/dotfiles/.zshrc ~/.zshrc
echo "Installing yay"
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
