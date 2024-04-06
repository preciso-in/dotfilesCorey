#!/usr/bin/env zsh

############################################################################################
############################################################################################
#                                                                                          #
# This script                                                                              #
#   - creates symlinks from the home directory to any desired dotfiles in $HOME/dotfiles   #
#   - installs MacOS Dev Software & configurations                                         #
#   - installs Homebrew Packages and Casks (Apps)                                          #
#   - sets up VS Code                                                                      #
#                                                                                          #
############################################################################################
############################################################################################

# dotfiles directory
dotfiledir=$(pwd)

# list of files/folders to symlink in ${homedir}
# files=(zshrc zprofile zprompt bashrc bash_profile bash_prompt aliases private functions)
files=(zshrc aliases functions envt_vars)

# create symlinks (will overwrite old dotfiles)
for file in "${files[@]}"; do
    echo "Creating symlink to $file in home directory."
    ln -sf "${dotfiledir}/.${file}" "${HOME}/.${file}"
done

# Run the MacOS Script
./macOS.sh

# Install Powerline Meslo fonts
git clone https://github.com/powerline/fonts.git >/dev/null 2>&1
pushd fonts # Change working directory to fonts
./install.sh
popd # Working directory reverts to dotfiles directory
rm -rf fonts

# Run the Homebrew Script
pushd brew # Change working directory to brew
./brew.sh
popd

# Run VS Code Script
./vscode.sh

# Run Anki Addons Script
sudo chmod u+x ./settings/anki_addons.sh
./settings/anki_addons.sh
printf "Press enter to continue"
read

echo "Installation Complete!"

echo "\nRestart Computer to apply changes."

echo "\nOpen apps from LaunchPad to add them to Spotlight."
