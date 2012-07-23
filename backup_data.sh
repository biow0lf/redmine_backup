#! /bin/sh

REDMINE_PATH="/home/user/work"
REDMINE_DIR="redmine-2.0.3"

# Backup Dest directory, change this if you have someother location
DEST="/home/user/backup"

# Main directory where backup will be stored
MBD="$DEST/redmine"

# Create backup directory
mkdir -p "$MBD"

# Get data in yyyymmdd format
DATE="$(date +"%Y%m%d")"

tar --directory="$REDMINE_PATH" -c -z --file="$MBD/redmine-data-$DATE.tar.gz" "$REDMINE_DIR"
