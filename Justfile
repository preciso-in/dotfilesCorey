default:
  just --list

updateHosts:
  cd scripts && ./update-hosts.sh

remove_from_hosts SITE:
  cd scripts && ./remove-hosts.sh {{SITE}}
  just --justfile {{justfile()}} updateHosts