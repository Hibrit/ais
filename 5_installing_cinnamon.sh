#!/bin/bash

sudo pacman -Sy --needed --noconfirm git wget

git clone https://github.com/Hibrit/setupscripts.git ${HOME}/Documents/setupscripts

${HOME}/Documents/setupscripts/install_yay.sh

sudo pacman -Sy --needed --noconfirm xorg lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan numlockx cinnamon alacritty firefox papirus-icon-theme ttf-input ttf-ubuntu-font-family ttf-fira-code mlocate neofetch htop

yay -Sy --needed --noconfirm mint-themes papirus-folders bibata-cursor-theme-bin nerd-fonts-meslo

papirus-folders -C yaru -t Papirus-Dark

sudo rm /etc/lightdm/lightdm.conf /etc/lightdm/lightdm-webkit2-greeter.conf

sudo wget --directory-prefix /etc/lightdm/ https://raw.githubusercontent.com/Hibrit/archlinuxsettings/master/lightdm/lightdm.conf

sudo wget --directory-prefix /etc/lightdm/ https://raw.githubusercontent.com/Hibrit/archlinuxsettings/master/lightdm/lightdm-webkit2-greeter.conf

sudo systemctl enable lightdm.service
sudo systemctl start lightdm.service