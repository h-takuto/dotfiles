






"##################プラグインマネージャー(NeoBundle)##################
set nocompatible
filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc()
endif
"##################プラグインを記述##################

NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }

NeoBundle 'VimClojure'

NeoBundle 'Shougo/vimshell'

NeoBundle 'Shougo/unite.vim'

NeoBundle 'Shougo/neocomplcache'

NeoBundle 'Shougo/neosnippet'

NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'honza/vim-snippets'

"NeoBundle 'jpalardy/vim-slime' よく分からないので今は削除

NeoBundle 'scrooloose/syntastic'

NeoBundle 'thinca/vim-quickrun'

NeoBundle 'sjl/gundo.vim'

"C++
"Neobundle 'Shougo/neocomplcache-clang_complete' 不便を感じたら導入

NeoBundle 'Rip-Rip/clang_complete'

filetype plugin on
filetype indent on


"    neocomplcache setting
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_smart_case_completion = 1
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable()
smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<TAB>"
endfunction



"    snippets setting
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neocomplcache_snippets_dir='~/.vim/bundle/vim-snippets/snippets'
let s:my_snippet = '~/dotfiles/snippets/'
let g:neosnippet#snippets_directory = s:my_snippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)



"    quickrun setting
set splitbelow
let g:quickrun_config={'*':{'split' : ''}}



"    gundo setting
nmap <C-z> :<C-u>GundoToggle<CR>







"##################キーバインド##################
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





"##################表示設定##################
set number "行番号を表示
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set tabstop=2 "インデントをスペース2つ分に設定
set smartindent "オートインデント
set shiftwidth=2 "オートインデント時のインデントする文字数
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
set list
set listchars=tab:>-,trail:~
set cursorline "カーソルの行にライン
"カラースキーマ設定
syntax on
colorscheme evening





"##################検索設定##################
set ignorecase "大文字、小文字の区別なく検索する
set wrapscan   "検索時に最後まで行ったら最初に戻る
set hlsearch   "ハイライト検索が有効





"##################環境設定##################
set noswapfile " .swapファイルを作らない
set nowritebackup "バックアップファイルを作らない
set nobackup "バックアップをしない
"set mouse=a "マウスモード有効
set whichwrap=b,s,h,l,<,>,[,] "行頭、行末で止まらないようにする



"##################言語ごとの設定##################

"#######python######
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
