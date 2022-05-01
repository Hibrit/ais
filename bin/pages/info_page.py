from .driver_page import DriverPage


class InfoPage(DriverPage):
    def __init__(self, message='message'):
        super().__init__(title='Info')
        self.message = message

    def update(self):
        self.dialog.msgbox(self.message)
