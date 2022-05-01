#!/usr/bin/python3

try:
    from dialog import Dialog
    print('success')
except ModuleNotFoundError:
    from sys import executable
    from subprocess import check_call, STDERR
    code = check_call(f'{executable} -m pip install pythondialog'.split())

    print(code)
    # if STDERR == -2:
    #     call('pacman -Sy --noconfirm --needed  python-pip'.split())
    # call(f'{executable} -m pip install pythondialog'.split())
    from dialog import Dialog

#! use pythondialog
