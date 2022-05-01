from .driver_page import DriverPage


class InfoPage(DriverPage):
    def __init__(self, message='message'):
        super().__init__(title='Info')
        self.message = message
        #! it should have a return point in order to continue where you left of while uncountered with the info

    def update(self):
        self.dialog.msgbox(self.message)
