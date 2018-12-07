#!/bin/bash
##### パッケージのインストールがあるため管理者権限で実行######
##### NeoVim  OS毎に違う(debianとmacだけ追加) ########

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
}
get_os

if [ $OS == 'Mac' ]; then
  echo 'mac'

elif [ $OS == 'Debian' ]; then
  echo 'debian'

  #yes | sudo apt-get install software-properties-common
  #yes | sudo add-apt-repository ppa:neovim-ppa/unstable
  #yes | sudo apt-get update
  yes | sudo apt-get install neovim
  yes | sudo apt-get install python3-dev python3-pip
  yes | sudo upgrade pip3
  yes | sudo pip3 install -U pip3
  yes | sudo pip3 install neovim

  ## nvimを最新にする
  #wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
  #tar zxf nvim-linux64.tar.gz
  #nvimPath=`which nvim`
  #mv -n nvim-linux64/bin/nvim ${nvimPath}

  #rm -rf ./nvim-linux64
  #rm -rf ./nvim-linux64.tar.gz
fi
