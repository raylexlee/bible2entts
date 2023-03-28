#!/usr/bin/env bash
BOOK=${1?"missing name of book ..."}
FOLDER=text/$BOOK
LINK=$(grep "^$BOOK" bookLinks.txt | awk '{print $2;}')
CHAPTERS=$(grep "^$BOOK" NumberOfChapters.txt | awk '{print $2;}')
[ -d $FOLDER ] || mkdir $FOLDER
for CHAPTER in $(seq $CHAPTERS)
do
CHAPLINK="$LINK&bible_chapter=$CHAPTER"
./getbwsk.js "$CHAPLINK" | grep '^1' | sed 's/\([1-9][0-9]*\)/\n\1/g' | sed '1 d' > $FOLDER/$(printf "%03d.txt" $CHAPTER)
done
for CHAPTER in $(seq $CHAPTERS)
do
echo $(printf "%03d" $CHAPTER) Chapter_"$CHAPTER"
done > $FOLDER/coverparameters.txt
