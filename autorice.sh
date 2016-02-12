#!/bin/sh

if [[ -f `pwd`/sharedfuncs ]]; then
  source sharedfuncs
else
  echo "missing file: sharedfuncs"
  exit 1
fi

sudo pacman -Sy git rxvt-unicode feh rofi nemo zsh firefox wget

yaourt -S compton i3-gaps-git gtk-theme-arc

# firefox -install-global-theme /path/to/theme


print_title "INFINALITY - https://wiki.archlinux.org/index.php/Infinality-bundle%2Bfonts"
add_key "962DDE58"
add_repository "infinality-bundle" "http://bohoomil.com/repo/\$arch" "Never"
[[ $ARCHI == x86_64 ]] && add_repository "infinality-bundle-multilib" "http://bohoomil.com/repo/multilib/\$arch" "Never"
is_package_installed "freetype2" && pacman -Rdds --noconfirm freetype2 fontconfig cairo
is_package_installed "freetype2-ubuntu" && pacman -Rdds freetype2-ubuntu fontconfig-ubuntu cairo-ubuntu
pacman -S --needed infinality-bundle
[[ $ARCHI == x86_64 ]] && pacman -S --needed infinality-bundle-multilib
break





git clone https://github.com/sKp1/dotfiles.git

rm -rf .config
rm -rf .i3

shopt -s dotglob nullglob
mv dotfiles/* .

sh -s /bin/zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
