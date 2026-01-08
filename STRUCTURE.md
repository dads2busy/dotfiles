# Dotfiles Repository Structure

```
~/dotfiles/
├── README.md                    # Main documentation
├── QUICKSTART.md               # Quick setup guide
├── .gitignore                  # Git ignore rules (excludes sensitive files)
│
├── setup.sh                    # Initial setup - copies your current dotfiles here
├── install.sh                  # Creates symlinks from ~ to dotfiles/
├── backup.sh                   # Creates timestamped backups
├── uninstall.sh               # Removes symlinks, restores originals
├── verify.sh                   # Checks if everything is set up correctly
├── make_executable.sh          # Makes all scripts executable
│
├── zsh/                        # Zsh shell configuration
│   ├── .zshrc                 # Main zsh config (Oh My Zsh, plugins, aliases)
│   └── .zprofile              # Shell profile (Homebrew, OrbStack)
│
├── git/                        # Git configuration
│   └── .gitconfig             # Git user settings
│
├── r/                          # R environment configuration
│   ├── .Renviron              # R environment variables (GITIGNORED)
│   └── .Renviron.template     # Template for .Renviron (safe to commit)
│
└── vim/                        # Vim configuration
    └── .vimrc                 # Vim settings (if you use vim)
```

## File Flow

### Before (scattered):
```
~/
├── .zshrc
├── .zprofile
├── .gitconfig
├── .Renviron
└── ... (many other dot files)
```

### After (organized):
```
~/
├── .zshrc          -> ~/dotfiles/zsh/.zshrc         (symlink)
├── .zprofile       -> ~/dotfiles/zsh/.zprofile      (symlink)
├── .gitconfig      -> ~/dotfiles/git/.gitconfig     (symlink)
├── .Renviron       -> ~/dotfiles/r/.Renviron        (symlink)
│
└── dotfiles/       (git repository)
    ├── zsh/
    ├── git/
    ├── r/
    └── ...
```

## Workflow

1. **Edit files in ~/dotfiles/** (actual files)
2. **Changes reflected immediately in ~/** (via symlinks)
3. **Commit & push** to backup/sync
4. **Pull on other machines** to stay in sync

## Security

- `.Renviron` contains API keys and is in `.gitignore`
- Use `.Renviron.template` as a reference for structure
- Keep sensitive configs out of public repos
