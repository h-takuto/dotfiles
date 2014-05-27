#!/bin/bash

DOT_FILES=(.zshrc .vimrc .gitconfig .gitignore .screenrc)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done
