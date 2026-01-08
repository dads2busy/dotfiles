#!/usr/bin/env bash

###############################################################################
# Dotfiles Installation Script
# This script creates symlinks from home directory to dotfiles repo
###############################################################################

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo -e "${GREEN}Starting dotfiles installation...${NC}\n"

# Create backup directory
mkdir -p "$BACKUP_DIR"
echo -e "${YELLOW}Backup directory created: $BACKUP_DIR${NC}\n"

# Function to backup and symlink
backup_and_link() {
    local source="$1"
    local target="$2"
    
    # Check if target exists
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo -e "${YELLOW}Backing up existing file: $target${NC}"
        mv "$target" "$BACKUP_DIR/"
    fi
    
    # Create symlink
    echo -e "${GREEN}Creating symlink: $target -> $source${NC}"
    ln -sf "$source" "$target"
}

# Zsh configuration
echo -e "\n${GREEN}=== Installing Zsh Configuration ===${NC}"
backup_and_link "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
backup_and_link "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"

# Git configuration
echo -e "\n${GREEN}=== Installing Git Configuration ===${NC}"
backup_and_link "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

# R configuration
echo -e "\n${GREEN}=== Installing R Configuration ===${NC}"
if [ -f "$DOTFILES_DIR/r/.Renviron" ]; then
    backup_and_link "$DOTFILES_DIR/r/.Renviron" "$HOME/.Renviron"
else
    echo -e "${YELLOW}Note: .Renviron not found (excluded from git for security)${NC}"
    echo -e "${YELLOW}If you have a .Renviron file, manually copy it to $DOTFILES_DIR/r/${NC}"
fi

# Vim configuration (if exists)
if [ -f "$DOTFILES_DIR/vim/.vimrc" ]; then
    echo -e "\n${GREEN}=== Installing Vim Configuration ===${NC}"
    backup_and_link "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"
fi

# Nano configuration (if exists)
if [ -f "$DOTFILES_DIR/nano/.nanorc" ]; then
    echo -e "\n${GREEN}=== Installing Nano Configuration ===${NC}"
    backup_and_link "$DOTFILES_DIR/nano/.nanorc" "$HOME/.nanorc"
fi

echo -e "\n${GREEN}==================================${NC}"
echo -e "${GREEN}Dotfiles installation complete!${NC}"
echo -e "${GREEN}==================================${NC}\n"

echo -e "${YELLOW}Backups saved to: $BACKUP_DIR${NC}"
echo -e "${YELLOW}Reload your shell configuration:${NC}"
echo -e "  ${GREEN}source ~/.zshrc${NC}\n"

# Check for Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${RED}Warning: Oh My Zsh is not installed!${NC}"
    echo -e "${YELLOW}Install it from: https://ohmyz.sh/${NC}\n"
fi

# Check for zsh-autosuggestions
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo -e "${YELLOW}Note: zsh-autosuggestions plugin not found${NC}"
    echo -e "${YELLOW}Install with:${NC}"
    echo -e "  git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions\n"
fi
