augroup WorkspaceSetup
    autocmd!
    autocmd VimEnter,TabNewEntered * :NERDTree
    autocmd VimEnter,TabNewEntered * :2wincmd w

    autocmd BufEnter * if CountWindows() == 0 | if tabpagenr() == 1 | qall | else | tabclose | endif | endif
augroup END

function! CountWindows()
    let c = 0
    while c < winnr('$')
        if index(['', 'terminal', 'nowrite'], &buftype) >= 0
            return 1
        endif
        wincmd w
        let c += 1
    endwhile
    return 0
endfunction


nnoremap <silent> <leader>e :if exists('b:NERDTree')<CR>wincmd p<CR>else<CR>NERDTreeFocus<CR>endif<CR>

noremap <C-Space> :FloatermToggle<CR>
tnoremap <C-Space> <C-\><C-n>:FloatermToggle<CR>

nnoremap <leader>cb :Clap buffers<CR>
nnoremap <leader>cf :Clap files<CR>
