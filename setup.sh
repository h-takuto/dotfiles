#/bin/bash

DOT_FILES=(.zshrc .vimrc .gitignore .gitconfig .screenrc)

VIM_FILES=(python.vim javascript.vim google.vim)

BIN_FILES=(cpplint.py)

#######ディレクトリ操作#######
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

cp  -p after $HOME/.vim/
cp  -p bin $HOME/

######リンク######
for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

for file in ${VIM_FILES[@]}
do
    ln  -s $HOME/dotfiles/after/ftplugin/$file $HOME/.vim/after/ftplugin/$file
done

for file in ${BIN_FILES[@]}
do
    ln  -s $HOME/dotfiles/bin$file $HOME/bin/$file
done
