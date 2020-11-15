set hidden
set nu
set clipboard=unnamedplus
set shiftwidth=4 tabstop=4
set foldmethod=marker

set linebreak
set breakindent

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

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
	autocmd WinEnter,InsertLeave * set cursorline
	autocmd WinLeave,InsertEnter * set nocursorline
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

" Force saving files that require root permission 
command! W execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
map <F7> gg=G<C-o><C-o>
