packloadall
set mouse=a
set title
set wildmode=list:longest
setglobal modeline
let g:coc_global_extensions = [
	\ 'coc-explorer',
	\ 'coc-vimlsp',
	\ 'coc-actions',
	\ 'coc-lists',
	\ 'coc-spell-checker'
\]
"autocmd FileType vim packadd coc.nvim
packadd coc.nvim
" reload VIMRC on save
autocmd! BufWritePost *.vim,vimrc,$MYVIMRC ++once source %

let g:mapleader=','
nnoremap <leader>s :CocCommand actions.open<CR>
nnoremap <leader>l :CocDiagnostics<CR> 
nnoremap <leader>t :Vista<CR>
nnoremap <leader>tf :Vista finder clap<CR>
