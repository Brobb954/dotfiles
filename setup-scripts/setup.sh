#!/bin/bash

. /etc/os-release
# wget -qO- https://omakub.org/install | bash
echo [ $(echo "$VERSION_ID >= 24.04" | bc) != 1 ]
echo "what is $b"
# git clone https://github.com/brobb954/dotfiles.git && echo "cloned"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo "You are on linux-gnu"
  if [[ $ID == "ubuntu" ]]; then
    echo "and you are specificaly on ubuntu"
  fi
fi
# chmod +x ./dotfiles/setup-scripts/

# ./dotfiles/setup-scripts/change-shell.sh
