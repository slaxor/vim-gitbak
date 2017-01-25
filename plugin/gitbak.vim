if (exists('g:loaded_gitbak'))
  finish
endif
let g:loaded_gitbak = 1

if (!exists('g:gitbak_dir'))
  let g:gitbak_dir = "$HOME/tmp/vim-gitbak"
endif

let s:plugindir = expand('%:p:h:h')

autocmd BufWritePre * call gitbak#Create()

function! gitbak#Create()
	let command = s:plugindir . '/bin/gitbak.sh "' . expand('%') . '" "' . g:gitbak_dir . '"'
	call system(command)
endfunction

