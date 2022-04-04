#!/bin/bash

#* clear screen
clear

#* update repos and update keyring
sudo pacman -Syy --noconfirm archlinux-keyring


#? install the needed packages
sudo pacman -Sy qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat iptables-nft libguestfs edk2-ovmf

#? edit the conf file '/etc/libvirt/libvirtd.conf'
sudo sed '/unix_sock_group/s/^#//' -i /etc/libvirt/libvirtd.conf
sudo sed '/unix_sock_rw_perms/s/^#//' -i /etc/libvirt/libvirtd.conf

#? add user to group
#! really have no idea if this works
sudo usermod -a -G libvirt $(whoami)

#? start and enable libvirtd.service
#! is this really neccessary if we restart it later on instead couldn't we start this service later on
sudo systemctl enable --now libvirtd.service

#TODO remember to configure kvm in case of permission problems