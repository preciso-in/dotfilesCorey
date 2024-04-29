#! /usr/bin/env zsh

# Add Adblock hosts file to OS
SCRIPT_DIR=$(dirname $(readlink -f "$0"))
DOTFILES_DIR=$(dirname $SCRIPT_DIR)

sudo unlink /etc/hosts
sudo rm /etc/hosts

pushd ../MacOS
rm hosts
rm downloaded-hosts
touch hosts
touch downloaded-hosts

# Create hosts file from Steven Black's project
sudo docker run \
  --pull always \
  --platform linux/x86_64 \
  --rm \
  -it \
  -v $DOTFILES_DIR/MacOS/downloaded-hosts:/etc/hosts \
  ghcr.io/stevenblack/hosts:latest updateHostsFile.py \
  --auto \
  --replace \
  --extensions gambling porn fakenews social

cat downloaded-hosts >>hosts

echo "\n\n" >>hosts

cat new_host_entries >>hosts

sudo cp hosts /etc/hosts

rm downloaded-hosts
rm hosts

popd

unset DOTFILES_DIR
unset SCRIPT_DIR
