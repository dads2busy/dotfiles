#!/usr/bin/env bash

###############################################################################
# Dotfiles Verification Script
# Checks if everything is set up correctly
###############################################################################

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Verifying dotfiles setup...${NC}\n"

# Check if dotfiles directory exists
if [ -d "$HOME/dotfiles" ]; then
    echo -e "${GREEN}✓${NC} Dotfiles directory exists"
else
    echo -e "${RED}✗${NC} Dotfiles directory not found"
    exit 1
fi

# Check if git repo is initialized
if [ -d "$HOME/dotfiles/.git" ]; then
    echo -e "${GREEN}✓${NC} Git repository initialized"
else
    echo -e "${YELLOW}⚠${NC} Git repository not initialized (run: git init)"
fi

# Check symlinks
echo -e "\n${YELLOW}Checking symlinks:${NC}"

files=(
    ".zshrc:zsh/.zshrc"
    ".zprofile:zsh/.zprofile"
    ".gitconfig:git/.gitconfig"
)

for item in "${files[@]}"; do
    IFS=':' read -r home_file repo_file <<< "$item"
    if [ -L "$HOME/$home_file" ]; then
        target=$(readlink "$HOME/$home_file")
        if [[ "$target" == *"dotfiles/$repo_file" ]]; then
            echo -e "${GREEN}✓${NC} $home_file is correctly linked"
        else
            echo -e "${YELLOW}⚠${NC} $home_file is a symlink but points to: $target"
        fi
    elif [ -f "$HOME/$home_file" ]; then
        echo -e "${YELLOW}⚠${NC} $home_file exists but is not a symlink"
    else
        echo -e "${RED}✗${NC} $home_file not found"
    fi
done

# Check if files exist in repo
echo -e "\n${YELLOW}Checking repository files:${NC}"

repo_files=(
    "zsh/.zshrc"
    "zsh/.zprofile"
    "git/.gitconfig"
    "README.md"
    ".gitignore"
    "install.sh"
)

for file in "${repo_files[@]}"; do
    if [ -f "$HOME/dotfiles/$file" ]; then
        echo -e "${GREEN}✓${NC} $file exists"
    else
        echo -e "${RED}✗${NC} $file missing"
    fi
done

# Check script permissions
echo -e "\n${YELLOW}Checking script permissions:${NC}"

scripts=(
    "install.sh"
    "backup.sh"
    "uninstall.sh"
    "setup.sh"
    "verify.sh"
)

for script in "${scripts[@]}"; do
    if [ -x "$HOME/dotfiles/$script" ]; then
        echo -e "${GREEN}✓${NC} $script is executable"
    elif [ -f "$HOME/dotfiles/$script" ]; then
        echo -e "${YELLOW}⚠${NC} $script exists but is not executable (run: chmod +x $script)"
    fi
done

# Check Oh My Zsh
echo -e "\n${YELLOW}Checking dependencies:${NC}"

if [ -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${GREEN}✓${NC} Oh My Zsh installed"
else
    echo -e "${YELLOW}⚠${NC} Oh My Zsh not installed"
fi

if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo -e "${GREEN}✓${NC} zsh-autosuggestions plugin installed"
else
    echo -e "${YELLOW}⚠${NC} zsh-autosuggestions plugin not installed"
fi

echo -e "\n${GREEN}Verification complete!${NC}\n"
