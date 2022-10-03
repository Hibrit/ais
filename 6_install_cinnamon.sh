#!/bin/bash

#* clear screen
clear

#* install needed packages
#! changes
#! >> instead of lightdm-webkit2-greeter + ligtdm-webkit-theme-litarvan use lightdm-mini-greeter alone
#! >> remember to make its configuration or it will not work

sudo pacman -Sy --needed --noconfirm xorg lightdm cinnamon alacritty papirus-icon-theme ttf-input ttf-ubuntu-font-family ttf-fira-code neofetch htop gnome-keyring mpv youtube-dl eog mupdf firefox qalculate-gtk

yay -Sy --needed --noconfirm lightdm-mini-greeter mint-themes papirus-folders bibata-cursor-theme-bin nerd-fonts-meslo mailspring ookla-speedtest-bin

#* change papirus folders color theme to yaru
papirus-folders -C yaru -t Papirus-Dark

#* replace ~/.vimrc with the proper one
if [ -f "~/.vimrc" ]; then
    rm ~/.vimrc && wget --directory-prefix ~/ https://raw.githubusercontent.com/Hibrit/archlinuxsettings/master/vim/.vimrc
else
    wget --directory-prefix ~/ https://raw.githubusercontent.com/Hibrit/archlinuxsettings/master/vim/.vimrc
fi

#* replace lightdm config with the proper one
sudo rm /etc/lightdm/lightdm.conf /etc/lightdm/lightdm-mini-greeter.conf
sudo wget --directory-prefix /etc/lightdm/ https://github.com/Hibrit/archlinuxsettings/raw/master/lightdm/lightdm-mini-greeter.conf
sudo wget --directory-prefix /etc/lightdm/ https://github.com/Hibrit/archlinuxsettings/raw/master/lightdm/lightdm.conf

#! berofe enabling lightdm.service please force user to change its username in lightdm-mini-greeter.conf
echo 'please change your username in configuration'
sleep 3
sudo vim /etc/lightdm/lightdm-mini-greeter.conf

#* enable and start lightdm
sudo systemctl enable --now lightdm.service
