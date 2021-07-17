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

#* clone this repo inside /mnt/root
git clone https://github.com/Hibrit/ais.git /mnt/ais

#* chroot
arch-chroot /mnt