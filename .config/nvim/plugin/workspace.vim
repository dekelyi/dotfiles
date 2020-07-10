augroup WorkspaceSetup
    autocmd!
    autocmd VimEnter,TabNewEntered * :NERDTree
    autocmd VimEnter,TabNewEntered * :2wincmd w

    autocmd WinEnter * call CloseNoFile()
    autocmd VimEnter,TabNewEntered,TabEnter * let s:prev_wins = winnr('$')
augroup END

let s:prev_wins = 0
function! CloseNoFile()
    let _count = 0
    let sould_close = 0

    while _count < winnr('$')
        if index(['', 'terminal', 'nowrite', 'help'], &buftype) >= 0
            let sould_close = 1
        endif
        wincmd w
        let _count += 1
    endwhile

    if sould_close == 0 && winnr('$') < s:prev_wins
        if tabpagenr() == 1
            qall
        else
            tabclose
        endif
    else
        let s:prev_wins = winnr('$')
    endif
endfunction


nnoremap <silent> <leader>e :if exists('b:NERDTree')<CR>wincmd p<CR>else<CR>NERDTreeFocus<CR>endif<CR>

noremap <C-Space> :FloatermToggle<CR>
tnoremap <C-Space> <C-\><C-n>:FloatermToggle<CR>

nnoremap <leader>lb :Clap buffers<CR>
nnoremap <leader>lf :Clap files<CR>
