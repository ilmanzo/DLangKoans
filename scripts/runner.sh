#!/bin/sh
while true; do
  inotifywait -e close_write,moved_to,create .
  /usr/bin/rdmd main.d
done