#!/bin/bash

source ./global.sh

#! check if /usr/bin/dialog exists if not install dialog via pacman
if [ -f '/usr/bin/dialog' ]; then
    echo 'dialog exists'
else
    echo 'dialog does not exist'
fi