#!/bin/bash

#* clear screen
clear

#* update repos and update keyring
sudo pacman -Syy --noconfirm archlinux-keyring


#? install the needed packages
sudo pacman -Sy qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat iptables-nft libguestfs edk2-ovmf

#? edit the conf file '/etc/libvirt/libvirtd.conf'
sudo sed -e '/unix_sock_group/s/^#//' -e '/unix_sock_rw_perms/s/^#//' -i /etc/libvirt/libvirtd.conf

#? configure qemu in case of permission problems
sudo sed -e "/#user = \".*\"/s/^#//" -e "/user = \".*\"/s/\".*\"/\"$USER\"/" -e "/#group = \".*\"/s/^#//" -e '/group = ".*"/s/".*"/"libvirt"/' /etc/libvirt/qemu.conf

#? add user to group
#! really have no idea if this works
sudo usermod -a -G libvirt $(whoami)

#? start and enable libvirtd.service
#! is this really neccessary if we restart it later on instead couldn't we start this service later on
sudo systemctl enable --now libvirtd.service
