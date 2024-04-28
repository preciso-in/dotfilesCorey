#!/usr/bin/env zsh

echo "\nChanging MacOS settings for Scroll direction and Dock"
# Set scroll as traditional instead of natural
defaults write -g com.apple.swipescrolldirection -boolean NO && killall Finder

# Automatically hide dock
defaults write com.apple.dock autohide -bool true && killall Dock

# Disable Spotlight indexing of External Drive
printf "\n\n\nConnect PortableSSD to computer to disable spotlight indexing on it."
diskutil list
printf "\n Press Enter when done"
read
sudo mdutil -i off -d /Volumes/PortableSSD/

# Add Adblock hosts file to OS
SCRIPT_DIR=$(dirname $(readlink -f "$0"))
DOTFILES_DIR=$(dirname $SCRIPT_DIR)
echo $DOTFILES_DIR
sudo cp $DOTFILES_DIR/MacOS/hosts /etc/hosts
unset DOTFILES_DIR
unset SCRIPT_DIR
