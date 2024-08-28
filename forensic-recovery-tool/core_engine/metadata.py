# core_engine/metadata.py

import os
import time

class MetadataEngine:
    def __init__(self, recovered_file_path):
        self.recovered_file_path = recovered_file_path

    def extract_metadata(self):
        metadata = {
            'file_name': os.path.basename(self.recovered_file_path),
            'file_size': os.path.getsize(self.recovered_file_path),
            'creation_time': time.ctime(os.path.getctime(self.recovered_file_path)),
            'modification_time': time.ctime(os.path.getmtime(self.recovered_file_path)),
            'deletion_time': 'N/A'  # Deletion time is generally not available
        }
        print(f"Metadata extracted for '{self.recovered_file_path}': {metadata}")
        return metadata
