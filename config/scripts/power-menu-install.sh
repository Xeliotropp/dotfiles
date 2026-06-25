#!/bin/bash

# Special thanks to https://github.com/Lucad44/tschuss for making this amazing project!

sudo pacman -S libconfig meson git

cd /tmp
git clone https://github.com/Lucad44/tschuss
cd tschuss
meson setup build
meson compile -C build
sudo meson install -C build
