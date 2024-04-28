#!/usr/bin/env zsh

open -a Docker
sleep 3

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

sudo unlink /etc/hosts
sudo rm /etc/hosts

pushd ../MacOS
rm hosts
touch hosts

# Create hosts file from Steven Black's project
sudo docker run \
  --pull always \
  --platform linux/x86_64 \
  --rm \
  -it \
  -v $DOTFILES_DIR/MacOS/hosts:/etc/hosts \
  ghcr.io/stevenblack/hosts:latest updateHostsFile.py \
  --auto \
  --replace \
  --extensions gambling porn fakenews social

echo "\n\n" >>hosts

cat new_host_entries >>hosts
popd

sudo cp $DOTFILES_DIR/MacOS/hosts /etc/hosts

unset DOTFILES_DIR
unset SCRIPT_DIR
