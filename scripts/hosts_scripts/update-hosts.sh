#! /usr/bin/env zsh

##########################################################################################
#                                                                                        #
# Inputs:                                                                                #
#   - add_host_entries (List maintained by me)                                           #
#   - addblock_hosts.txt (Downloaded by download_adblock_entries.sh)                      #
#                                                                                        #
# Outputs:                                                                               #
#   - /etc/hosts                                                                         #
#                                                                                        #
# addblock_hosts file collates entries from                                              #
#  - add_host_entries (extra entries made by me)                                         #
#                                                                                        #
# Copies addblock_hosts to                                                               #
#  - /etc/hosts                                                                          #
#                                                                                        #
# addblock_hosts                                                                         #
#  - will be further modified to block streaming sites during 7AM to 9PM                 #
#  - by filter_unproductive_sites.sh                                                     #
#                                                                                        #
##########################################################################################

SCRIPT_DIR=$(dirname $(readlink -f "$0"))
DOTFILES_DIR="${SCRIPT_DIR%/*/*}"

sudo rm /etc/hosts
rm $SCRIPT_DIR/adblock_hosts.txt

# Get addblock_hosts.txt from Docker
source $SCRIPT_DIR/download_adblock_entries.sh

echo "\n\n# List of ad hosts maintained by me" >>$SCRIPT_DIR/adblock_hosts.txt

cat $SCRIPT_DIR/add_host_entries >>$SCRIPT_DIR/adblock_hosts.txt

sed -i '' '$d' $SCRIPT_DIR/adblock_hosts.txt

# Removing entries like reddit, googleapis, gstatic from addblock
sed -i '' '/reddit/d' $SCRIPT_DIR/adblock_hosts.txt
sed -i '' '/redd.it/d' $SCRIPT_DIR/adblock_hosts.txt
sed -i '' '/googleapis/d' $SCRIPT_DIR/adblock_hosts.txt
sed -i '' '/gstatic/d' $SCRIPT_DIR/adblock_hosts.txt

sudo cp $SCRIPT_DIR/adblock_hosts.txt /etc/hosts

# Some entries like streaming sites, etc will be filtered out during 7AM to 9PM using a cronjob.
# Refer to filter_unproductive_sites.sh
# TODO: Add cronjob to run filter_unproductive_sites.sh every 15 minutes.
# Check if cronjob is already running.
# Since, cronjob cannot be named, it is difficult to check if it's running or not.
# Use a systemd service instead.
# Prompt "Can you name a cronjob and see if it is already running?"

# Create inputs for systemctl daemon
source $SCRIPT_DIR/process_unproductive_sites.sh

# Update hosts file to block streaming sites during 7AM to 9PM
source $SCRIPT_DIR/filter_unproductive_sites.sh

unset DOTFILES_DIR
unset SCRIPT_DIR

sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder
