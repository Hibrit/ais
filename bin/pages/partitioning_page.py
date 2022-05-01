from .driver_page import DriverPage


class PartitioningPage(DriverPage):
    def __init__(self):
        super().__init__(title='Partitioning Page')

    # def update(self):
        # TODO first inform user with their current disk scheme
        #!get information with lsblk

        #! second select which disk to use
        #! give user the options manual or automatic
        #! to manuel partitioning use cfdisk
        #! to automated partitioning use bash scripting more and more
        # pass
