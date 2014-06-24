if exists('b:did_ftplugin_python')
    finish
endif
let b:did_ftplugin_python = 1

setlocal foldmethod=indent
setlocal commentstring=#%s
let g:python_highlight_all = 1
