#!/bin/bash
source './global.sh'

#? setting time
log_start 'SET TIME'
timedatectl set-ntp true &> /dev/null
echo "timedatectl set-ntp true" >> /var/log/ais.out