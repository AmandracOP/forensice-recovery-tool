# cli/cli.py

from core_engine.recovery import RecoveryEngine
from core_engine.metadata import MetadataEngine
from core_engine.anomaly_detection import AnomalyDetector

def run_cli():
    print("Starting CLI...")
    fs_type = input("Enter file system type (xfs/btrfs): ").strip()
    file_name = input("Enter file name to recover: ").strip()

    if fs_type not in ['xfs', 'btrfs']:
        print("Invalid file system type.")
        return

    try:
        recovery_engine = RecoveryEngine(fs_type)
        recovered_file_path = recovery_engine.recover_file(file_name)

        if recovered_file_path:
            metadata_engine = MetadataEngine(recovered_file_path)
            metadata = metadata_engine.extract_metadata()

            anomaly_detector = AnomalyDetector(recovered_file_path)
            anomalies = anomaly_detector.detect_anomalies()

            print(f"Recovered File: {recovered_file_path}")
            print(f"Metadata: {metadata}")
            print(f"Anomalies: {anomalies}")
        else:
            print("File recovery failed.")
    except Exception as e:
        print(f"An error occurred: {str(e)}")

if __name__ == '__main__':
    run_cli()
