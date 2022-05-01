#!/bin/bash

#* clear screen
clear

#! maybe here we can decide which ucode to install based on system info somehow
#* installing the essential packages
pacstrap /mnt base linux linux-firmware git vim wget #intel-ucode amd-ucode

#* generating fstab
genfstab -U /mnt >> /mnt/etc/fstab
echo
echo 'filesystem table created'
echo
sleep 3

#* clone this repo inside /mnt/root
git clone https://github.com/Hibrit/ais.git /mnt/ais

#! at this part we should find a way to controll that connection to installed system
#! in order to automate this
#* chroot
arch-chroot /mnt
