#!/bin/bash

#* clear screen
clear

#* setting time
timedatectl set-ntp true

#* set the proper pacman configuration
rm /etc/pacman.conf
wget --directory-prefix /etc/ https://raw.githubusercontent.com/Hibrit/archlinuxsettings/master/pacman/pacman.conf
pacman -Syy

#* listing partitions
lsblk
echo
lsblk -f

echo
echo

#* printing what to do
echo "get done with the cfdisk /dev/DEVICE and done mounting to /mnt"
echo
