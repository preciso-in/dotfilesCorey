#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f "$0"))

HOSTS_FILE="$SCRIPT_DIR/adblock_hosts.txt"
COMMENTED_FILE="$SCRIPT_DIR/block_disabled.txt"
UNCOMMENTED_FILE="$SCRIPT_DIR/block_enabled.txt"
OUTPUT_FILE="/etc/hosts"

function prepare_hosts_file() {
  cat $HOSTS_FILE >$SCRIPT_DIR/temp.txt
  cat <<EOL >>$SCRIPT_DIR/temp.txt


################################################################################
#                                                                              #
# Stephen Covey Quadrant 4 Sites                                               #
# These sites will be blocked between 7AM and 9PM                              #
#                                                                              #
################################################################################
EOL
}

function block_sites() {
  cat $UNCOMMENTED_FILE >>$SCRIPT_DIR/temp.txt
}

function unblock_sites() {
  cat $COMMENTED_FILE >>$SCRIPT_DIR/temp.txt
}

function cleanup() {

  sudo cp $SCRIPT_DIR/temp.txt $OUTPUT_FILE
  rm $SCRIPT_DIR/temp.txt
}

# Get current hour
HOUR=$(date +%H)

prepare_hosts_file

# Check if time is between 9 PM and 7 AM
if [ "$HOUR" -ge 21 ] || [ "$HOUR" -lt 7 ]; then
  unblock_sites
else
  block_sites
fi

cleanup
