#!/usr/bin/env bash
DIRS="src/equipment/*.md"
README="src/equipment/README_TEST.md"

# for entry in "src"/*
printf "# Equipment\n\n" >> $README

for entry in $DIRS
do
  b=$(basename $entry)
  printf "%s %s\n" "-" $b >> $README
done
