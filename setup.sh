#!/bin/bash

DOT_FILES=(.zshrc .vimrc .gitignore .gitconfig .screenrc .xvimrc .cheatsheet.md)

#######ディレクトリ操作#######
#git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/dein.vim
cp -a after/ $HOME/.vim/after
cp -a bin/ $HOME/bin
mkdir -p ~/.vim/undo

######リンク######
for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done


##### NeoVim ########

mkdir -p ~/.config/nvim
ln -snfv $HOME/.vim $HOME/.config/nvim/
ln -snfv $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim
