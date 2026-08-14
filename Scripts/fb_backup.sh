#!/bin/bash

#=================================
# Author: Naresh
# Date: 14-08-2026
# Purpose: Create directories, copy project files, create a backup, compress the backup, store the archive
#================================

echo ""
PROJECT_DIR="$HOME/facebook/Projects"
BACKUP_DIR="$HOME/facebook/Backups"

DATE=$(date +%Y-%m-%d_%H-%M-%S)

echo "Backup Automation of Facebook"

echo "Creating backup directory"

mkdir -p  "$BACKUP_DIR"

echo "Copying project file"

TEMP_DIR="$BACKUP_DIR/project_$DATE"

mkdir -p "$TEMP_DIR"

cp -r "$PROJECT_DIR/"* "$TEMP_DIR/"

echo "Compressing backup"

tar -czf "$BACKUP_DIR/project_backup_$DATE.tar.gz" \
	-C "$BACKUP_DIR" "project_$DATE"

echo "removing temporary backup"

rm -rf "$TEMP_DIR"

echo "Backup Completed Successfully"

echo "Backup file"

echo "$BACKUP_DIR/project_backup_$DATE.tar.gz"
