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

# Install Software using Brew, Curl, etc.
pushd $DOTFILES_DIR/scripts
./install-software.sh
popd

# Create Configurations
pushd $DOTFILES_DIR/scripts
./create-configuration.sh
popd

# Start Services
pushd $DOTFILES_DIR/scripts
source ./start-services.sh
popd

# Prompt user to login to VSCode extensions
pushd $DOTFILES_DIR/vscode
./vscode-instructions.sh
popd

# Run Anki Addons Script
source $DOTFILES_DIR/settings/anki_addons.sh

# List Browser extensions
source $DOTFILES_DIR/settings/browser_extensions.sh

echo "Installation Complete!"

echo "\nRestart Computer to apply changes."

echo "\nOpen apps from LaunchPad to add them to Spotlight."

unset DOTFILES_DIR
