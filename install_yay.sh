#!/bin/bash
# Author: hibrit
# Purpose: installing yay
# Date Created: 17/07/2021
# Date Modified: 17/07/2021

echo 'Installing yay'

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --syncdeps --install --needed --noconfirm

echo 'Finished'
