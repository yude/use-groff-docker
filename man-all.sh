#!/bin/sh

mkdir -p /work/docs/manpages-ja-pdf
cd /work/docs/manpages-ja-pdf

find /usr/share/man/ja -type f | while read -r file; do
    filename="${file##*/}"
    echo ${filename%.gz}
    man -t ${filename%.gz} | ps2pdf - ${filename%.gz}.pdf
done
