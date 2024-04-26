#!/usr/bin/env zsh

############################################################################################
############################################################################################
#                                                                                          #
# This script                                                                              #
#   - Creates Symlinks from the home directory to any desired dotfiles in $HOME/dotfiles   #
#   - Installs MacOS Dev Software & configurations                                         #
#   - Installs Homebrew Packages and Casks (Apps)                                          #
#   - Sets up VS Code                                                                      #
#                                                                                          #
############################################################################################
############################################################################################

# dotfiles directory
DOTFILES_DIR=$(dirname $(readlink -f "$0"))

# Symlink shell configuration files to $HOME
# Install oh-my-zsh
pushd $DOTFILES_DIR/shell_config
./link_dotfiles.sh
./install-oh-my-zsh.sh
popd
unset DOTFILES_DIR

# Install Software using Brew, Curl, etc.
pushd scripts
./install-software.sh
popd

pushd scripts
# Run the MacOS Script
source ./macOS.sh
popd

# Create VSCode Symlinks
pushd vscode
./vscode-symlinks.sh
./vscode-instructions.sh
popd

# Run Anki Addons Script
source ./settings/anki_addons.sh

# List Browser extensions
source ./settings/browser_extensions.sh

# Add the Homebrew zsh to allowed shells
echo "\nChanging default shell to Homebrew zsh"
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells >/dev/null
# Set the Homebrew zsh as default shell
chsh -s "$(brew --prefix)/bin/zsh"

pushd scripts
# Setup git on computer
source ./git-setup.sh
# Tidy up installations (vault...)
source ./tidy-up.sh
popd

echo "Installation Complete!"

echo "\nRestart Computer to apply changes."

echo "\nOpen apps from LaunchPad to add them to Spotlight."

#TODO: Refactor Curl & Terminal installations
#TODO: Refactor Display of configuration instructions into a new file
#TODO: Refactor new script that Starts services.
