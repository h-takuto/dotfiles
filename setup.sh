#!/bin/bash

DOT_FILES=(.zshrc .vimrc .gitignore .gitconfig .screenrc)

#######ディレクトリ操作#######
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
cp -a after/ $HOME/.vim/after
cp -a bin/ $HOME/bin

######リンク######
for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

