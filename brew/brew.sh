#!/usr/bin/env zsh

# Install Homebrew if it isn't already installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew not installed. Installing Homebrew."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Attempt to set up Homebrew PATH automatically for this session
    if [ -x "/opt/homebrew/bin/brew" ]; then
        # For Apple Silicon Macs
        echo "Configuring Homebrew in PATH for Apple Silicon Mac..."
        export PATH="/opt/homebrew/bin:$PATH"
    fi
else
    echo "Homebrew is already installed."
fi

# Verify brew is now accessible
if ! command -v brew &>/dev/null; then
    echo "Failed to configure Homebrew in PATH. Please add Homebrew to your PATH manually."
    exit 1
fi

# Update Homebrew and Upgrade any already-installed formulae
brew update
brew upgrade
brew upgrade --cask
brew cleanup

# Rust apps tap
brew tap rusty-ferris-club/tap # Needed for shellclear

# Define an array of formulae to install using Homebrew.
formulae=(
    "bash"
    "zsh"
    "git"
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
)

# Loop over the array to install each application.
for package in "${formulae[@]}"; do
    if brew list --formula | grep -q "^$package\$"; then
        echo "$package is already installed. Skipping..."
    else
        echo "Installing $package..."
        brew install "$package"
    fi
done

# Add the Homebrew zsh to allowed shells
echo "Changing default shell to Homebrew zsh"
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells >/dev/null
# Set the Homebrew zsh as default shell
chsh -s "$(brew --prefix)/bin/zsh"

# Git config name
echo "Please enter your FULL NAME for Git configuration:"
read git_user_name

# Git config email
echo "Please enter your EMAIL for Git configuration:"
read git_user_email

# Set my git credentials
$(brew --prefix)/bin/git config --global user.name "$git_user_name"
$(brew --prefix)/bin/git config --global user.email "$git_user_email"

# Install Prettier, which I use in both VS Code and Sublime Text
$(brew --prefix)/bin/npm install --global prettier

# Define an array of applications to install using Homebrew Cask.
cask_apps=(
    # Browsers
    "google-chrome"
    "firefox"
    "arc"
    "opera"

    # Terminals / SDKs / IDEs
    "warp"
    "google-cloud-sdk"
    "sourcetree"
    "visual-studio-code"
    "iterm2"
    "postman"

    # Media
    "vlc"
    "anki"
    "obsidian"
    "microsoft-onenote"
    "whatsapp"
    "microsoft-remote-desktop"

    # Virtualisation
    "utm"
    "docker"
)

# Loop over the array to install each application.
for app in "${cask_apps[@]}"; do
    if brew list --cask | grep -q "^$app\$"; then
        echo "$app is already installed. Skipping..."
    else
        echo "Installing $app..."
        brew install --cask "$app"
    fi
done

# Update and clean up again for safe measure
brew update
brew upgrade
brew upgrade --cask
brew cleanup
