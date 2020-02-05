#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

for fileName in .??*
do
    [[ "$fileName" == ".git" ]] && continue
    [[ "$fileName" == ".DS_Store" ]] && continue

    echo "link $fileName to ~/$fileName"
    ln -s $SCRIPT_DIR/$fileName ~/
done

set -x
git config --global core.excludesfile ~/.gitignore_global

mkdir -p ~/Library/KeyBindings
ln -s $SCRIPT_DIR/DefaultKeyBinding.dict ~/Library/KeyBindings/

# setup brew

if ! [ -x "$(command -v git)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install rcmdnk/file/brew-file
brew file install
