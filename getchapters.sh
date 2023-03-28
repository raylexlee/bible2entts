#!/usr/bin/env bash
BOOK=${1?"missing name of book ..."}
LINK=$(grep "^$BOOK" bookLinks.txt | awk '{print $2;}')
DOUBLE=$(./getlinks.js "$LINK" | grep '^\([0-9][0-9]*\) https.*\1' | wc -l)
CHAPTERS=$(expr $DOUBLE / 2)
echo $BOOK $CHAPTERS 

