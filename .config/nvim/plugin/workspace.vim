augroup WorkspaceSetup
    autocmd!
    autocmd WinEnter * call CloseNoFile()
    autocmd VimEnter,TabNewEntered,TabEnter * let s:prev_wins = winnr('$')
augroup END

let s:prev_wins = 0
function! CloseNoFile()
    let should_close = 0
	for b in tabpagebuflist()
		let buftype = getbufvar(b, '&buftype')
        if index(['', 'terminal', 'nowrite', 'help'], buftype) >= 0
            let should_close = 1
        endif
	endfor

    if should_close == 0 && winnr('$') < s:prev_wins
        if tabpagenr() == 1
            qall
        else
            tabclose
        endif
    else
        let s:prev_wins = winnr('$')
    endif
endfunction


nnoremap <silent> <leader>e :if exists('b:coc_explorer_context')<CR>q<CR>
			\ else<CR>CocCommand explorer --no-toggle<CR>endif<CR>

" Floating Terminal
noremap <C-Space> :FloatermToggle<CR>
tnoremap <C-Space> <C-\><C-n>:FloatermToggle<CR>

nnoremap <leader>lb :Clap buffers<CR>
nnoremap <leader>lf :Clap files<CR>
