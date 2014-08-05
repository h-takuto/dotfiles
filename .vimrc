




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


NeoBundle 'Shougo/vimshell'

NeoBundle 'Shougo/unite.vim'

NeoBundle 'Shougo/neomru.vim'

NeoBundle 'Shougo/neocomplcache'

NeoBundle 'Shougo/neosnippet'

NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'honza/vim-snippets'

"よくわからないので削除
"NeoBundle 'jpalardy/vim-slime'

"cpplint.pyと競合している？ので削除
"NeoBundle 'scrooloose/syntastic'

NeoBundle 'thinca/vim-quickrun'

NeoBundle 'sjl/gundo.vim'

NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'kana/vim-smartchr'

"clojureの開発環境が使えるらしい
"NeoBundle 'VimClojure'

"入力を簡単にできるようになるが今は設定ができないので削除
"NeoBundle 'kana/vim-smartinput'

NeoBundle 'scrooloose/nerdtree'

"help日本語
NeoBundle 'vim-jp/vimdoc-ja'

"カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'
"カラースキーム一覧表示にUnite.vimを使う
":Unite colorscheme -auto-preview
NeoBundle 'ujihisa/unite-colorscheme'


"Python
"flake8を使い、pep8とコードの性的解析を行い、エディタ上にエラー箇所を表示する
NeoBundle 'andviro/flake8-vim'
"flake8などがQuickfixに出力した結果を使い、画面上にハイライト表示する
NeoBundle 'cohama/vim-hier'
"Quickfixの出力を使い、カーソル位置にエラーがあったら情報をステータスラインに表示する
NeoBundle 'dannyob/quickfixstatus'
"編集中のファイルにautopep8をかける
NeoBundle 'tell-k/vim-autopep8'
"演算子の両脇にスペースを挿入する。改行時は末尾のスペースを削除するなどの動作を定義できる。


"C++
NeoBundle 'Rip-Rip/clang_complete'

NeoBundle 'rhysd/vim-clang-format'

NeoBundle 'kana/vim-operator-user'

NeoBundle 'yogomi/vim-cpplint','runAlsoC'

filetype plugin on
filetype indent on

"     vim-jp setting
:set helplang=ja,en

"     unite setting
let g:unite_enable_start_insert =1
let g:unite_source_history_yank_enaable=1
let g:unite_source_file_mru_limit=200
" ヤンクの履歴
nnoremap <silent> ,ur :<C-u>Unite history/yank<CR>
"バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
"ファイル一覧
nnoremap <silent> ,uf :<C-u>Unite -buffer-name=file file<CR>
"sourcesを「今開いているファイルのディレクトリ」とする
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
"
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>





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



"    vim-hier quickfixstatus setting
let g:PyFlakeOnWrite=1
"無視する警告の種類
"E501 => 行ごとの文字数制限、E121 => 事項のインデントは一つだけ、E303 => 改行の数が多すぎる
let g:PyFlakeDisabledMessages = 'E501,E121,E303'
"エラー行のマーカー。(hierがあればいらない)
"let g:PyFlakeSigns = 0
"flake8-autoをかけるためのコマンド。visual-modeでの範囲選択に対応
let g:PyFlakeRangeCommand = 'Q'
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
" McCabe複雑度の最大値
let g:PyFlakeDefaultComplexity = 10
" Be aggressive for autopep8
let g:PyFlakeAggressive = 1





"   syntastic setting
"let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=2




"     vim-indent-guides setting
" vim 起動時 vim-indent-guides を自動起動
"let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
"let g:indent_guides_start_level=2
" 自動カラー無効
"let g:indent_guides_auto_colors = 0
" 奇数番目のインデントの色
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=6
" 偶数番目のインデントの色
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=1
" ガイドの幅
"let g:indent_guides_guide_size=2





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
set notitle "vimを使ってくれてありがとう
set showmatch "括弧入力時の対応する括弧を表示
set smartindent "オートインデント
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
set list
set listchars=tab:>-,trail:~
set cursorline "カーソルの行にライン
set scrolloff=5 "スクロール時の余白確保
set wildmenu "コマンド補完を強化



set tabstop=2 "インデントをスペース2つ分に設定
set nocompatible
set fileformats=unix,dos
set smarttab expandtab
set shiftwidth=2 softtabstop=2
set ambiwidth=double
if has('path_extra')
  set tags& tags+=.tags,tags
endif
set laststatus=2
set showtabline=2

"最後のカーソル位置を復元する
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif


"##################検索設定##################
set ignorecase "大文字、小文字の区別なく検索する
set smartcase  "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan   "検索時に最後まで行ったら最初に戻る
set hlsearch   "ハイライト検索が有効
set incsearch  "インクリメントサーチ




"##################環境設定##################
set noswapfile " .swapファイルを作らない
set nowritebackup "バックアップファイルを作らない
set nobackup "バックアップをしない
"set mouse=a "マウスモード有効
set whichwrap=b,s,h,l,<,>,[,] "行頭、行末で止まらないようにする


"#################OSごとの設定###############
let OSTYPE = system('uname')

if OSTYPE == "Darwin\n"
  "以下Macの設定
  syntax on
  colorscheme evening
elseif OSTYPE == "Linux\n"
  "以下linuxの設定
  syntax on
  colorscheme evening
endif




"##################言語ごとの設定##################
autocmd BufEnter * if &filetype == "python" | call InitPython() | endif
autocmd BufEnter * if &filetype == "c" | call InitC_Cpp_Objc() | endif
autocmd BufEnter * if &filetype == "html" | call Inithtml() | endif

"###### C C++ Object-C ######
function! InitC_Cpp_Objc()
  nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
  vnoremap <buffer><Leader>cf :ClangFormat<CR>
  map <buffer><Leader>x <Plug>(operator-clang-format)
  map ,x <Plug>(operator-clang-format)
  autocmd BufWritePost *.h,*.cpp,*.cc,*.c call Cpplint()
  "   vim-smartchr setting
  "書き方： 入力記号 smartchr#loop('一回目', '二回目'...)
  inoremap <expr> = smartchr#loop(' = ', '=', ' == ')
  inoremap <expr> , smartchr#loop(', ', ',')
  inoremap <expr> + smartchr#loop(' + ', '+', '++')
  inoremap <expr> - smartchr#loop(' - ', '-', '--')

  let g:indent_guides_start_level=1
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=6
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=1
  let g:indent_guides_guide_size=2

endfunction




"###### html ######
function! Inithtml()
  set noexpandtab
endfunction




"###### Python #######"
function! InitPython()
  setlocal shiftwidth=4
  setlocal tabstop=8
  setlocal softtabstop=4
  setlocal expandtab

  setlocal autoindent
  setlocal smartindent
  setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class

  let g:indent_guides_start_level=1
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=6
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=1
  let g:indent_guides_guide_size=4
  IndentGuidesEnable

  inoremap <expr> , smartchr#loop(', ', ',')
  inoremap <expr> = smartchr#loop(' = ', '=', ' == ')
  inoremap <expr> + smartchr#loop(' + ', '+', '++')
  inoremap <expr> - smartchr#loop(' - ', '-', '--')
endfunction



