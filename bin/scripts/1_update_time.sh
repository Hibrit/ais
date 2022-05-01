#!/bin/bash
source './global.sh'

#* setting time
log_start 'SET TIME'
timedatectl set-ntp true 1>> /var/log/ais.out 2>> /var/log/ais.err
log_end