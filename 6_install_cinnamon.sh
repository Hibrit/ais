#!/bin/bash

#* clear screen
clear

#* install needed packages
sudo pacman -Sy --needed --noconfirm xorg lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan numlockx cinnamon alacritty papirus-icon-theme ttf-input ttf-ubuntu-font-family ttf-fira-code neofetch htop gnome-keyring mpv youtube-dl eog mupdf
yay -Sy --needed --noconfirm mint-themes papirus-folders bibata-cursor-theme-bin nerd-fonts-meslo google-chrome brave-bin mailspring

#* change papirus folders color theme to yaru
papirus-folders -C yaru -t Papirus-Dark

#* replace lightdm config with the proper one
sudo rm /etc/lightdm/lightdm.conf /etc/lightdm/lightdm-webkit2-greeter.conf
sudo wget --directory-prefix /etc/lightdm/ https://raw.githubusercontent.com/Hibrit/archlinuxsettings/master/lightdm/lightdm.conf
sudo wget --directory-prefix /etc/lightdm/ https://raw.githubusercontent.com/Hibrit/archlinuxsettings/master/lightdm/lightdm-webkit2-greeter.conf

#* enable and start lightdm
sudo systemctl enable --now lightdm.service
