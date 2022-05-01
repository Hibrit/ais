from .driver_page import DriverPage
from subprocess import Popen, PIPE
from .info_page import InfoPage


class PartitioningPage(DriverPage):
    def __init__(self):
        super().__init__(title='Partitioning Page')

    def update(self):
        # TODO first inform user with their current disk scheme
        #!get information with lsblk
        process = Popen(
            'lsblk --output label,name,size,type,mountpoints | grep loop'.split(), stdout=PIPE, stderr=PIPE)
        out, err = process.communicate()

        # self.dialog.msgbox(out.decode(encoding='utf-8'))
        # self.dialog.msgbox('congrats you are using a custom new page')

        info_page = InfoPage(message=out.decode('utf-8'))
        info_page.update()

        #! second select which disk to use
        #! give user the options manual or automatic
        #! to manuel partitioning use cfdisk
        #! to automated partitioning use bash scripting more and more
