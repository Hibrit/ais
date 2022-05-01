from tui import TUI


class MainPage(TUI):
    def __init__(self):
        super().__init__(title='Main Page')

    def update(self):
        code, tag = self.dialog.menu('Options >> ',
                                     choices=[('(0)', 'Partitioning and mounting'),
                                              ('(q)', 'quit')])

        if code == self.dialog.OK:
            print(tag)
