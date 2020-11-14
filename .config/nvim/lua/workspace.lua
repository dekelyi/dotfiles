local should_close = {'terminal', 'nowrite', 'nofile', 'help', 'quickfix', 'loclist'}

function get_tabpage_wins()
	return vim.api.nvim_tabpage_list_wins(vim.api.nvim_get_current_tabpage())
end

function Autoclose()
	local do_close = {}
	for i,win in ipairs(get_tabpage_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		local buftype = vim.bo[buf].buftype
		for j=1,#should_close do
			if buftype == should_close[j] then
				do_close[i] = true
				break
			else
				do_close[i] = false
			end
		end
	end
	-- print(vim.inspect(do_close))
	if not vim.tbl_contains(do_close, false) and #get_tabpage_wins() < prev_wins then
		if #vim.api.nvim_list_tabpages() == 1 then
			vim.cmd [[qall]]
		else
			vim.cmd [[tabclose]]
		end
	else
		CountPrevWins()
	end
end

function CountPrevWins()
	_G.prev_wins = #get_tabpage_wins()
end

vim.api.nvim_exec([[augroup WorkspaceSetup
	autocmd!
	autocmd WinEnter * lua Autoclose()
	autocmd VimEnter,TabNewEntered,TabEnter * lua CountPrevWins()
augroup END]], false)