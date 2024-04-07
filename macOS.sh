#!/usr/bin/env zsh

xcode-select --install

echo "Complete the installation of Xcode Command Line Tools before proceeding."
echo "Press enter to continue..."
read

echo "\nChanging MacOS settings for Scroll direction and Dock"
# Set scroll as traditional instead of natural
defaults write -g com.apple.swipescrolldirection -boolean NO && killall Finder

# Automatically hide dock
defaults write com.apple.dock autohide -bool true && killall Dock
