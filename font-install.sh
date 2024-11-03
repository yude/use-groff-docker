#! /bin/sh
# https://hd.sasakulab.com/HraCBoTjT8W9cgqCVuLdNw?view#%E6%97%A5%E6%9C%AC%E8%AA%9E%E3%82%92%E5%87%BA%E5%8A%9B%E3%81%A7%E3%81%8D%E3%82%8B%E3%82%88%E3%81%86%E3%81%AB%E3%81%99%E3%82%8B
set -ex

if [ "$#" -ne "2" ]
then
	echo "usage: $0 TTF GFN" 1>&2
	exit 1
fi

MAP="/usr/share/groff/current/font/devps/generate/text.map"
TTF="$1"

BASE="$(basename "$TTF")"
INT="${BASE%.ttf}"
PFA="$INT.pfa"
AFM="$INT.afm"
GFN="$2"

DIR="$HOME/.local/groff/font"
mkdir -p "$DIR/devps"

fontforge -lang=ff -c "Open(\"$TTF\"); Generate(\"$DIR/devps/$PFA\");"
afmtodit "$DIR/devps/$AFM" "$MAP" "$DIR/devps/$GFN"
printf "$BASE\t$PFA\n" >>"$DIR/devps/download"
