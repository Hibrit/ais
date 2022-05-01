#!/usr/bin/python3

try:
    from dialog import Dialog
    print('success')
except ModuleNotFoundError:
    from sys import executable
    from subprocess import call
    call(f'{executable} -m pip install pythondialog'.split())
    from dialog import Dialog

#! use pythondialog
