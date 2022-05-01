#!/bin/bash

local_path=$(dirname -- "$(readlink -f "${BASH_SOURCE}")")
source "$local_path/global.sh"


#* check for wget first
log_start 'update mirrors'
#? generate optimal repositories with reflector
reflector --country '' --protocol https --latest 5 --save /etc/pacman.d/mirrorlist
pacman -Syy --noconfirm --needed wget 1>> /var/log/ais.out 2>> /var/log/ais.err

#* set the proper pacman configuration
rm /etc/pacman.conf 1>> /var/log/ais.out 2>> /var/log/ais.err

wget --directory-prefix /etc/ https://raw.githubusercontent.com/Hibrit/archlinuxsettings/master/pacman/pacman.conf 1>> /var/log/ais.out 2>> /var/log/ais.err

pacman -Syy 1>> /var/log/ais.out 2>> /var/log/ais.err