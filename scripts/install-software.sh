#! /usr/bin/env zsh

echo -e "\nInstalling Xcode"
xcode-select --install

# Run the Homebrew Script
pushd ../brew # Change working directory to brew
./brew.sh
popd

# Install volta - JS Version Manager
curl https://get.volta.sh | bash

vault -autocomplete-install 2>/dev/null

# Install Powerline Meslo fonts
echo "\n Installing Powerline fonts"
git clone https://github.com/powerline/fonts.git >/dev/null 2>&1
pushd fonts # Change working directory to fonts
./install.sh
popd # Working directory reverts to dotfiles directory
rm -rf fonts
echo "\n Finished installing Powerline fonts"

./check-homebrew-path.sh

pushd ../vscode
./install-vscode-plugins.sh
popd
