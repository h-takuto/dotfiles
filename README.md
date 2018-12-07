#dotfiles#
##How to use##

  ```
  $git clone http://github.com/teari/dotfiles.git
  ```

###.zshrc .vimrc .gitconfigのみ使いたい場合###
  ```
  make
  ```

###すべての設定を使う場合###
  ```
  $ ./setup.sh
  ```

##NeoBundle##
  ```
  $ vim
  :NeoBundleInstall
  ```

##dein.vim##

##NeoVim (debian)##
  リポジトリの追加用のapt-add-repositoryパッケージをインストール
  ```
# sudo apt-get insatll sofware-properties-common
  ```

##NeoVim 本体##

  ```
# sudo add-apt-repository ppa:neovim-ppa/unstable
# sudo apt-get update
# sudo apt-get insatll neovim
  ```

##Python3##
  ```
# sudo apt-get install python3-dev python3-pip
# upgrade pip3
  $ pip3 install -U pip3
  ```

##このエラーがでたら##
  ```
  Traceback (most recent call last):
    File "/usr/bin/pip3", line 11, in <module>
      sys.exit(__main__._main())
  AttributeError: module 'pip.__main__' has no attribute '_main'
```

`/usr/bin/pip3`を以下に変更する
```
from pip import __main__
if __name__ == '__main__':
  sys.exit(__main__._main())
```

