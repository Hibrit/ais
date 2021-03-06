#!/bin/bash

local_path=$(dirname -- "$(readlink -f "${BASH_SOURCE}")")
source "$local_path/global.sh"

#* check if /usr/bin/dialog exists if not install dialog via pacman
log_start 'check dialog'
if [ ! -f '/usr/bin/dialog' ]; then
    pacman -Sy --noconfirm --needed dialog
fi