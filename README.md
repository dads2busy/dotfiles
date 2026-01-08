# Dotfiles

My personal configuration files for macOS development environment.

## Contents

- **zsh/**: Zsh shell configuration
  - `.zshrc` - Main zsh configuration with Oh My Zsh
  - `.zprofile` - Shell profile (Homebrew, OrbStack)
- **git/**: Git configuration
  - `.gitconfig` - Git user settings
- **r/**: R environment configuration
  - `.Renviron` - R environment variables (API keys, paths)
- **vim/**: Vim editor configuration
  - `.vimrc` - Vim settings (if used)

## Installation

### Quick Setup (Automated)

Run the install script to set up all configurations:

```bash
cd ~/dotfiles
./install.sh
```

This will:
1. Back up existing configurations
2. Create symlinks from your home directory to the dotfiles repo
3. Set appropriate permissions

### Manual Setup

If you prefer to install specific configurations:

```bash
# Zsh
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.zprofile ~/.zprofile

# Git
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig

# R
ln -sf ~/dotfiles/r/.Renviron ~/.Renviron

# Vim
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
```

## Dependencies

- **Zsh** with [Oh My Zsh](https://ohmyz.sh/)
- **Homebrew** - macOS package manager
- **Git**
- **R** (optional, for R configurations)
- **OrbStack** (optional, for container management)

### Zsh Plugins

The following Oh My Zsh plugins are used:
- `git` - Git aliases and functions
- `brew` - Homebrew completion
- `aliases` - Alias management
- `zsh-autosuggestions` - Command suggestions (install separately)

To install zsh-autosuggestions:
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## Features

### Zsh Configuration
- Clean theme
- Zed editor as default
- Custom file type aliases (opens files in Zed)
- Homebrew integration
- OrbStack integration
- Custom notes integration via `~/.zsh/notes.zsh`

### Git Configuration
- User name and email setup
- (Add more git aliases and settings as needed)

### R Environment
- Custom library path
- API keys for various services (Census, GitHub, Google, etc.)
- Custom temp directories for large data operations

## Security Notes

⚠️ **Important**: The `.Renviron` file contains API keys and credentials. 

**Before pushing to a public repository:**
1. Review the `.gitignore` to ensure sensitive files are excluded
2. Consider using environment-specific configurations
3. Use a secrets manager for production environments
4. Never commit real API keys to public repositories

For this repository, `.Renviron` is included in `.gitignore` by default.

## Customization

### Adding New Configurations

1. Create a new directory for the tool/application
2. Move the config file to that directory
3. Update the `install.sh` script to create the symlink
4. Update this README

### Updating Configurations

Simply edit the files in the dotfiles directory. Changes are immediately reflected via symlinks.

## Backup

Before making major changes:

```bash
./backup.sh
```

This creates timestamped backups in `~/dotfiles_backup/`.

## Uninstall

To remove all symlinks and restore original files:

```bash
./uninstall.sh
```

## Repository Setup

Initialize git repository:

```bash
cd ~/dotfiles
git init
git add .
git commit -m "Initial dotfiles commit"
```

Connect to remote repository:

```bash
git remote add origin <your-repo-url>
git push -u origin main
```

## References

- [Oh My Zsh Documentation](https://github.com/ohmyzsh/ohmyzsh/wiki)
- [Dotfiles Best Practices](https://dotfiles.github.io/)
- [GNU Stow](https://www.gnu.org/software/stow/) - Alternative symlink management

## License

Personal use only.
