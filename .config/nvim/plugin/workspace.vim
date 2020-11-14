
" let s:prev_wins = 0
" function! CloseNoFile()
"     let should_close = 0
" 	for b in tabpagebuflist()
" 		let buftype = getbufvar(b, '&buftype')
"         if index(['', 'terminal', 'nowrite', 'help'], buftype) >= 0
"             let should_close = 1
"         endif
" 	endfor

"     if should_close == 0 && winnr('$') < s:prev_wins
"         if tabpagenr() == 1
"             qall
"         else
"             tabclose
"         endif
"     else
"         let s:prev_wins = winnr('$')
"     endif
" endfunction

" Floating Terminal
lua require('workspace')
noremap <C-Space> :FloatermToggle<CR>
tnoremap <C-Space> <C-\><C-n>:FloatermToggle<CR>

noremap <leader>e :LuaTreeFindFile<CR>
noremap <leader>lb :lua require'telescope.builtin'.buffers()<CR>
noremap <leader>ll :lua require'telescope.builtin'.loclist()<CR>
