#!/bin/bash

MACHINE_NAME='machinename'
ROOT_PASSWORD='password'
USER_NAME='username'
USER_PASSWORD='password'

#* setting time
ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
hwclock --systohc

echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "${MACHINE_NAME}" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 ${MACHINE_NAME}.localdomain ${MACHINE_NAME}" >> /etc/hosts
echo root:${ROOT_PASSWORD} | chpasswd

pacman -S --needed --noconfirm grub grub-btrfs efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base-devel linux-headers reflector openssh xdg-user-dirs tldr

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager

#* adding user
useradd -mG wheel ${USER_NAME}
echo ${USER_NAME}:${USER_PASSWORD} | chpasswd

#* informing about suders file and going into edit mode
echo
echo 'please uncomment the relevant wheel line from sudoers file'
echo
sleep 3
EDITOR=vim visudo
mkdir /home/${USER_NAME}/Documents
cp -r /ais /home/${USER_NAME}/Documents/ais
echo
echo 'please exit this tty session and proceed with scripts'
echo