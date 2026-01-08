# Quick Start Guide

## Initial Setup (First Time)

1. **Copy your existing dotfiles into the repository:**
   ```bash
   cd ~/dotfiles
   ./setup.sh
   ```

2. **Review and sanitize sensitive files:**
   ```bash
   # Edit the .Renviron file to mask API keys if sharing publicly
   open ~/dotfiles/r/.Renviron
   ```

3. **Initialize git repository:**
   ```bash
   cd ~/dotfiles
   git init
   git add .
   git commit -m "Initial dotfiles commit"
   ```

4. **Create symlinks (replaces your current dotfiles with symlinks):**
   ```bash
   ./install.sh
   ```

5. **Reload your shell:**
   ```bash
   source ~/.zshrc
   ```

## Using on a New Machine

1. **Clone your dotfiles repository:**
   ```bash
   git clone <your-repo-url> ~/dotfiles
   ```

2. **Run the installation script:**
   ```bash
   cd ~/dotfiles
   ./install.sh
   ```

3. **Copy your private .Renviron file (keep this secure):**
   ```bash
   # Copy from secure location
   cp /path/to/secure/.Renviron ~/dotfiles/r/.Renviron
   ```

4. **Reload your shell:**
   ```bash
   source ~/.zshrc
   ```

## Daily Workflow

### Making Changes
1. Edit files in `~/dotfiles/` directory
2. Changes take effect immediately (via symlinks)
3. Commit changes:
   ```bash
   cd ~/dotfiles
   git add .
   git commit -m "Update zsh configuration"
   git push
   ```

### Pulling Updates
```bash
cd ~/dotfiles
git pull
# Changes are automatically reflected via symlinks
```

## Troubleshooting

### Symlinks not working?
```bash
# Check if file is a symlink
ls -la ~/.zshrc

# Should show: .zshrc -> /Users/yourusername/dotfiles/zsh/.zshrc
```

### Need to restore originals?
```bash
cd ~/dotfiles
./uninstall.sh
```

### Want to create a backup before changes?
```bash
cd ~/dotfiles
./backup.sh
```

## Security Tips

1. **Never commit real API keys to public repos**
   - The `.gitignore` already excludes `.Renviron`
   - Use the `.Renviron.template` as a reference

2. **For private repos:**
   - You can include `.Renviron` if needed
   - Consider using git-crypt for extra security

3. **Alternative: Use a password manager**
   - Store sensitive configs in 1Password/LastPass
   - Keep only templates in the dotfiles repo
