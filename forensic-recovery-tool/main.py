# main.py

import sys
from PyQt5.QtWidgets import QApplication
from gui.gui import MainWindow

def main():
    if len(sys.argv) > 1 and sys.argv[1] == 'cli':
        import cli.cli as cli
        cli.run_cli()
    else:
        app = QApplication(sys.argv)
        window = MainWindow()
        window.show()
        app.exec_()

if __name__ == '__main__':
    main()
