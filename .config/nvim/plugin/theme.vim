lua require('theme')

let g:indentLine_leadingSpaceEnabled = 1
set noshowmode
set inccommand=nosplit
set hlsearch incsearch

let g:lightline = {}

" ################### Colorscheme ############

function! ThemeDark()
	let g:lightline.colorscheme='onedark'
	set background=dark
	colorscheme onedark
endfunction

function! ThemeLight()
	set background=light
	colorscheme PaperColor
	let g:lightline.colorscheme='PaperColor'
endfunction

function! ThemeSwitch()
	if &background == 'dark'
		call ThemeLight()
	else
		call ThemeDark()
	endif
	call RedrawLightline()
endfunction

command! ThemeSwitch call ThemeSwitch()

if !has('gui_running')
	set termguicolors
elseif
	set t_Co=256
endif
call ThemeDark()

" ################## Lightline ##################

function! LightlineMode()
	return  &filetype ==# 'CHADTree' ? 'CHADTree' : lightline#mode()
endfunction

function! LightlineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
	return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! RedrawLightline()
	let g:lightline = {
				\ 		'colorscheme': g:lightline.colorscheme,
				\ 		'component_function': {
				\   		'mode': 'LightlineMode',
				\		   	'fileformat': 'LightlineFileformat',
				\		   	'filetype': 'LightlineFiletype',
				\ 		},
				\ 	}

	call lightline#init()
	call lightline#colorscheme()
	call lightline#update()
endfunction
call RedrawLightline()
