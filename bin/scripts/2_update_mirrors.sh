#!/bin/bash

PATH=$(dirname -- "$(readlink -f "${BASH_SOURCE}")")
echo $PATH

source "$PATH/global.sh"


#* check for wget first
log_start 'WGET'
sudo pacman -Sy --noconfirm --needed wget 1>> /var/log/ais.out 2>> /var/log/ais.err

#* set the proper pacman configuration
log_start 'PACMAN CONFIG'
rm /etc/pacman.conf 1>> /var/log/ais.out 2>> /var/log/ais.err

wget --directory-prefix /etc/ https://raw.githubusercontent.com/Hibrit/archlinuxsettings/master/pacman/pacman.conf 1>> /var/log/ais.out 2>> /var/log/ais.err

pacman -Syy 1>> /var/log/ais.out 2>> /var/log/ais.err