#!/bin/bash

#* setting time
ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
hwclock --systohc

sed -i '177s/.//' /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "machinename" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 machinename.localdomain machinename" >> /etc/hosts
echo root:123 | chpasswd

#! create a user and set its wheel permissions

pacman -S --needed --noconfirm grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-headers xdg-user-dirs xdg-utils bash-completion openssh reflector firewalld os-prober 
# nvidia nvidia-utils nvidia-settings avahi virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft bluez bluez-utils cups tlp gvfs gvfs-smb nfs-utils inetutils dnsutils hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol sof-firmware nss-mdns acpid terminus-font rsync acpi acpi_call ipset ntfs-3g 

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
# systemctl enable bluetooth
# systemctl enable cups.service
systemctl enable sshd
# systemctl enable avagi-daemon
# systemctl enable tlp
