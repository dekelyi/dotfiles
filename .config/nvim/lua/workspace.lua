local M = {}

------ autoclose
local should_close = {'terminal', 'nowrite', 'nofile', 'help', 'quickfix', 'loclist'}

local function get_tabpage_wins()
	return vim.api.nvim_tabpage_list_wins(vim.api.nvim_get_current_tabpage())
end

function M.Autoclose()
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
	if not vim.tbl_contains(do_close, false) and #get_tabpage_wins() < prev_wins then
		if #vim.api.nvim_list_tabpages() == 1 then
			vim.cmd [[qall]]
		else
			vim.cmd [[tabclose]]
		end
	else
		M.CountPrevWins()
	end
end

function M.CountPrevWins()
	_G.prev_wins = #get_tabpage_wins()
end

vim.api.nvim_exec([[augroup WorkspaceSetup
autocmd!
autocmd WinEnter * lua require('workspace').Autoclose()
autocmd VimEnter,TabNewEntered,TabEnter * lua require('workspace').CountPrevWins()
augroup END]], false)

------ Keys
--- floaterm
vim.api.nvim_set_keymap('', [[<C-Space>]], [[:FloatermToggle<CR>]], { noremap = true })
vim.api.nvim_set_keymap('t', [[<C-Space>]], [[<C-\><C-n>:FloatermToggle<CR>]], { noremap= true })

--- telescope
vim.api.nvim_set_keymap('', [[<leader>lb]], [[:lua require"telescope.builtin".buffers()<CR>]], { noremap= true })
vim.api.nvim_set_keymap('', [[<leader>ll]], [[:lua require"telescope.builtin".loclist()<CR>]], { noremap= true })

vim.api.nvim_set_keymap('', [[<leader>e]], [[:NvimTreeFindFile<CR>]], { noremap= true })

return M
