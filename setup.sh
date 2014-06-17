#!/bin/bash

DOT_FILES=(.zshrc .vimrc .gitignore .gitconfig .screenrc)

VIM_FILES=(python.vim javascript.vim)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

mkdir after
mkdir ftplugin
mv ftplugin after
mv after ~/.vim

for file in ${VIM_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/.vim/after/ftplugin/$file
done
