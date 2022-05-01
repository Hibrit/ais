#!/bin/bash

PATH=$(dirname -- "$(readlink -f "${BASH_SOURCE}")")
echo $PATH

source "$PATH/global.sh"

#! check if /usr/bin/dialog exists if not install dialog via pacman
if [ -f '/usr/bin/dialog' ]; then
    echo 'dialog exists'
else
    echo 'dialog does not exist'
    /usr/bin/pacman -Sy --noconfirm --needed dialog
fi