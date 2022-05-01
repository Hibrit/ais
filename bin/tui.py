#!/usr/bin/python3

#!!!!!!!!!!!!! THIS FILE CONTAINS EVERYTHING I NEED TO KNOW TO CREATE A TUI WITH PYTHONDIALOG

#! before doing anything run script 1 and 2
import locale
from os.path import dirname, realpath, join
from sys import executable
from subprocess import call, check_call, CalledProcessError

PATH = dirname(realpath(__file__))
print(PATH)
for script in ['1_update_time.sh', '2_update_mirrors.sh', '3_check_dialog.sh']:
    print(script)
    call([join(PATH, 'scripts', script)])
    # print(join(PATH, 'scripts', script))

# call(join(PATH, 'scripts', '1_update_time.sh'))
# call(join(PATH, 'scripts', '2_update_mirrors.sh'))
# call(join(PATH, 'scripts', '3_check_dialog.sh'))


try:
    from dialog import Dialog
    print('success')
except ModuleNotFoundError:
    try:
        check_call(f'{executable} -m pip install pythondialog'.split())
    except CalledProcessError:
        call('pacman -Sy --noconfirm --needed  python-pip'.split())
        call(f'{executable} -m pip install pythondialog'.split())

    from dialog import Dialog


locale.setlocale(locale.LC_ALL, '')

d = Dialog(dialog='dialog')

d.set_background_title('my_tui')

if d.yesno('yes or no') == d.OK:
    d.msgbox('this is a message')

    code, tags = d.checklist('this is a checklist',
                             choices=[('check_box 1', '', False),
                                      ('check_box 2', '', False),
                                      ('check_box 3', '', False)],
                             title='checklist title',
                             backtitle='checklist backtitle')

    if code == d.OK:
        print(tags)
else:
    code, tag = d.menu('options >> ',
                       choices=[('(1)', 'choice 1'),
                                ('(2)', 'choice 2')])
    if code == d.OK:
        print(tag)
