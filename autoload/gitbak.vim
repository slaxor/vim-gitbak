breakadd here
set verbose=10
if &compatible || v:version < 500 || (exists('g:loaded_gitbak') && g:loaded_gitbak)
  finish
endif
let g:loaded_gitbak = 1

let g:gitbak_dir = "$HOME/tmp/vim-gitbak"
" let s:plugindir = expand('<sfile>:p:h:h')
let s:plugindir = expand('%:p:h:h')

autocmd BufWritePre * call gitbak#Create

function! gitbak#Create() abort
	let command = s:plugindir . "/bin/gitbak.sh " . expand('%') . " " . g:gitbak_dir
	call system(command)
endfunction

set verbose=0
