#! /usr/bin/env zsh

languages=$(echo "typescript javascript" | tr " " "\n")
core_utils=$(echo "find xargs sed awk jq" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)
echo "Query: "
read query

if echo "$languages" | grep -qs $selected; then
  curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less
else
  curl cht.sh/$selected~$query | less
fi
