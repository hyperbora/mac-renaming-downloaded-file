#!/usr/local/bin/zsh
# https://stackoverflow.com/questions/6250698/how-to-decode-url-encoded-string-in-shell
echo -e $(echo "$1" | sed 's/+/ /g;s/%\(..\)/\\x\1/g;')

exit 0
