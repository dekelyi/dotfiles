packloadall

set nu
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END
augroup vimrc
    autocmd!
    function LightlineReload()
        call lightline#init()
        call lightline#colorscheme()
        call lightline#update()
    endfunction
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | call LightlineReload()
augroup END

set clipboard=unnamedplus
set inccommand=nosplit
set expandtab
set shiftwidth=4
set foldmethod=marker

set linebreak
set breakindent

set termguicolors
colorscheme onedark
let g:lightline={ 'colorscheme': 'onedark' }

let g:mapleader=','
nnoremap <leader>s :CocCommand actions.open<CR>
nnoremap <leader>e :CocCommand explorer<CR>
