packloadall
packadd coc-vimlsp
set mouse=a
set wildmode=list:longest
setglobal modeline

" reload VIMRC on save
autocmd! BufWritePost *.vim,vimrc,$MYVIMRC ++once source %

let g:mapleader=','
nnoremap <leader>s :CocCommand actions.open<CR>
nnoremap <leader>l :CocDiagnostics<CR> 
nnoremap <leader>t :Vista<CR>
nnoremap <leader>tf :Vista finder clap<CR>

"source <sfile>:p:h/theme.vim
"source <sfile>:p:h/editor.vim
