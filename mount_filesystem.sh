#!/bin/bash

# Define image file paths
XFS_IMG="forensic-recovery-tool/mock_filesystems/xfs/mock_xfs.img"
BTRFS_IMG="forensic-recovery-tool/mock_filesystems/btrfs/mock_btrfs.img"

# Create larger image files
dd if=/dev/zero of=$XFS_IMG bs=1M count=1024
dd if=/dev/zero of=$BTRFS_IMG bs=1M count=1024

# Format image files
sudo mkfs.xfs $XFS_IMG
sudo mkfs.btrfs $BTRFS_IMG

# Create mount points if they don't exist
sudo mkdir -p forensic-recovery-tool/mock_filesystems/xfs_mount
sudo mkdir -p forensic-recovery-tool/mock_filesystems/btrfs_mount

# Mount file systems
sudo mount -o loop $XFS_IMG forensic-recovery-tool/mock_filesystems/xfs_mount
sudo mount -o loop $BTRFS_IMG forensic-recovery-tool/mock_filesystems/btrfs_mount

echo "File systems have been created, formatted, and mounted."
