#!/bin/bash

set -u

BASEDIR=$(dirname $0)
cd $BASEDIR

for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snfv ${PWD}/"$f" ~/
done

# setup vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall