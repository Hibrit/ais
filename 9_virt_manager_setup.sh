#!/bin/bash

#! after vs code script done or rejected that pop-up
#! another pop-up will ask to install virt manager
#! and take action accordingly

#* clear screen
clear

#* update repos and update keyring
sudo pacman -Syy --noconfirm archlinux-keyring


#* install packages
sudo pacman -Sy qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat iptables-nft libguestfs edk2-ovmf

#* edit the conf file '/etc/libvirt/libvirtd.conf'
sudo sed -e '/unix_sock_group/s/^#//' -e '/unix_sock_rw_perms/s/^#//' -i /etc/libvirt/libvirtd.conf

#* configure qemu in case of permission problems
sudo sed -e "/#user = \".*\"/s/^#//" -e "/user = \".*\"/s/\".*\"/\"$USER\"/" -e "/#group = \".*\"/s/^#//" -e '/group = ".*"/s/".*"/"libvirt"/' -i /etc/libvirt/qemu.conf

#* add user to group
sudo usermod -a -G libvirt $(whoami)

#* start and enable libvirtd.service
sudo systemctl enable --now libvirtd.service
