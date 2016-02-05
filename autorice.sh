#!/bin/sh

sudo pacman -Sy git
sudo pacman -Sy rxvt-unicode feh rofi nemo zsh firefox

yaourt -S compton i3-gaps-git

git clone https://github.com/sKp1/dotfiles.git

rm -rf .config
rm -rf .i3

shopt -s dotglob nullglob
mv dotfiles/* .

