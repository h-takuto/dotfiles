#!/bin/bash

DOT_FILES=(.zshrc .vimrc .gitignore .gitconfig .screenrc .xvimrc .cheatsheet.md)

#######ディレクトリ操作#######
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm -f installer.sh

cp -a after/ $HOME/.vim/after
cp -a bin/ $HOME/bin
mkdir -p ~/.vim/undo

######リンク######
for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

mkdir -p ~/.config/nvim
ln -snfv $HOME/.vim $HOME/.config/nvim/
ln -snfv $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim



