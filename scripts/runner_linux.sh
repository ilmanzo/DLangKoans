#!/bin/sh
#sudo apt-get install inotify-tools 
while true; do
  inotifywait -e close_write,moved_to,create source
  dub
done
