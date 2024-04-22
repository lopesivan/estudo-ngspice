#!/bin/sh

set -xe

file=$(echo $* | sed -e 's/.*/\L&/g' -e 's/ /-/g')
ls -l | grep ^d | wc -l | while read n; do printf "mkdir %02d-$file\n" "$((n + 1))"; done
# ----------------------------------------------------------------------------
exit 0
