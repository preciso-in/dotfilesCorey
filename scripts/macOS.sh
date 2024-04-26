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
