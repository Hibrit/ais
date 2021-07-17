#!/bin/bash

umount -R /mnt
rm -rf /mnt/ais

echo
echo "restarting in 3"
sleep 1
echo "restarting in 2"
sleep 1
echo "restarting in 1"
sleep 1
reboot