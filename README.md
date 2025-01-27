# Auto-Encrypt Org Notes Utility

This utility helps manage, encrypt, decrypt, and securely delete your Org Notes using a set of simple shell scripts. It automates the process of encrypting and decrypting your sensitive files, ensuring your data remains secure.

## Prerequisites

1. **GPG**: Ensure GPG is installed on your system.
   - Install using `sudo apt install gnupg` (on Ubuntu-based systems) or the equivalent for your distribution.

2. **Bash**: The scripts are written in Bash, so ensure you have a Bash-compatible shell available.

3. **Directory Structure**:
   - `$HOME/org-notes`: The directory where your Org Notes are stored.
   - `$HOME/org-notes-utils/encrypted`: The directory where encrypted backups are stored.

---

## Scripts Overview

### 1. `encrypt_org_notes.sh`
This script archives and encrypts the contents of your `org-notes` directory and stores the encrypted file in the `encrypted` directory.

#### Usage:
```bash
./encrypt_org_notes.sh
```

#### What It Does:
- Archives the contents of `$HOME/org-notes` using `tar`.
- Encrypts the archive using GPG with AES256 encryption.
- Saves the encrypted file with a timestamped name (e.g., `org-notes_2025-01-27_15-30-00.tar.gpg`) in `$HOME/org-notes-utils/encrypted`.

---

### 2. `decrypt_org_notes.sh`
This script decrypts the most recent encrypted file and extracts its contents to the `org-notes` directory.

#### Usage:
```bash
./decrypt_org_notes.sh
```

#### What It Does:
- Finds the most recently created `.tar.gpg` file in `$HOME/org-notes-utils/encrypted`.
- Decrypts the file and extracts its contents into `$HOME/org-notes`.

---

### 3. `delete_org_notes.sh`
This script securely deletes the contents of the `org-notes` directory, including hidden files and subdirectories.

#### Usage:
```bash
./delete_org_notes.sh
```

#### What It Does:
- Removes all files and subdirectories in `$HOME/org-notes`, including hidden files (e.g., `.git` or `.org`).
- Ensures the directory is clean and ready for new data or restoration.

---

## Notes

- Make sure you remember the passphrase used for encryption and decryption. Losing it will render the encrypted files inaccessible.
- Always ensure the `encrypted` directory is backed up securely to avoid data loss.
- The `delete_org_notes.sh` script is irreversible; ensure backups are in place before running it.
