#!/bin/bash

#* installing the essential packages
pacstrap /mnt base linux linux-firmware git vim wget
# intel-ucode

#* generating fstab
genfstab -U /mnt >> /mnt/etc/fstab
echo
echo 'filesystem table created'
echo
sleep 3

#? clone this repo inside /mnt/root
git clone https://github.com/Hibrit/arch_install_scripts.git /mnt/

#* chroot
arch-chroot /mnt