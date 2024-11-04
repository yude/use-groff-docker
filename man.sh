#!/bin/sh

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <manpage>"
  exit 1
fi

cd /work/docs

man -t $1 | ps2pdf - $1.pdf
