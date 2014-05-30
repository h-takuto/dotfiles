"#####キーバインド#####
"
"ノーマル+ビジュアル  noremap  map
"コマンド+インサート  noremap! map!
"ノーマル　　　　　　 nnoremap nmap
"ビジュアル           vnoremap vmap
"コマンド             cnoremap cmap
"インサート           inoremap imap
":=;に変更
nnoremap ; :
"ノーマルモードでエンターキーで改行
noremap <CR> o<ESC>>
"ビジュアルモード時vで行末まで選択
vnoremap v $h




"#####表示設定#####
set number "行番号を表示
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set tabstop=2 "インデントをスペース2つ分に設定
set smartindent "オートインデント
set shiftwidth=2 "オートインデント時のインデントする文字数
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
set list
set listchars=tab:>-,trail:~
"カラースキーマ設定
syntax on
colorscheme evening




"#####検索設定#####
set ignorecase "大文字、小文字の区別なく検索する
set wrapscan	 "検索時に最後まで行ったら最初に戻る




"#####環境設定#####
set noswapfile " .swapファイルを作らない
set nowritebackup "バックアップファイルを作らない
set nobackup "バックアップをしない
"set mouse=a "マウスモード有効
set whichwrap=b,s,h,l,<,>,[,] "行頭、行末で止まらないようにする




"#####プラグインマネージャー(NeoBundle)#####
set nocompatible
filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc()
endif
"#########プラグインを記述##################
" プラグイン管理
NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<TAB>"
endfunction

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'jpalardy/vim-slime' よく分からないので今は削除
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
set splitbelow
let g:quickrun_config={'*':{'split' : ''}}

"C++
"Neobundle 'Shougo/neocomplcache-clang_complete' 不便を感じたら導入
NeoBundle 'Rip-Rip/clang_complete'

filetype plugin on
filetype indent on
