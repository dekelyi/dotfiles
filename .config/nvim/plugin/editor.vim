set nu
set clipboard=unnamedplus
set expandtab
set shiftwidth=4
set foldmethod=marker

set linebreak
set breakindent

augroup editing
    autocmd!
    " set hybrid number on normal mode
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
    " Update filetype on save if empty
    autocmd BufWritePost * nested
        \ if &l:filetype ==# '' || exists('b:ftdetect')
        \ |   unlet! b:ftdetect
        \ |   filetype detect
        \ | endif
    " Highlight current line only on focused window
    autocmd WinEnter,InsertLeave * if &ft !~# '^\(denite\|clap_\)' |
          \ set cursorline | endif
    autocmd WinLeave,InsertEnter * if &ft !~# '^\(denite\|clap_\)' |
          \ set nocursorline | endif
    " Make directory automatically.
    autocmd BufWritePre * call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)
augroup END

" Credits: https://github.com/Shougo/shougo-s-github/blob/master/vim/rc/options.rc.vim#L147
function! s:mkdir_as_necessary(dir, force) abort
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
