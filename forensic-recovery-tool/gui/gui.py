# gui/gui.py

from PyQt5.QtWidgets import QApplication, QMainWindow, QFileDialog, QPushButton, QLabel, QVBoxLayout, QWidget, QComboBox
from core_engine.recovery import RecoveryEngine
from core_engine.metadata import MetadataEngine
from core_engine.anomaly_detection import AnomalyDetector

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle('Forensic Recovery Tool')
        self.setGeometry(100, 100, 600, 400)

        self.label = QLabel('Select file system and file to recover', self)
        self.fs_type_combo = QComboBox(self)
        self.fs_type_combo.addItems(['xfs', 'btrfs'])  # Add your file system types here
        self.recover_button = QPushButton('Recover File', self)
        self.recover_button.clicked.connect(self.recover_file)

        layout = QVBoxLayout()
        layout.addWidget(self.label)
        layout.addWidget(self.fs_type_combo)
        layout.addWidget(self.recover_button)

        container = QWidget()
        container.setLayout(layout)
        self.setCentralWidget(container)

    def recover_file(self):
        fs_type = self.fs_type_combo.currentText()
        file_name, _ = QFileDialog.getOpenFileName(self, "Select File to Recover", "", "All Files (*)")
        if file_name:
            try:
                recovery_engine = RecoveryEngine(fs_type)
                recovered_file_path = recovery_engine.recover_file(file_name)

                if recovered_file_path:
                    metadata_engine = MetadataEngine(recovered_file_path)
                    metadata = metadata_engine.extract_metadata()

                    anomaly_detector = AnomalyDetector(recovered_file_path)
                    anomalies = anomaly_detector.detect_anomalies()

                    self.label.setText(f"Recovered File: {recovered_file_path}\nMetadata: {metadata}\nAnomalies: {anomalies}")
                else:
                    self.label.setText("File recovery failed.")
            except Exception as e:
                self.label.setText(f"An error occurred: {str(e)}")

def main():
    app = QApplication([])
    window = MainWindow()
    window.show()
    app.exec_()

if __name__ == '__main__':
    main()
