#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f "$0"))

# Define input and output file names
INPUT_FILE="$SCRIPT_DIR/unproductive_sites.txt"
DISABLED_FILE="$SCRIPT_DIR/block_disabled.txt"
ENABLED_FILE="$SCRIPT_DIR/block_enabled.txt"

# Clear the output file or create it if it doesn't exist
rm $DISABLED_FILE
rm $ENABLED_FILE
touch "$DISABLED_FILE"
touch "$ENABLED_FILE"

# Read each line from the input file
while IFS= read -r line; do
  # Remove "www." prefix to get the domain
  domain="${line#www.}"

  # Write the entries to the block enabled file
  echo "0.0.0.0 $domain" >>"$ENABLED_FILE"
  echo "0.0.0.0 $line" >>"$ENABLED_FILE"

  # Write the entries to the block disabled file
  echo "# 0.0.0.0 $domain" >>"$DISABLED_FILE"
  echo "# 0.0.0.0 $line" >>"$DISABLED_FILE"

done <"$INPUT_FILE"

echo "Done!"
echo "Host entries written for disabling and enabling access to unproductive sites"
