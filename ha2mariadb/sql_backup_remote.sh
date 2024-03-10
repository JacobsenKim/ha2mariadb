#!/bin/bash
# v.1.0.0
# Domain: https://github.com/JacobsenKim/ha2mariadb
# Wiki: https://github.com/JacobsenKim/ha2mariadb/wiki
# Discussions: https://github.com/JacobsenKim/ha2mariadb/discussions
#
######################################################
# Create the ~/.backup directory if it doesn't exist
#
# $ mkdir -p ~/.backup
#
# Copy the script file to the ~/.backup directory
#
# $ cp sql_backup_remote.sh ~/.backup/sql_backup_remote.sh
#
# You can schedule the script to run daily at 02:00 using cron. Add the following line to your crontab:
#
# $ crontab -e
#
# 0 2 * * * $HOME/.backup/sql_backup_remote.sh
#
# So the script can run
#
# $ chmod +x sql_backup_remote.sh
#
# Run the script like this:
#
# $ ./sql_backup_remote.sh
########################################################

# MySQL connection parameters
MYSQL_USER="homeassistant" # <-------------- Edit this line.
MYSQL_HOST="192.168.0.76" # <-------------- Edit this line.
MYSQL_DB="homeassistant" # <-------------- Edit this line.
MYSQL_CHARSET="utf8mb4" # <-------------- Edit this line.
MYSQL_PASSWORD="PASSWORD" # <-------------- Edit this line.
DATE="$(date +"%Y-%m-%d_%H-%M-%S")"

# Directory containing the SQL backup files
SQL_BACKUP_DIR="/media/20TB1/backup/rsync/homeassistant_sql" # change the path to where you want the backup file.

# Log file
LOG_FILE="$SQL_BACKUP_DIR/$MYSQL_HOST-sql_backup_remote.log"

# Function to log messages
log_message() {
    local log_dir=$(dirname "$LOG_FILE")
    if [ ! -d "$log_dir" ]; then
        mkdir -p "$log_dir"
    fi
    echo "$(date +"%Y-%m-%d %H:%M:%S") $1" >> "$LOG_FILE"
}

# Backup function
backup_database() {
    log_message "Starting backup process"
    FILENAME="$MYSQL_HOST-$MYSQL_DB-$DATE.sql"
    mysqldump -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" --default-character-set="$MYSQL_CHARSET" "$MYSQL_DB" > "$SQL_BACKUP_DIR/$FILENAME"
    if [ $? -eq 0 ]; then
        log_message "Backup completed successfully"
        gzip "$SQL_BACKUP_DIR/$FILENAME" # Zip the SQL file
#        rm "$SQL_BACKUP_DIR/$FILENAME" # Remove the original SQL file
        log_message "SQL file zipped and removed successfully"
    else
        log_message "Backup failed"
    fi
}


# Main script
log_message "Backup script started"
if [ -z "$MYSQL_HOST" ]; then
    log_message "Error: MySQL host not provided"
    exit 1
fi

# Check if backup directory exists, if not create it
if [ ! -d "$SQL_BACKUP_DIR" ]; then
    mkdir -p "$SQL_BACKUP_DIR"
fi

backup_database

log_message "Backup script finished"
