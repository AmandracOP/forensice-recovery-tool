#!/bin/bash

# Create the main project directory
mkdir -p forensic-recovery-tool/{core_engine,cli,gui,tests,docs,mock_filesystems/xfs,mock_filesystems/btrfs,data}

# Create Python files
touch forensic-recovery-tool/core_engine/{__init__.py,recovery.py,metadata.py,anomaly_detection.py}
touch forensic-recovery-tool/cli/{__init__.py,cli.py}
touch forensic-recovery-tool/gui/{__init__.py,gui.py}
touch forensic-recovery-tool/tests/{__init__.py,test_recovery.py,test_metadata.py,test_anomaly_detection.py,test_cli.py}
touch forensic-recovery-tool/docs/{README.md,user_manual.md}
touch forensic-recovery-tool/requirements.txt
touch forensic-recovery-tool/main.py

# Create mock file systems
# Mock XFS file system
dd if=/dev/zero of=forensic-recovery-tool/mock_filesystems/xfs/mock_xfs.img bs=1M count=300
mkfs.xfs forensic-recovery-tool/mock_filesystems/xfs/mock_xfs.img

# Mock Btrfs file system
dd if=/dev/zero of=forensic-recovery-tool/mock_filesystems/btrfs/mock_btrfs.img bs=1M count=300
mkfs.btrfs forensic-recovery-tool/mock_filesystems/btrfs/mock_btrfs.img

# Mount the mock file systems
mkdir -p forensic-recovery-tool/mock_filesystems/xfs_mount
mkdir -p forensic-recovery-tool/mock_filesystems/btrfs_mount
sudo mount -o loop forensic-recovery-tool/mock_filesystems/xfs/mock_xfs.img forensic-recovery-tool/mock_filesystems/xfs_mount
sudo mount -o loop forensic-recovery-tool/mock_filesystems/btrfs/mock_btrfs.img forensic-recovery-tool/mock_filesystems/btrfs_mount

echo "Project directory structure created and mock file systems set up."
#!/bin/bash

# Create the main project directory
mkdir -p forensic-recovery-tool/{core_engine,cli,gui,tests,docs,mock_filesystems/xfs,mock_filesystems/btrfs}

# Create Python files
touch forensic-recovery-tool/core_engine/{__init__.py,recovery.py,metadata.py,anomaly_detection.py}
touch forensic-recovery-tool/cli/{__init__.py,cli.py}
touch forensic-recovery-tool/gui/{__init__.py,gui.py}
touch forensic-recovery-tool/tests/{__init__.py,test_recovery.py,test_metadata.py,test_anomaly_detection.py,test_cli.py}
touch forensic-recovery-tool/docs/{README.md,user_manual.md}
touch forensic-recovery-tool/requirements.txt
touch forensic-recovery-tool/main.py

# Create mock file systems
# Mock XFS file system
dd if=/dev/zero of=forensic-recovery-tool/mock_filesystems/xfs/mock_xfs.img bs=1M count=50
mkfs.xfs forensic-recovery-tool/mock_filesystems/xfs/mock_xfs.img

# Mock Btrfs file system
dd if=/dev/zero of=forensic-recovery-tool/mock_filesystems/btrfs/mock_btrfs.img bs=1M count=50
mkfs.btrfs forensic-recovery-tool/mock_filesystems/btrfs/mock_btrfs.img

# Mount the mock file systems
mkdir -p forensic-recovery-tool/mock_filesystems/xfs_mount
mkdir -p forensic-recovery-tool/mock_filesystems/btrfs_mount
sudo mount -o loop forensic-recovery-tool/mock_filesystems/xfs/mock_xfs.img forensic-recovery-tool/mock_filesystems/xfs_mount
sudo mount -o loop forensic-recovery-tool/mock_filesystems/btrfs/mock_btrfs.img forensic-recovery-tool/mock_filesystems/btrfs_mount

echo "Project directory structure created and mock file systems set up."
