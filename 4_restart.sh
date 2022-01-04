#!/bin/bash

#* clear screen
clear

rm -rf /mnt/ais
umount -R /mnt

echo
echo "restarting"
sleep 1

reboot
