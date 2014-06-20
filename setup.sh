#/bin/bash

DOT_FILES=(.zshrc .vimrc .gitignore .gitconfig .screenrc)

VIM_FILES=(python.vim javascript.vim google.vim)

BIN_FILES=(cpplint.py)

#######ディレクトリ操作#######
mkdir after
mkdir ftplugin
mkdir bin
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
mv bin ~/
mv ftplugin after
mv after ~/.vim

rm -rf after


######リンク######
for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done


for file in ${VIM_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/.vim/after/ftplugin/$file
done

for file in ${BIN_FILES[@]}
do
    ln -s  $HOME/dotfiles/$file $HOME/bin/$file
done
