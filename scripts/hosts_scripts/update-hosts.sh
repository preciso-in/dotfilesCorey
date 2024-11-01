#! /usr/bin/env zsh

# Check if Docker is running
if ! docker info &>/dev/null; then
  echo "Docker is not running. Starting Docker..."
  # Start Docker
  if [ "$(uname)" = "Darwin" ]; then
    # On macOS, use the Docker Desktop app
    open -a Docker
  else
    # On Linux, use the systemctl command
    sudo systemctl start docker
  fi

  # Wait for Docker to start
  while ! docker info &>/dev/null; do
    echo "Waiting for Docker to start..."
    sleep 1
  done
  echo "Docker is now running."
else
  echo "Docker is already running."
fi

# Add Adblock hosts file to OS
SCRIPT_DIR=$(dirname $(readlink -f "$0"))
DOTFILES_DIR=$(dirname $SCRIPT_DIR)

sudo unlink /etc/hosts
sudo rm /etc/hosts

rm hosts
rm downloaded-hosts
touch hosts
touch downloaded-hosts

# Create hosts file from Steven Black's project
docker run \
  --pull always \
  --platform linux/x86_64 \
  --rm \
  -it \
  -v $DOTFILES_DIR/MacOS/downloaded-hosts:/etc/hosts \
  ghcr.io/stevenblack/hosts:latest updateHostsFile.py \
  --auto \
  --replace \
  --extensions gambling porn fakenews

cat downloaded-hosts >>hosts

echo "\n\n" >>hosts

cat add_host_entries >>hosts
sed -i '' '/reddit/d' hosts
sed -i '' '/redd.it/d' hosts
sed -i '' '/googleapis/d' hosts
sed -i '' '/gstatic/d' hosts

sudo cp hosts /etc/hosts

rm downloaded-hosts
rm hosts

unset DOTFILES_DIR
unset SCRIPT_DIR

sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder
