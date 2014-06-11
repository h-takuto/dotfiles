#!/bin/bash

DOT_FILES=(.zshrc .vimrc .gitconfig .gitignore .screenrc)
TEMPLATE_FILES=(template.py)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done

git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

mkdir ~/.vim/template
for file in ${TEMPLATE_FILES[@]}
do
	ln -s $HOME/dotfiles/template/$file $HOME/.vim/template/$file
done
