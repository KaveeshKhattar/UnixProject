#!/bin/bash

# Function
perform_incremental_backup(){
    source_dir="$1"
    backup_dir="$2"

    # Create backup directories
    mkdir -p "$backup_dir"
    mkdir -p "$backup_dir/daily"

    # Perform incremental backup using rsnapshot
    rsnapshot -c rsnapshot.conf daily

    # Print success image
    echo "Incremental backup performed"
}

read -p "Enter source directory: " source_dir
read -p "Enter backup directory: " backup_dir

perform_incremental_backup "$source_dir" "$backup_dir"