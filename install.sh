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
dotfiledir=$(dirname $(readlink -f "$0"))

# list of files/folders to symlink in ${homedir}
files=(zshrc aliases prompt_timer functions envt_vars plugins)

# create symlinks (will overwrite old dotfiles)
for file in "${files[@]}"; do
    echo "Creating symlink to $file in home directory."
    ln -sf "${dotfiledir}/.${file}" "${HOME}/.${file}"
done

pushd scripts
# Install OhMyZsh
source ./oh-my-zsh.sh
# Run the MacOS Script
source ./macOS.sh
popd

# Install Powerline Meslo fonts
echo "\n Installing Powerline fonts"
git clone https://github.com/powerline/fonts.git >/dev/null 2>&1
pushd fonts # Change working directory to fonts
./install.sh
popd # Working directory reverts to dotfiles directory
rm -rf fonts
echo "\n Finished installing Powerline fonts"

# Run the Homebrew Script
pushd brew # Change working directory to brew
./brew.sh
popd

# Run VS Code Script
pushd scripts
./vscode.sh
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
