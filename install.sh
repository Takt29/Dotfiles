#!/bin/zsh

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

source ~/.zprofile ~/.zshrc

set -x

# setup git

git config --global core.excludesfile ~/.gitignore_global
git config --global include.path ~/.gitconfig_global
