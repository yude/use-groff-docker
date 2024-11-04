#! /bin/sh
## Imported from https://zenn.dev/kusaremkn/articles/1b4bf13e0b938b

set -ex

if [ "$#" -ne "2" -o "$(whoami)" != "root" ]
then
	echo "usage: sudo $0 TTF GFN" 1>&2
	exit 1
fi

MAP="/usr/share/groff/current/font/devps/generate/text.map"
TTF="$1"

BASE="$(basename "$TTF")"
INT="${BASE%.ttf}"
PFA="$INT.pfa"
AFM="$INT.afm"
GFN="$2"

DIR="/usr/share/groff/site-font"
mkdir -p "$DIR/devps"

fontforge -lang=ff -c "Open(\"$TTF\"); Generate(\"$DIR/devps/$PFA\");"
afmtodit "$DIR/devps/$AFM" "$MAP" "$DIR/devps/$GFN"
printf "$BASE\t$PFA\n" >>"$DIR/devps/download"
