#!/bin/bash

# Define source and destination directories
source_dir="/path_to_src"
destination_dir="/path_to_dest"

# Create a backup directory
backup_dir="$destination_dir/$(date + '%Y%m%d%H%M%S')"
mkdir -p "$backup_dir"

# Copy files from source dir to backup dir
cp -R "$source_dir"/* "$backup_dir"

# Print success message
echo "Backup Completed Successfully"