#!/bin/bash

#! this part will be the first thing after first boot/login
#! hopefully an automated job will do

#* clear screen
clear

echo 'Installing yay'

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --syncdeps --install --needed --noconfirm

echo 'Finished'
