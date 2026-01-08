#!/usr/bin/env bash

###############################################################################
# Dotfiles Uninstall Script
# Removes symlinks and restores from most recent backup
###############################################################################

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${RED}WARNING: This will remove all dotfile symlinks${NC}"
echo -e "${YELLOW}Press Ctrl+C to cancel, or Enter to continue...${NC}"
read

# Find most recent backup
BACKUP_DIR=$(ls -dt "$HOME"/dotfiles_backup_* 2>/dev/null | head -1)

if [ -z "$BACKUP_DIR" ]; then
    echo -e "${RED}No backup directory found!${NC}"
    echo -e "${YELLOW}Proceeding anyway - files will just be removed${NC}\n"
fi

# List of symlinks to remove
files=(
    "$HOME/.zshrc"
    "$HOME/.zprofile"
    "$HOME/.gitconfig"
    "$HOME/.Renviron"
    "$HOME/.vimrc"
    "$HOME/.nanorc"
)

# Remove symlinks
for file in "${files[@]}"; do
    if [ -L "$file" ]; then
        echo -e "${YELLOW}Removing symlink: $file${NC}"
        rm "$file"
        
        # Restore from backup if available
        filename=$(basename "$file")
        if [ -f "$BACKUP_DIR/$filename" ]; then
            echo -e "${GREEN}Restoring from backup: $filename${NC}"
            cp "$BACKUP_DIR/$filename" "$file"
        fi
    fi
done

echo -e "\n${GREEN}Uninstall complete!${NC}"
if [ -n "$BACKUP_DIR" ]; then
    echo -e "${YELLOW}Original files restored from: $BACKUP_DIR${NC}\n"
fi
