#!/bin/bash
echo "Moving the dotfiles"
rm -rf ~/.config/alacritty ~/.config/dunst ~/.config/dwm ~/.config/fastfetch ~/.config/flameshot ~/.config/ghostty ~/.config/hypr ~/.config/kitty ~/.config/nvim ~/.config/picom ~/.config/rofi ~/.config/tmux ~/.config/waybar
echo "Do you want to install the following packages on Arch? (alacritty dunst fastfetch flameshot ghostty kitty nvim picom rofi tmux) [y/n] : "
read qinstall
if [[ $qinstall == 'y' ]]; then
   ./~/dotfiles/scripts/install-arch.sh 
fi
ln -s ~/dofiles/alacritty ~/.config/alacritty
ln -s ~/dofiles/dunst ~/.config/dunst
ln -s ~/dofiles/fastfetch ~/.config/fastfetch
ln -s ~/dofiles/flameshot ~/.config/flameshot
ln -s ~/dofiles/ghostty ~/.config/ghostty
ln -s ~/dofiles/hypr ~/.config/hypr
ln -s ~/dofiles/kitty ~/.config/kitty
ln -s ~/dofiles/nvim ~/.config/nvim
ln -s ~/dofiles/ohmyposh ~/.config/ohmyposh
ln -s ~/dofiles/picom ~/.config/picom
ln -s ~/dofiles/rofi ~/.config/rofi
ln -s ~/dofiles/scripts ~/.config/scripts
ln -s ~/dofiles/suckless/dwm ~/.config/dwm
ln -s ~/dofiles/tmux ~/.config/tmux
ln -s ~/dofiles/wallpapers ~/wallpapers
ln -s ~/dofiles/waybar ~/.config/waybar
ln -s ~/dotfiles/.zshrc ~/.zshrc
