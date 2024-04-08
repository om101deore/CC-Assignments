#!/bin/bash

# MySQL database credentials
DB_USER="your_username"
DB_PASS="your_password"
DB_NAME="your_database_name"

# Backup directory
BACKUP_DIR="/path/to/backup/directory"

# Date format for backup file
DATE=$(date +"%Y%m%d_%H%M%S")

# Dump the MySQL database
mysqldump -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" > "${BACKUP_DIR}/${DB_NAME}_${DATE}.sql"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "MySQL database backup completed successfully."
else
    echo "Error: MySQL database backup failed."
fi

