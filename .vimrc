

"##################プラグインマネージャー(dein)##################
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein/')
  call dein#begin('~/.cache/dein')

  "vimのプラグイン管理
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  "補完（deopleteはpython3が必要)
  if ((has('nvim') || has('timers')) && has('python3')) && system('pip3 show neovim') !=# ''
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif
  elseif has('lua')
    call dein#add('Shougo/neocomplete.vim')
  else
    call dein#add('Shougo/neocomplcache.vim')
  endif

  "スニペット群
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')

  "vimで非同期処理を行うときに使う
  "call dein#add('Shougo/vimproc.vim', {
  "  \ 'build' : {
  "    \ 'windows' : 'tools\\update-dll-mingw',
  "    \ 'cygwin' : 'make -f make_cygwin.mak',
  "    \ 'mac' : 'make -f make_mac.mak',
  "    \ 'linux' : 'make',
  "    \ 'unix' : 'gmake',
  "  \ },
  "\ })
  call dein#add('Shougo/vimproc', {'build': 'make'})

  "vimのファイラー的なやつ
  call dein#add('Shougo/unite.vim')
  "unite.vimの付属てきなやつ？
  call dein#add('Shougo/neomru.vim')

  "カラースキーム一覧表示にUnite.vimを使う
  ":Unite colorscheme -auto-preview
  call dein#add('ujihisa/unite-colorscheme')

  ":Cheatで.cheatsheet.mdを開く
  call dein#add('reireias/vim-cheatsheet')

  "vimからソースコードを実行
  call dein#add('thinca/vim-quickrun')

  "キーを押す回数で挿入文字が変わる
  call dein#add('kana/vim-smartchr')

  "ディレクトリを左に出す
  call dein#add('scrooloose/nerdtree')
  "help日本語
  call dein#add('vim-jp/vimdoc-ja')

  "flake8などがQuickfixに出力した結果を使い、画面上にハイライト表示する
  call dein#add('cohama/vim-hier')
  "Quickfixの出力を使い、カーソル位置にエラーがあったら情報をステータスラインに表示する
  call dein#add('dannyob/quickfixstatus')
  "テキストにカッコで囲んだりできる
  call dein#add('kana/vim-operator-user')
  "シンタックスチェッカー
  call dein#add('scrooloose/syntastic')

  "Python
  "flake8を使い、pep8とコードの性的解析を行い、エディタ上にエラー箇所を表示する
  call dein#add('andviro/flake8-vim')
  "編集中のファイルにautopep8をかける
  call dein#add('tell-k/vim-autopep8')
  "JavaScript
  "gfでrequire()のモジュールにジャンプ
  call dein#add('moll/vim-node')
  "補完
  call dein#add('mattn/jscomplete-vim')
  call dein#add('myhere/vim-nodejs-complete')
  call dein#add('heavenshell/vim-jsdoc')
  call dein#add('guileen/vim-node-dict')
  "ES6のシンタックスハイライト
  call dein#add('jelera/vim-javascript-syntax',{'autoload':{'filetypes':['javascript']}})

  "GO
  "オールインワンプラグイン
  call dein#add('fatih/vim-go')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

"##########プラグイン設定###############

"deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1

"vim-chertsheet
let g:cheatsheet#cheat_file = '~/.cheatsheet.md'
let g:cheatsheet#vsplit = 1
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
let g:quickrun_config={'*':{'split' : ''}}

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

" NERDTree
" ファイルを開いたらNERDTreeを閉じる
let g:NERDTreeQuitOnOpen = 1
" 非表示ファイル
let g:NERDTreeIgnore=['\.git$','\.swp$']
" 親ディレクトリへ移動
let g:NERDTreeMapUpdi=''






"#############マウス##################
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
"    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif




"##################キーバインド##################
"ノーマル+ビジュアル  noremap  map
"コマンド+インサート  noremap! map!
"ノーマル　　　　　　 nnoremap nmap
"ビジュアル           vnoremap vmap
"コマンド             cnoremap cmap
"インサート           inoremap imap

"sをコマンド開始キーに変更
nnoremap s <Nop>

":=;に変更
nnoremap ; :
"ノーマルモードでエンターキーで改行
noremap <CR> o<ESC>>
"ビジュアルモード時vで行末まで選択
vnoremap v $h

"タブ移動 t + l,h

"ウィンドウ移動 s + j,k,l,h
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

"##################表示設定##################
set number "行番号を表示
set notitle "vimを使ってくれてありがとう
set showmatch "括弧入力時の対応する括弧を表示
set smartindent "オートインデント
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
set list
set listchars=tab:>-,trail:~
set cursorline "カーソルの行にライン
set scrolloff=15 "スクロール時の余白確保
set wildmenu "コマンド補完を強化
set encoding=utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp,iso-2022-jp


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
set splitright "画面を縦分割する際に右に開く
set splitbelow "画面を横分割する際に下に開く

" VimのUndoを永続化する
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

"#################OSごとの設定###############
let OSTYPE = system('uname')

if OSTYPE == "Darwin\n"
  "以下Macの設定
  syntax on
  colorscheme koehler

elseif OSTYPE == "Linux\n"
  "以下linuxの設定
  syntax on
  colorscheme koehler
endif




"##################言語ごとの設定##################
"autocmd BufEnter * if &filetype == "python" | call InitPython() | endif
autocmd BufEnter * if &filetype == "c" | call InitC_Cpp_Objc() | endif
autocmd BufEnter * if &filetype == "html" | call Inithtml() | endif
autocmd BufEnter * if &filetype == "js" | call InitJavaScript() | endif
autocmd BufEnter * if &filetype == "go" | call InitGoLang() | endif

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

  if version < 600
    syntax clear
  elseif exists('b:current_after_syntax')
    finish
  endif

  let s:cpo_save = &cpo
  set cpo&vim

  syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
  syn match pythonDelimiter "\(,\|\.\|:\)"
  syn keyword pythonSpecialWord self

  hi link pythonSpecialWord Special
  hi link pythonDelimiter Special

  let b:current_after_syntax = 'python'

  let &cpo = s:cpo_save
  unlet s:cpo_save

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


"######## JavaScript ########"
function! InitJavaScript()
  set expandtab
  set tabstop=2
  set shiftwidth=2

  let g:syntastic_enable_signs=1
  let g:syntastic_auto_loc_list=2

  let g:syntastic_favascript_checker = "jshint"
  an FileType javascript set dictionary+=$HOME/.vim/bundle/vim-node-dict/dict/node.dict

endfunction

"####### GO Lang #######"
function! InitGoLang()
  set expandtab
  set tabstop=2
  set shiftwidth=2
  let g:go_highlight_function = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  :highlight goErr cterm=bold ctermfg=214
  :match goErr /\<err\>/
endfunction

