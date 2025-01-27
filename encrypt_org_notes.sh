#!/bin/bash

# Define paths
ORG_NOTES_DIR="$HOME/org-notes"
ENCRYPTED_DIR="$HOME/org-notes-utils/encrypted"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ENCRYPTED_FILE="org-notes_$TIMESTAMP.tar.gpg"

# Ensure GPG can interact with the terminal
export GPG_TTY=$(tty)

# Create encrypted directory if it doesn't exist
mkdir -p "$ENCRYPTED_DIR"

# Archive and encrypt org-notes directory with relative paths
echo "Starting encryption of $ORG_NOTES_DIR..."

# Archive and encrypt org-notes directory using relative paths (fixed)
tar -cvf - -C "$ORG_NOTES_DIR" . | gpg --symmetric --cipher-algo AES256 --output "$ENCRYPTED_DIR/$ENCRYPTED_FILE"

if [ $? -eq 0 ]; then
  echo "Encryption complete: $ENCRYPTED_DIR/$ENCRYPTED_FILE"
else
  echo "Encryption failed."
  exit 1
fi

