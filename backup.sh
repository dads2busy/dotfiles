#!/usr/bin/env bash

###############################################################################
# Dotfiles Backup Script
# Creates timestamped backups of current dotfiles
###############################################################################

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo -e "${GREEN}Creating backup of dotfiles...${NC}\n"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# List of files to backup
files=(
    ".zshrc"
    ".zprofile"
    ".gitconfig"
    ".Renviron"
    ".vimrc"
    ".nanorc"
    ".bash_profile"
)

# Backup each file if it exists
for file in "${files[@]}"; do
    if [ -f "$HOME/$file" ]; then
        echo -e "${YELLOW}Backing up: $file${NC}"
        cp "$HOME/$file" "$BACKUP_DIR/"
    fi
done

echo -e "\n${GREEN}Backup complete!${NC}"
echo -e "${GREEN}Location: $BACKUP_DIR${NC}\n"
