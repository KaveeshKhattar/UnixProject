#!/bin/bash

# Define log file path
log_file="/path_to_logfile.log"

# Count occurences of errors in log files
error_counts=$(grep -o "ERROR" "$log_file" | wc -l)

# Print the error count
echo "Error Count: $error_counts"