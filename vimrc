set nocompatible
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set autowrite
set smartindent
set shiftround
set noshowmatch 		" disable bracket cursor jumping (redundant now that vim highlights)
set vb t_vb=
set ruler
set visualbell
set nohls 				" disable search highlighting
set incsearch
set shm=filnxtToOI
set showbreak=>>\ 
set foldmethod=marker	" folding lines contained within {{{,}}}
set scrolloff=3			" space from cursor to top/bottom edge
set sidescrolloff=3		" space from cursor to left/right edge
set textwidth=82
set noexpandtab
set cursorline

syntax on
highlight BadWhitespace ctermbg=lightgrey guibg=lightgrey

autocmd BufRead,BufNewFile *.txt set filetype=plaintext
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Python
autocmd BufRead,BufNewFile SCons* set filetype=python
autocmd FileType python set et smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class formatoptions=qcl comments=b:#
autocmd FileType python match BadWhitespace /^\t\+/ " no leading tabs

autocmd FileType h,c,hpp,cpp,python,asm,s match BadWhitespace /\s\+$/ " no trailing whitespace
autocmd FileType h,c,hpp,cpp set formatoptions=croql cindent comments=sr:/*,mb:*,ex:*/,://
autocmd FileType s,asm set ts=8 sts=8 sw=8
autocmd FileType tex set ts=2 sw=2 sts=2 et spell
autocmd FileType plaintext set spell
autocmd FileType sh set formatoptions=qcl comments=:#

" unfuck indenting of # in languages that used that as a comment leader
autocmd FileType python,sh,make inoremap # X#

if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif

