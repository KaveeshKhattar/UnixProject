#!/bin/bash

# Check if script is being run as root
if [[ $EUID -ne 0]]; then
    echo "This script is not being run as root"
    exit 1
fi

# Create a new user with a home directory and set password
new_username="newuser"
new_password="password123"
useradd -m "$new_username"

echo "$new_username: $new_password" | chpasswd

# Grant sudo access to new user
usermod -aG sudo "$new_usrename"