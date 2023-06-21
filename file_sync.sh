#!/bin/bash

sync_files() {
    source_path="$1"
    destination_path="$2"
    remote_user="$3"
    remote_host="$4"

    # Performing sync
    rsync -avz -e "ssh" "$source_path" "$remote_user@$remote_host:$destination_path"

    # Print message
    echo "Files synced"
}

read -p "Enter the source path: " source_path
read -p "Enter the destination path: " destination_path
read -p "Enter the remote username: " remote_user
read -p "Enter the remote host: " remote_host

sync_files "$source_path" "$destination_path" "$remote_user" "$remote_host"