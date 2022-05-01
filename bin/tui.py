#!/usr/bin/python3

try:
    from dialog import Dialog
    print('success')
except ModuleNotFoundError:
    from sys import executable
    from subprocess import call, STDERR
    call(f'{executable} -m pip install pythondialog'.split())
    print(STDERR)
    # if STDERR == -2:
    #     call('pacman -Sy --noconfirm --needed  python-pip'.split())
    # call(f'{executable} -m pip install pythondialog'.split())
    from dialog import Dialog

#! use pythondialog
