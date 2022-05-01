#!/bin/bash
source './global.sh'

#? setting time
log_start 'SET TIME'
timedatectl set-ntp true &> /dev/null