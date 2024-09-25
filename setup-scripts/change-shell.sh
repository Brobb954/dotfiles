#!/bin/bash

directory=./.local/share/omakub/defaults/bash

if [ -d "$directory" ]; then
  # rm -r $directory
  echo "found directory"
  ln -s ./dotfiles/.zshrc .
fi

zshrc=./.zshrc

if [ -e "$zshrc" ]; then
  echo "simlinked"
fi
