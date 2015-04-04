#!/bin/sh

# This requires fswatch to be installed.
# If you are using homebrew, just `brew install fswatch`.

while true; do
  fswatch -1 -e .git . 
  dub
done
