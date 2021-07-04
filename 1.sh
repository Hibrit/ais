#!/bin/bash

#? clear screen
clear

#? making sure mirrors are refreshed
pacman -Syy

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