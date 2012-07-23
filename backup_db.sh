#! /bin/sh
# home: https://github.com/biow0lf/redmine_backup
# based on http://bash.cyberciti.biz/backup/backup-mysql-database-server-2/

MYSQLUSER="user"         # MySQL user name
MYSQLPASSWORD="password" # MySQL user password
MYSQLHOST="localhost"    # Hostname where is MySQL

# Linux bin paths, change this if it can not be autodetected via which command
MYSQLDUMP="$(which mysqldump)"
GZIP="$(which gzip)"

# Backup Dest directory, change this if you have someother location
DEST="/home/user/backup"

# Main directory where backup will be stored
MBD="$DEST/redmine"

# Create backup directory
mkdir -p "$MBD"

# Get hostname
HOST="$(hostname)"

# Get data in yyyymmdd format
DATE="$(date +"%Y%m%d")"

# File to store current backup file
FILE=""

# Store list of databases
DBS="redmine_production"

for db in $DBS
do
    FILE="$MBD/$db.$HOST.$DATE.gz"
    # do all inone job in pipe,
    # connect to mysql using mysqldump for select mysql database
    # and pipe it out to gz file in backup dir :)
    $MYSQLDUMP -u $MYSQLUSER -h $MYSQLHOST -p$MYSQLPASSWORD $db | $GZIP -9 > $FILE
done
