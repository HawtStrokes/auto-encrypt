#!/bin/bash

# Define paths
ENCRYPTED_DIR="$HOME/org-notes-utils/encrypted"
ORG_NOTES_DIR="$HOME/org-notes"

# Get the most recent encrypted file
ENCRYPTED_FILE=$(ls -t "$ENCRYPTED_DIR"/*.tar.gpg | head -n 1)

# Ensure GPG can interact with the terminal
export GPG_TTY=$(tty)

# Check if an encrypted file exists
if [ -z "$ENCRYPTED_FILE" ]; then
  echo "No encrypted files found in $ENCRYPTED_DIR. Exiting."
  exit 1
fi

echo "Found encrypted file: $ENCRYPTED_FILE"

# Decrypt and extract the encrypted file
echo "Starting decryption and extraction..."

gpg --decrypt --output - "$ENCRYPTED_FILE" | tar -xvf - -C "$ORG_NOTES_DIR"

if [ $? -eq 0 ]; then
  echo "Decryption complete: Org notes restored in $ORG_NOTES_DIR."
else
  echo "Decryption failed. Please check your passphrase or the encrypted file."
  exit 1
fi

