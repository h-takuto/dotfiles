"#####表示設定#####
set number "行番号を表示
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set shiftwidth=4 "オートインデント時のインデントする文字数
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
"カラースキーマ設定
syntax on
colorscheme evening

"#####環境設定#####
set noswapfile " .swapファイルを作らない
set nowritebackup "バックアップファイルを作らない
set nobackup "バックアップをしない
"set mouse=a "マウスモード有効

"#####プラグインマネージャー(Vundle)#####
set nocompatible
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()
" プラグインを記述
" プラグイン管理
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
"C++
Bundle 'Rip-Rip/clang_complete'
"PHP
Bundle 'Shougo/neosnippet.vim'

filetype plugin indent on
