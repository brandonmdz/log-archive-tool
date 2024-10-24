#!/bin/bash

# Check if two arguments are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <log-directory> <destination-directory>"
  exit 1
fi

LOG_DIR=$1
DEST_DIR=$2

# Validate that the log directory exists
if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Log directory '$LOG_DIR' does not exist."
  exit 1
fi

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Create a timestamp for the archive name
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"

# Archive and compress the logs
tar -czf "${DEST_DIR}/${ARCHIVE_NAME}" -C "$LOG_DIR" .

# Check if the archive was successful
if [ $? -eq 0 ]; then
  echo "Logs archived successfully: ${DEST_DIR}/${ARCHIVE_NAME}"
  
  # Log the operation to an archive log file
  LOG_FILE="${DEST_DIR}/archive_log.txt"
  echo "[$(date)] Archived logs from $LOG_DIR to $ARCHIVE_NAME" >> "$LOG_FILE"
else
  echo "Error: Failed to archive logs."
  exit 1
fi
