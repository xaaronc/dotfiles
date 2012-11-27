" based on script here: http://vim.wikia.com/wiki/Edit_gpg_encrypted_files

" Don't save backups of *.gpg files
set backupskip+=*.gpg

augroup gpgencrypted
  au!

  " Disable swap files, and set binary file format before reading the file
  " To avoid that parts of the file is saved to .viminfo when yanking or
  " deleting, empty the 'viminfo' option.
  autocmd BufReadPre,FileReadPre *.gpg setlocal noswapfile bin viminfo=

  " Decrypt the contents after reading the file, reset binary file format
  " and run any BufReadPost autocmds matching the file name without the .gpg
  " extension.  Redraw clears the GPG crap.
  autocmd BufReadPost,FileReadPost *.gpg
    \ execute "%!gpg --quiet --decrypt --no-use-agent --output -" |
    \ setlocal nobin |
    \ redraw! |
    \ execute "doautocmd BufReadPost " . expand("%:r")

  " Run any BufReadPost autocmds matching the file name without the .gpg
  " extension, for nonexisting files
  autocmd BufNewFile *.gpg
    \ execute "doautocmd BufReadPost " . expand("%:r")

  " Set binary file format and encrypt the contents before writing the file
  autocmd BufWritePre,FileWritePre *.gpg
    \ setlocal bin |
    \ %!gpg --quiet --encrypt --default-recipient BB8B96FA

  " After writing the file, do an :undo to revert the encryption in the
  " buffer, and reset binary file format
  autocmd BufWritePost,FileWritePost *.gpg
    \ silent u |
    \ setlocal nobin

augroup END
