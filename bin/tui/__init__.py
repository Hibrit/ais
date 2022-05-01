import locale
from os.path import dirname, realpath, join
from sys import executable
from subprocess import call, check_call, CalledProcessError

PATH = dirname(realpath(__file__))

# * before doin' anything run this 3 scripts at first for set up
for script in ['1_update_time.sh', '2_update_mirrors.sh', '3_check_dialog.sh']:
    call([join(PATH, 'scripts', script)])

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
    def __init__(self):
        self.dialog = Dialog(dialog='dialog')
        self.dialog.set_background_title('my_tui')

    def run(self):
        if self.dialog.yesno('yes or no') == self.dialog.OK:
            self.dialog.msgbox(
                'this is a message (can be used as an alert too)')

            code, tags = self.dialog.checklist('this is a checklist',
                                               choices=[('check_box 1', '', False),
                                                        ('check_box 2', '', False),
                                                        ('check_box 3', '', False)],
                                               title='checklist title',
                                               backtitle='checklist backtitle')
            if code == self.dialog.OK:
                print(tags)
