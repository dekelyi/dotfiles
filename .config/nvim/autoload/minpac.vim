packadd minpac

function! minpac#setup()
	call minpac#init({ 'package_name': 'plugins' })
	call minpac#add('k-takata/minpac', { 'type': 'opt' })

	call minpac#add('jiangmiao/auto-pairs')
	call minpac#add('Yggdroot/indentLine')
	call minpac#add('joshdick/onedark.vim')
	call minpac#add('vim-airline/vim-airline')
	call minpac#add('liuchengxu/vim-clap')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('voldikss/vim-floaterm')
	call minpac#add('mhinz/vim-startify')

	call minpac#add('neoclide/coc.nvim', { 'type': 'opt' })
	call minpac#add('dstein64/vim-startuptime', { 'type': 'opt' })
	call minpac#add('liuchengxu/vista.vim', { 'type': 'opt' })
endfunction

function! minpac#install()
	call minpac#setup()
	call minpac#update('', { 'do': 'call minpac#status()' })
	call minpac#clean()
endfunction