#!/usr/bin/env bash
for BOOK in $(grep "^$BOOK" bookLinks.txt | awk '{print $1;}') 
do
./createBook.sh $BOOK
echo $BOOK
done
