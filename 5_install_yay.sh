#!/bin/bash

#* clear screen
clear

echo 'Installing yay'

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --syncdeps --install --needed --noconfirm

echo 'Finished'
