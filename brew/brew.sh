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

./brew_taps.sh

source ./brew_formulae.sh

# Loop over the array to install each application.
count=0
for package in "${formulae[@]}"; do
    count=$((count + 1))
    echo "\nInstalling $package... $count/${#formulae[@]}"
    if brew list --formula | grep -q "^$package\$"; then
        echo "$package is already installed. Skipping...\n"
    else
        brew install "$package"
        echo "\n"
    fi
done
unset count

unset formulae

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

source ./brew_casks.sh

# Loop over the array to install each application.
count=0
for app in "${cask_apps[@]}"; do
    count=$((count + 1))
    echo "\nInstalling $app... $count/${#cask_apps[@]}"
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
