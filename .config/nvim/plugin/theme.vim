lua require('theme')

" let g:indentLine_leadingSpaceEnabled = 1
" set noshowmode
" set inccommand=nosplit
" set hlsearch incsearch

function! LightlineMode()
	return  &filetype ==# 'CHADTree' ? 'CHADTree' : lightline#mode()
endfunction

function! LightlineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
	return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" lua ThemeSwitch()
