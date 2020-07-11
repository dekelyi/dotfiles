packloadall
set mouse=a
set title
set wildmode=list:longest
setglobal modeline

"autocmd FileType vim packadd coc.nvim
packadd coc.nvim
" reload VIMRC on save
autocmd! BufWritePost *.vim,vimrc,$MYVIMRC ++once source %

let g:mapleader=','
nnoremap <leader>s :CocCommand actions.open<CR>
nnoremap <leader>l :CocDiagnostics<CR> 
nnoremap <leader>t :Vista<CR>
nnoremap <leader>tf :Vista finder clap<CR>
