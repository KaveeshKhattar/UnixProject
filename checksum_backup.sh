#!/bin/bash

# Function to calculate checksum
calculate_checksum(){
    file="$1"
    md5sum "$file" | awk '{print $1}'
}

# Function to sync files
sync_files_with_checksum(){
    source_path="$1"
    destination_path="$2"
    remote_user="$3"
    remote_host="$4"

    # Calculate checksum of source files
    source_checksums="$(mktemp)"
    find "$source_path" -type -f -exec md5sum {} + > "$source_checksums"

    # Perform sync
    rsync -avzc -e "ssh" --checksum --files-from="$source_checksums" "$source_path" "$remote_user@$remote_host: $destination_path"

    # Remove the temporary checksum file
    rm "$source_checksums"

    # Print message
    echo "Files synced"
}

read -p "Enter the source path: " source_path
read -p "Enter the destination path: " destination_path
read -p "Enter the remote username: " remote_user
read -p "Enter the remote host: " remote_host

sync_files_with_checksum "$source_path" "$destination_path" "$remote_user" "$remote_host"