#!/bin/bash
#
#DOT_FILES=(.zshrc .vimrc .gitignore .gitconfig .screenrc .xvimrc .cheatsheet.md)
#
########ディレクトリ操作#######
#curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
#sh ./installer.sh ~/.cache/dein
#rm -f installer.sh
#
#cp -a after/ $HOME/.vim/after
#cp -a bin/ $HOME/bin
#mkdir -p ~/.vim/undo
#
#######リンク######
#for file in ${DOT_FILES[@]}
#do
#    ln -s $HOME/dotfiles/$file $HOME/$file
#done
#
#
###### NeoVim ########
#
#mkdir -p ~/.config/nvim
#ln -snfv $HOME/.vim $HOME/.config/nvim/
#ln -snfv $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim


function get_os() {
  if [ $(uname) == 'Darwin' ]; then
    OS='Mac'
  elif [ $(uname) == 'Linux' ]; then
    OS=`cat /etc/os-release | awk -F'["]' 'NR==1{print $2}' | awk '{print $1}'`
  elif [ $(uname) == 'MINGW32_NT' ]; then
    OS='Cygwin'
  else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
  fi
  echo ${OS}
}



get_os
