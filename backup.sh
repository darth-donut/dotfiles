#!/bin/bash

# Author: Jia Hong
# Friday 22 December  00:52:46 AEDT 2017
# Backup script. Ignores unnecessary files as specified by:
#   Ruben Barkow <https://github.com/rubo77/rsync-homedir-excludes>
#   wget https://github.com/rubo77/rsync-homedir-excludes -O $IGNORELIST
# The /backup directory is mounted as read-write for a short period of time, but is
# vulnerable to other users writing to it. see: http://www.mikerubel.org/computers/rsync_snapshots/
# /backup directory is remounted as read-only when the whole backup process is finished
#
# XXX: this script requires root access to execute (to remount)

# exit codes
ROOT_ACC_ERR=1
MOUNT_ERR=2

# binaries
ID=/usr/bin/id
RSYNC=/usr/bin/rsync

# vars
# partition for backup drive
MOUNT_DEV=/dev/sdb3
# backup drive directory
BACKUP_DIR=/backup
# ignorelist file, see gist
IGNORELIST=/var/tmp/ignorelist
# what to backup (/home/user/) instead of (/home/user) - there's a difference for rsync
SRC_DIR="/home/jiahong/"

# Check if script is run as root
# TODO: how about setting SUID instead of root
if (( `$ID -u` != 0 )); then
    echo "Root acess required"
    exit $ROOT_ACC_ERR
fi

# Remount backup directory as read and write
# Currently in readonly mode
mount -o remount,rw $MOUNT_DEV $BACKUP_DIR

if (( $? )); then
    echo "Error during remount, cannot remount to read-write mode"
    exit $MOUNT_ERR
fi

# -avz                  archive, compress, verbose
# --delete              delete all files not present in src
# --exclude-from        ignore files/dirs from ignorelist file
# --delete-excuded      delete also the files that are exluded
# $RSYNC -avz \
#     --delete \
#     --exclude-from="$IGNORELIST" \
#     --delete-excluded \
#     $SRC_DIR $BACKUP_DIR
$RSYNC -avz --delete --exclude-from="$IGNORELIST" --delete-excluded $SRC_DIR $BACKUP_DIR

# Remount backup directory as read only
mount -o remount,ro $MOUNT_DEV $BACKUP_DIR

if (( $? )); then
    echo "Error during remount, cannot remount to read only mode"
    exit $MOUNT_ERR
fi
