#!/usr/bin/env zsh
############################
# This script creates symlinks from the home directory to any desired dotfiles in $HOME/dotfiles
# And also installs MacOS Software
# And also installs Homebrew Packages and Casks (Apps)
# And also sets up VS Code
# And also sets up Sublime Text
############################

# dotfiles directory
dotfiledir="${HOME}/dotfilesCorey"

# list of files/folders to symlink in ${homedir}
files=(zshrc zprofile zprompt bashrc bash_profile bash_prompt aliases private functions)

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd "${dotfiledir}" || exit

# create symlinks (will overwrite old dotfiles)
for file in "${files[@]}"; do
    echo "Creating symlink to $file in home directory."
    ln -sf "${dotfiledir}/.${file}" "${HOME}/.${file}"
done

# Run the MacOS Script
./macOS.sh

# Install Powerline Meslo fonts
git clone https://github.com/powerline/fonts.git >/dev/null 2>&1
cd fonts && ./install.sh

cd $dotfiledir

# Run the Homebrew Script
pushd brew
./brew.sh
popd

# Run VS Code Script
./vscode.sh

echo "Installation Complete!"

echo "\nRestart Computer to apply changes."

echo "\nOpen apps from LaunchPad to add them to Spotlight."
