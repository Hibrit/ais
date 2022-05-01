from .driver_page import DriverPage
from .partitioning_page import PartitioningPage


class MainPage(DriverPage):
    def __init__(self):
        super().__init__(title='Main Page')

    def update(self):
        code, tag = self.dialog.menu('Options >> ',
                                     choices=[('(0)', 'Partitioning and mounting'),
                                              ('(q)', 'quit')])

        if code == self.dialog.OK:
            # * if tag (q) quit immidiately
            if tag.lower() == '(q)':
                exit()
            elif tag == '(0)':
                # * if tag (0) than go to partitioning_page
                p = PartitioningPage()
                p.update()
