from .driver_page import DriverPage
from subprocess import Popen, PIPE
from .info_page import InfoPage


class PartitioningPage(DriverPage):
    def __init__(self):
        super().__init__(title='Partitioning Page')

    def update(self):
        # * first inform user with their current disk scheme
        # *get information with lsblk
        process = Popen(
            'lsblk --output label,name,size,type,mountpoints'.split(), stdout=PIPE, stderr=PIPE)
        out, err = process.communicate()

        message = ''
        black_list = ['archiso']

        for i in out.decode('utf-8').split('\n'):
            for j in black_list:
                if j in i:
                    break
            else:
                message += i
                message += '\n'

        info_page = InfoPage(message=message[:-1])
        info_page.update()

        #! ask for which disk to partition
        #! use radiolist here !!!!!!!!
        # code, tag = self.dialog.radiolist('Do you want to partition the disk manually ?',
        #                                   choices=[('ch1', False),
        #                                            ('ch2', True)])
        # if code == self.dialog.OK:
        #     print(tag)

        #! partition the disk accordingly

        # self.dialog.msgbox('congrats you are using a custom new page')

        # info_page = InfoPage(message=out.decode('utf-8'))
        # info_page.update()

        #! give user the options manual or automatic
        #! to manuel partitioning use cfdisk
        #! to automated partitioning use bash scripting more and more
