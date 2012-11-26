" vim:set ts=4 sw=4 noet
set nocompatible
set nowrap
set tabstop=4
set shiftwidth=4
set autoindent
set autowrite
set smartindent
set shiftround
set noshowmatch 		" disable bracket cursor jumping (redundant now that vim highlights)
set vb t_vb=
set ruler
set visualbell
set guioptions-=T
set guioptions-=m
set nohls 				" disable search highlighting
set incsearch
set shm=filnxtToOI
set showbreak=>>\ 
set background=light
set foldmethod=marker	" folding lines contained within {{{,}}}
set scrolloff=3			" space from cursor to top/bottom edge
set sidescrolloff=3		" space from cursor to left/right edge

syntax on

autocmd BufRead *.txt set filetype=plaintext
autocmd BufRead SCons* set filetype=python
autocmd BufRead *.tex set filetype=tex

autocmd FileType h,c,hpp,cpp set formatoptions=croql cindent comments=sr:/*,mb:*,ex:*/,://
autocmd FileType s,asm set ts=8 sw=8
autocmd FileType python set et
autocmd FileType tex set tw=80 ts=2 sw=2 et spell
autocmd FileType plaintext set spell tw=80
autocmd FileType sh set smartindent formatoptions=rql comments=:#

