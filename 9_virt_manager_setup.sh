#!/bin/bash

#* clear screen
clear

#? update the keyring
sudo pacman -Sy --needed --noconfirm archlinux-keyring

#* update the repos
sudo pacman -Syy

#? install the needed packages
#! this one could couse an error mostly because --noconfirm parameter and iptables-nft
sudo pacman -Sy --needed --noconfirm qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat iptables-nft libguestfs

#? start and enable libvirtd.service
#! is this really neccessary if we restart it later on instead couldn't we start this service later on
sudo systemctl enable --now libvirtd.service

#? edit the conf file '/etc/libvirt/libvirtd.conf'
#! well this should work really but we should be able to just uncomment those lines
#TODO and we can use that uncommenting to uncomment the locale setting back in the install scripts
echo 'unix_sock_group = "libvirt"' >> /etc/libvirt/libvirtd.conf
echo 'unix_sock_rw_perms = "0770"' >> /etc/libvirt/libvirtd.conf

#? add user to group
#! really have no idea if this works
sudo usermod -a -G libvirt $(whoami)
newgrp libvirt

#? restart libvirtd.service
#! is it neccessarry ??????????
sudo systemctl restart libvirtd.service

#TODO remember to configure kvm in case of permission problems