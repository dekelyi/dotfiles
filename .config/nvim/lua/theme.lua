local M = {}

------ Lightline
local function _widthlimit(str)
	if vim.api.nvim_win_get_width(0) > 70 then
		return str
	else
		return ''
	end
end

M.lightline_components = {
	fileformat = function() _widthlimit(vim.o.fileformat) end,
	filetype = function() _widthlimit(vim.o.filetype) end
}

local lightline_config = { component_function = {} }
for key,val in pairs(M.lightline_components) do
	lightline_config.component_function[key] = string.format("v:lua.require('theme').lightline_components.%s()", key)
end

function M.RedrawStatus()
	vim.g.lightline = lightline_config
	vim.fn["lightline#init"]()
	vim.fn["lightline#colorscheme"]()
	vim.fn["lightline#update"]()
end

------ Theme
function M.ThemeSwitch(...)
	local color = select(1, ...)

	if color == nil then
		if vim.o.background == 'dark' then
			color = 'light'
		else
			color = 'dark'
		end
	end

	theme = ''

	if color == 'light' then
		theme = 'PaperColor'
		vim.o.background = 'light'
	else
		theme = 'onedark'
		vim.o.background = 'dark'
	end

	lightline_config.colorscheme = theme
	vim.cmd(string.format('colorscheme %s', theme))
	M.RedrawStatus()
end

------ Options
vim.o.termguicolors = true
vim.o.showmode = false
vim.o.inccommand = 'nosplit'
vim.o.hlsearch = true
vim.o.incsearch = true

vim.g.indentLine_leadingSpaceEnabled = true

------ Commands
vimp.map_command('ThemeSwitch', M.ThemeSwitch)

------ Setup
require('nvim-treesitter.configs').setup {
	ensure_installed = "all",     -- one of "all", "language", or a list of languages
	highlight = {
		enable = true,              -- false will disable the whole extension
	},
}

M.ThemeSwitch('dark')

return M
