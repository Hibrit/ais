#!/bin/bash

sudo pacman -Sy --needed --noconfirm git

git clone https://github.com/Hibrit/setupscripts.git ${HOME}/Documents/setupscripts

${HOME}/Documents/setupscripts/install_yay.sh

sudo pacman -Sy --needed --noconfirm xorg lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan numlockx cinnamon alacritty firefox papirus-icon-theme

yay -Sy --needed --noconfirm papirus-folders bibata-cursor-theme-bin