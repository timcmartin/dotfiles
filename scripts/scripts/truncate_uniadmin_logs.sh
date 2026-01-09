#!/bin/bash
for logfile in \
  /Users/tim.martin/src/getty/unisporkal/misc_admin/log/development.log \
  /Users/tim.martin/src/getty/unisporkal/misc_admin/log/test.log \
  /Users/tim.martin/src/getty/unisporkal/misc_admin/log/unisporkal_development.log \
  /Users/tim.martin/src/getty/unisporkal/misc_admin/log/unisporkal_test.log; do
  truncate -s 0 "$logfile"
  echo "Truncated $logfile"
done
