#!/bin/bash

# Define org-notes folder
ORG_NOTES_DIR="$HOME/org-notes"

# Check if the directory exists
if [ ! -d "$ORG_NOTES_DIR" ]; then
  echo "Directory $ORG_NOTES_DIR does not exist. Nothing to delete."
  exit 1
fi

# Delete org-notes folder contents (files and subdirectories)
rm -rf "$ORG_NOTES_DIR"/*
rm -rf "$ORG_NOTES_DIR"/.* 2>/dev/null # To remove hidden files (e.g., .git, .org)
echo "Org notes contents deleted."

