#!/usr/bin/env bash

###############################################################################
# DOTFILES SETUP - NEXT STEPS
###############################################################################

cat << 'EOF'

╔════════════════════════════════════════════════════════════════════╗
║                   DOTFILES REPOSITORY CREATED!                      ║
╚════════════════════════════════════════════════════════════════════╝

📁 Location: ~/dotfiles

Your dotfiles repository has been created with the following structure:

  📄 Documentation
     • README.md         - Complete documentation
     • QUICKSTART.md     - Quick setup guide  
     • STRUCTURE.md      - Directory structure overview

  🔧 Scripts
     • setup.sh          - Copy existing configs to repo
     • install.sh        - Create symlinks (replaces current configs)
     • backup.sh         - Create timestamped backups
     • uninstall.sh      - Remove symlinks, restore originals
     • verify.sh         - Check if everything is working
     • make_executable.sh - Make all scripts executable

  📂 Configuration Directories
     • zsh/              - Zsh configuration
     • git/              - Git configuration  
     • r/                - R environment (with API key template)
     • vim/              - Vim configuration

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

NEXT STEPS:

1️⃣  Make scripts executable:
    cd ~/dotfiles
    bash make_executable.sh

2️⃣  Copy your current dotfiles into the repository:
    ./setup.sh

3️⃣  Review and sanitize sensitive data:
    # Edit .Renviron to remove real API keys if sharing publicly
    open ~/dotfiles/r/.Renviron
    
    # Or use the template instead:
    cp ~/dotfiles/r/.Renviron.template ~/dotfiles/r/.Renviron

4️⃣  Initialize git repository:
    git init
    git add .
    git commit -m "Initial dotfiles commit"

5️⃣  (Optional) Connect to GitHub:
    # Create a new repo on GitHub first, then:
    git remote add origin https://github.com/yourusername/dotfiles.git
    git branch -M main
    git push -u origin main

6️⃣  Create symlinks (this replaces your current dotfiles):
    ./install.sh

7️⃣  Reload your shell:
    source ~/.zshrc

8️⃣  Verify everything is working:
    ./verify.sh

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚠️  IMPORTANT SECURITY NOTES:

• Your .Renviron file contains API keys and credentials
• This file is already in .gitignore and won't be committed
• Use .Renviron.template to show structure without exposing keys
• For private repos: you can include .Renviron if needed
• For public repos: NEVER commit real API keys

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 DOCUMENTATION:

• Full guide:       cat ~/dotfiles/README.md
• Quick start:      cat ~/dotfiles/QUICKSTART.md  
• Structure:        cat ~/dotfiles/STRUCTURE.md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Ready to begin? Run:
    cd ~/dotfiles && bash make_executable.sh && ./setup.sh

EOF
