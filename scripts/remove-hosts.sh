#! /env/usr/bin zsh

pushd ../MacOS

last_line=$(grep -n 'cat new_host_entries' temp.txt | tail -n 1 | cut -d: -f1)

line_to_add="sed -i \047\047 \047/$1/d\047 hosts"

line_number=$((last_line + 1))

awk -v line="$line_number" -v line_to_add="$line_to_add" 'NR==line{print line_to_add }1' temp.txt >awk_out

unset last_line

popd
