#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# link dotfiles

for fileName in .??*
do
    [[ $fileName =~ \~$ ]] && continue
    [[ $fileName == ".git" ]] && continue
    [[ $fileName == ".gitignore" ]] && continue
    [[ $fileName == ".DS_Store" ]] && continue

    echo "link $fileName to ~/$fileName"
    ln -s $SCRIPT_DIR/$fileName ~/
done

set -x

# link other files
mkdir -p ~/Library/KeyBindings
ln -s $SCRIPT_DIR/DefaultKeyBinding.dict ~/Library/KeyBindings/

# setup git

git config --global core.excludesfile ~/.gitignore_global

# setup brew

if ! [ -x "$(command -v git)" ]; then
    echo "install brew"
    set +x
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    set -x
fi

brew install rcmdnk/file/brew-file
brew file install
