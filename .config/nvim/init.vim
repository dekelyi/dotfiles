packloadall
set mouse=a
set title
set wildmode=list:longest
setglobal modeline

" reload VIMRC on save
" autocmd! BufWritePost *.vim,vimrc,$MYVIMRC ++once source %
" autocmd! BufWritePost nvim/**/*.lua ++once luafile %

let g:mapleader=','
" nnoremap <leader>s :CocCommand actions.open<CR>
" nnoremap <leader>l :CocDiagnostics<CR> 
" nnoremap <leader>t :Vista<CR>
" nnoremap <leader>tf :Vista finder clap<CR>

function! UpdatePlugins()
	lua require('plugins')
	PackerCompile
	PackerSync
endfunction

command! Updt call UpdatePlugins()

lua require('init')
