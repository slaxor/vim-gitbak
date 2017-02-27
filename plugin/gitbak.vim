if (exists('g:loaded_gitbak') || &writebackup == 0)
  finish
endif
let g:loaded_gitbak = 1

if (!exists('g:gitbak_dir'))
  let g:gitbak_dir = "$HOME/tmp/vim-gitbak"
endif

let s:gitbak_plugindir = expand('<sfile>:p:h:h')

autocmd BufWritePre * call gitbak#Create()

function! gitbak#Create()
	let command = s:gitbak_plugindir . '/bin/gitbak.sh "' . expand('%') . '" "' . g:gitbak_dir . '"'
	call system(command)
endfunction

