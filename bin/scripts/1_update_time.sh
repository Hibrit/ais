#!/bin/bash

local_path=$(dirname -- "$(readlink -f "${BASH_SOURCE}")")
echo $local_path

source "$local_path/global.sh"


#? setting time
log_start 'SET TIME'
timedatectl set-ntp true &> /dev/null