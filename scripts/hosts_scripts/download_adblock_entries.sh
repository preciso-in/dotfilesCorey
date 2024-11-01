################################################################################
#                                                                              #
# This script checks if Docker is running on the local system                  #
# If Docker is not running, it starts Docker                                   #
#                                                                              #
# Also, it generates the new hosts                                             #
#                                                                              #
################################################################################

function runDocker() {
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
}

# Start docker if it's not running
runDocker

rm $SCRIPT_DIR/adblock_hosts.txt
touch $SCRIPT_DIR/adblock_hosts.txt

# Create hosts file from Steven Black's project
docker run \
  --pull always \
  --platform linux/x86_64 \
  --rm \
  -it \
  -v $SCRIPT_DIR/adblock_hosts.txt:/etc/hosts \
  ghcr.io/stevenblack/hosts:latest updateHostsFile.py \
  --auto \
  --replace \
  --extensions gambling porn fakenews 1>/dev/null
