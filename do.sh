#!/bin/sh

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

cd /work/docs

groff -Dutf8 -F "/root/.local/groff/font" $1 > `basename $1 .roff`.ps
ps2pdf `basename $1 .roff`.ps
