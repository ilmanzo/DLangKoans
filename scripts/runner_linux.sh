#!/bin/sh
#sudo apt-get install inotify-tools 
while true; do
  inotifywait -r -e close_write,moved_to,create koans learn.d
  dub --build=unittest
done
