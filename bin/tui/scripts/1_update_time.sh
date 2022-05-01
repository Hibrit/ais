#!/bin/bash

local_path=$(dirname -- "$(readlink -f "${BASH_SOURCE}")")
source "$local_path/global.sh"


#* setting time
#! it still has outputs on tty
log_start 'update time'
timedatectl set-ntp true &> /dev/null