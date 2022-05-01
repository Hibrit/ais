import locale
from os.path import dirname, realpath, join
from sys import executable
from subprocess import call, check_call, CalledProcessError

PATH = dirname(realpath(__file__))

# * before doin' anything run this 3 scripts at first for set up
# TODO these scripts are a bit of a hassle for every startup these are slowing the execution
#! probably create a lock file and track time in there
#! if executed in the near past don't execute it again
# for script in ['1_update_time.sh', '2_update_mirrors.sh', '3_check_dialog.sh']:
#     call([join(PATH, 'scripts', script)])

try:
    from dialog import Dialog
except ModuleNotFoundError:
    try:
        check_call(f'{executable} -m pip install pythondialog'.split())
    except CalledProcessError:
        call('pacman -Sy --noconfirm --needed  python-pip'.split())
        call(f'{executable} -m pip install pythondialog'.split())

    from dialog import Dialog


locale.setlocale(locale.LC_ALL, '')


class TUI:
    def __init__(self, title='my_tui'):
        self.dialog = Dialog(dialog='dialog')
        self.dialog.set_background_title(title)

    def default_page(self):
        self.dialog.msgbox(
            'TUI system ready to use you only have to inherit DriverPage class create an instance than edit and use update method')

    def update(self):
        self.default_page()
