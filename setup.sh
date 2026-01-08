#!/usr/bin/env bash

###############################################################################
# Initial Setup Script
# Copies existing dotfiles into the repository structure
###############################################################################

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

DOTFILES_DIR="$HOME/dotfiles"

echo -e "${GREEN}Copying existing dotfiles into repository...${NC}\n"

# Copy zsh files
echo -e "${YELLOW}Copying Zsh configuration...${NC}"
cp "$HOME/.zshrc" "$DOTFILES_DIR/zsh/.zshrc"
cp "$HOME/.zprofile" "$DOTFILES_DIR/zsh/.zprofile"

# Copy git config
echo -e "${YELLOW}Copying Git configuration...${NC}"
cp "$HOME/.gitconfig" "$DOTFILES_DIR/git/.gitconfig"

# Copy R environment (but note it won't be committed)
if [ -f "$HOME/.Renviron" ]; then
    echo -e "${YELLOW}Copying R environment (will be gitignored)...${NC}"
    cp "$HOME/.Renviron" "$DOTFILES_DIR/r/.Renviron"
fi

# Copy vim config if exists
if [ -f "$HOME/.vimrc" ]; then
    echo -e "${YELLOW}Copying Vim configuration...${NC}"
    cp "$HOME/.vimrc" "$DOTFILES_DIR/vim/.vimrc"
fi

# Copy nano config if exists
if [ -f "$HOME/.nanorc" ]; then
    echo -e "${YELLOW}Copying Nano configuration...${NC}"
    mkdir -p "$DOTFILES_DIR/nano"
    cp "$HOME/.nanorc" "$DOTFILES_DIR/nano/.nanorc"
fi

# Make scripts executable
chmod +x "$DOTFILES_DIR/install.sh"
chmod +x "$DOTFILES_DIR/backup.sh"
chmod +x "$DOTFILES_DIR/uninstall.sh"
chmod +x "$DOTFILES_DIR/setup.sh"

echo -e "\n${GREEN}Setup complete!${NC}"
echo -e "${GREEN}Your dotfiles are now in: $DOTFILES_DIR${NC}\n"

echo -e "${YELLOW}Next steps:${NC}"
echo -e "1. Review the files in $DOTFILES_DIR"
echo -e "2. Edit $DOTFILES_DIR/r/.Renviron to remove or mask sensitive API keys"
echo -e "3. Run: cd $DOTFILES_DIR && git init"
echo -e "4. Run: git add ."
echo -e "5. Run: git commit -m 'Initial dotfiles commit'"
echo -e "6. Run: ./install.sh (to create symlinks)"
echo -e "7. Create a GitHub repo and push your dotfiles\n"
