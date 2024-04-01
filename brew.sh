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

# Define an array of packages to install using Homebrew.
packages=(
    "bash"
    "zsh"
    "git"
    "tree"
    "node"
    "neovim"
    "tmux"
    "rsync"

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
)

# Loop over the array to install each application.
for package in "${packages[@]}"; do
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

# Create the tutorial virtual environment I use frequently
$(brew --prefix)/bin/python3 -m venv "${HOME}/tutorial"

# Install Prettier, which I use in both VS Code and Sublime Text
$(brew --prefix)/bin/npm install --global prettier

# Define an array of applications to install using Homebrew Cask.
apps=(
    "google-chrome"
    "firefox"
    "arc"
    "opera"
    "visual-studio-code"
    "vlc"
    "postman"
    "anki"
    "warp"
    "whatsapp"
    "microsoft-remote-desktop"
    "obsidian"
    "sourcetree"
    "docker"
    "google-cloud-sdk"
    "iterm2"
)

# Loop over the array to install each application.
for app in "${apps[@]}"; do
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
