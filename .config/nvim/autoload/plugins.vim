packadd minpac

function! plugins#setup()
	call minpac#init({ 'package_name': 'plugins' })

	call minpac#add('jiangmiao/auto-pairs')
	call minpac#add('Yggdroot/indentLine')
	call minpac#add('joshdick/onedark.vim')
	call minpac#add('vim-airline/vim-airline')
	call minpac#add('liuchengxu/vim-clap')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('voldikss/vim-floaterm')
	call minpac#add('mhinz/vim-startify')

	call minpac#add('sheerun/vim-polyglot')
	call minpac#add('neoclide/coc.nvim', { 'type': 'opt', 'do': {-> CocInstall() }})
	call minpac#add('dstein64/vim-startuptime', { 'type': 'opt' })
	call minpac#add('liuchengxu/vista.vim', { 'type': 'opt' })
endfunction

function! plugins#install(...)
	let after= get(a:, 1, 'call minpac#status()')
	call plugins#setup()
	call minpac#clean()
	call minpac#update('', { 'do': after })
endfunction

function! CocInstall()
	packadd coc.nvim

	let g:coc_global_extensions = [
		\ 'coc-explorer',
		\ 'coc-vimlsp',
		\ 'coc-tsserver',
		\ 'coc-actions',
		\ 'coc-lists',
		\ 'coc-spell-checker'
	\]
    call coc#util#install()
    call coc#util#install_extension(g:coc_global_extensions)
endfunction
