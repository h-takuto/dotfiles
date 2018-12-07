##!/bin/bash
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


get_os() {
  if [ "$(uname)" == 'Darwin' ]; then
      OS='Mac'
  elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    if  [ -e /etc/debian_version ] ||
        [ -e /etc/debian_release ]; then
        # Check Ubuntu or Debian
        if [ -e /etc/lsb-release ]; then
          # Ubuntu
          OS="ubuntu"
        else
          # Debian
          OS="debian"
        fi
      elif [ -e /etc/fedora-release ]; then
        # Fedra
        OS="fedora"
      elif [ -e /etc/redhat-release ]; then
        if [ -e /etc/oracle-release ]; then
            # Oracle Linux
            OS="oracle"
        else
            # Red Hat Enterprise Linux
            OS="redhat"
        fi
      elif [ -e /etc/arch-release ]; then
        # Arch Linux
        OS="arch"
      elif [ -e /etc/turbolinux-release ]; then
        # Turbolinux
        OS="turbol"
      elif [ -e /etc/SuSE-release ]; then
        # SuSE Linux
        OS="suse"
      elif [ -e /etc/mandriva-release ]; then
        # Mandriva Linux
        OS="mandriva"
      elif [ -e /etc/vine-release ]; then
        # Vine Linux
        OS="vine"
      elif [ -e /etc/gentoo-release ]; then
        # Gentoo Linux
        OS="gentoo"
      else
        # Other
        echo "unkown distribution"
        OS="unkown"
      fi
    elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
      OS='Cygwin'
    else
      echo "Your platform ($(uname -a)) is not supported."
    exit 1
  fi
  echo ${OS}
}



get_os
