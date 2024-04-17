#!/usr/bin/env zsh

# Define an array of formulae to install using Homebrew.
formulae=(
    "bash"
    "zsh"
    "git"
    "ripgrep"
    "tree"
    "node"
    "terraform"
    "neovim"
    "tmux"
    "rsync"
    "typescript"

    # disk usage apps
    "ncdu"
    "dust"

    # notify from command line
    "ntfy"

    # Extremely fast tool to remove dupes and other lint from your filesystem
    "rmlint"

    # Programmatically correct mistyped console commands
    "thefuck"

    # Simple, fast and user-friendly alternative to find
    "fd"

    # User-friendly cURL replacement (command-line HTTP client)
    "httpie"

    # JavaScript toolchain manager for reproducible environments
    "volta"

    # A simple terminal UI for both docker and docker-compose
    "lazydocker"

    # Better ls
    "eza"

    # Better cat
    "bat"

    # Run command when file changes
    "entr"

    # midnight commander - file manager
    # https://www.youtube.com/watch?v=fJOkuaihAek
    "midnight-commander"

    # Improved shell history
    "atuin"

    # Fuzzy find files
    "fzf"

    # Shell linter for sensitive info in commands
    "shellclear"

    # Safely delete files (trash)
    "safe-rm"

    # Help for command line tools
    "tldr"

    # Hashicorp Vault
    "hashicorp/tap/vault"

    # Better `ps`
    # https://www.youtube.com/watch?v=GBem9cpe7GM
    "procs"

    # docker image browser
    "dive"

    # smart most used directory tracker
    # type "j" and then a small part of the directory path
    "autojump"

    # Replacement of Make
    "just"

    # Unprotect pdfs
    # qpdf --decrypt --password=12345 encryptedfile.pdf output_file.pdf
    "qpdf"

    # Install Ansible
    "ansible"

    # Install mac desktop manager
    "koekeishiya/formulae/yabai"
    "yabai"
    "skhd"
)
