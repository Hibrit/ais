#!/bin/bash

#* clear screen
clear

#? setting time
timedatectl set-ntp true

#* making sure mirrors are refreshed
pacman -Syy

#* updating mirrors
pacman -S --noconfirm reflector
reflector -c Turkey -a 12 --sort rate --save /etc/pacman.d/mirrorlist

echo
echo

#* listing partitions
lsblk
echo
lsblk -f

echo
echo

#* printing what to do
echo "get done with the cfdisk /dev/DEVICE and done mounting to /mnt"
echo