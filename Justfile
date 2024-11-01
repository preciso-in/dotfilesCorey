default:
  just --list

updateHosts:
  cd scripts/hosts_scripts && ./update-hosts.sh

remove_from_hosts SITE:
  cd scripts/hosts_scripts && ./remove-hosts.sh {{SITE}}
  just --justfile {{justfile()}} updateHosts