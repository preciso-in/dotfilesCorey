#!/usr/bin/env zsh

# Define an array of formulae to install using Homebrew.
formulae=(
    "bash"
    "watch"
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
    "jq"

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

    # Install r
    "r"

    # Install K8s ecosystem
    "minikube"
    "kubectl"
    "istioctl"
    "helm"
    "kubeshark"
    "openshift-cli"
    "stern"
    "helmfile"
    "teller"

    # Install GitHub cli
    "gh"

    # Load Generator
    # Replacement for apache bench
    "hey"

    # Cloudflare TLS/SSL CLI
    "cfssl"

    # Install Civo CLI
    # Should be installed after installing cask
    "civo"

    # Get linux text utilities like envsubst
    # ex. envsubst < ingress.yaml | kubectl apply -f -
    "gettext"

    # Get GNU-Sed because sed on Mac is finicky
    "gnu-sed"

    # Terminal file manager
    # Use ranger in place of joshuto for Linux
    "joshuto"
)

# Notes

# ShellClear - Removed
# Shell linter for sensitive info in commands
# shellclear is incompatible with atuin.  atuin does not store history in local history file.

# Volta - Removed
# Volta cannot be installed with brew.
# brew.sh does not list volta.
# Although `brew install volta` does not fail
