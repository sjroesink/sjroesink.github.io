#!/bin/bash

# Sander Roesink's SSH Key Authorization Script
# This script adds my public SSH key to your authorized_keys file

set -e

# Define the SSH key
SSH_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJowiiOcgQV7Je9F1LABgXMvxae/b/CKgjiPjRsNba0b Sander Roesink SSH Key"

# Define paths
SSH_DIR="$HOME/.ssh"
AUTH_KEYS="$SSH_DIR/authorized_keys"

echo "==> Adding Sander Roesink's SSH key to authorized_keys..."

# Create .ssh directory if it doesn't exist
if [ ! -d "$SSH_DIR" ]; then
    echo "    Creating $SSH_DIR directory..."
    mkdir -p "$SSH_DIR"
    chmod 700 "$SSH_DIR"
fi

# Create authorized_keys if it doesn't exist
if [ ! -f "$AUTH_KEYS" ]; then
    echo "    Creating authorized_keys file..."
    touch "$AUTH_KEYS"
    chmod 600 "$AUTH_KEYS"
fi

# Check if key already exists
if grep -q "$(echo "$SSH_KEY" | awk '{print $2}')" "$AUTH_KEYS" 2>/dev/null; then
    echo "    Key already exists in authorized_keys. Nothing to do."
else
    echo "    Adding key to authorized_keys..."
    echo "$SSH_KEY" >> "$AUTH_KEYS"
    chmod 600 "$AUTH_KEYS"
    echo "    ✓ Key added successfully!"
fi

echo "==> Done! SSH access granted to Sander Roesink."
