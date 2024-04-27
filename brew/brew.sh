#!/usr/bin/env zsh

echo -e "\nInstalling Homebrew"

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

source ./brew_taps.sh

source ./brew_formulae.sh

# Loop over the array to install each application.
count=0
for package in "${formulae[@]}"; do
    count=$((count + 1))
    echo "\nInstalling brew formula $package... $count/${#formulae[@]}"
    if brew list --formula | grep -q "^$package\$"; then
        echo "$package is already installed. Skipping...\n"
    else
        brew install "$package"
        echo "\n"
    fi
done
unset count
unset formulae

echo "\n\nInstalled brew formulae\n\n"

# Install Prettier, which I use in both VS Code and Sublime Text
$(brew --prefix)/bin/npm install --global prettier

source ./brew_casks.sh

# Loop over the array to install each application.
count=0
for app in "${cask_apps[@]}"; do
    count=$((count + 1))
    echo "\nInstalling brew cask $app... $count/${#cask_apps[@]}"
    if brew list --cask | grep -q "^$app\$"; then
        echo "$app is already installed. Skipping...\n"
    else
        brew install --cask "$app"
        echo "\n"
    fi
done
unset count
unset cask_apps

# Update and clean up again for safe measure
brew update
brew upgrade
brew upgrade --cask
brew cleanup
