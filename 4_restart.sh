#!/bin/bash

umount -R /mnt
rm -rf /mnt/ais

echo
echo "restarting"
sleep 1

reboot
