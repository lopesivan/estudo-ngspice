#!/usr/bin/env bash

ext=sp
suffix=cir
ls *-${suffix}.${ext} |
	xargs -L1 |
	sort -n |
	tail -1 |
	cut -d'-' -f1 | sed 's/^0//' |
	while read n; do printf "cp %02d-${suffix}.${ext} %02d-${suffix}.${ext}\n" "$n" "$((n + 1))"; done
