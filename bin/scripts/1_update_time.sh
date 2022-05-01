#!/bin/bash

local_path=$(dirname -- "$(readlink -f "${BASH_SOURCE}")")
source "$local_path/global.sh"


#* setting time
log_start 'SET TIME'
timedatectl set-ntp true &> /dev/null