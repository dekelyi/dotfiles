packloadall
set mouse=a
set wildmode=list:longest
setglobal modeline

" reload VIMRC on save
augroup vimrc
    autocmd!
    function LightlineReload()
        call lightline#init()
        call lightline#colorscheme()
        call lightline#update()
    endfunction
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | call LightlineReload() | redraw
augroup END

let g:mapleader=','
nnoremap <leader>s :CocCommand actions.open<CR>
nnoremap <leader>e :NERDTreeFocus<CR>
nnoremap <leader>l :CocDiagnostics<CR> 
nnoremap <leader>t :Vista!!<CR>
nnoremap <leader>tf :Vista finder clap<CR>

source <sfile>:p:h/theme.vim
source <sfile>:p:h/editor.vim
