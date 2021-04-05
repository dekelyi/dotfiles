local lualine = require('lualine')

local M = {}

lualine.setup{
	options = {
		-- theme = 'onedark',
		section_separators = {'', ''},
		component_separators = {'', ''},
		icons_enabled = true,
	},
	sections = {
		lualine_a = { {'mode', upper = true} },
		lualine_b = { {'branch', icon = ''} },
		lualine_c = { {'filename', file_status = true} },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { { 'diagnostics', sources = {'nvim_lsp'} }, 'progress' },
		lualine_z = { 'location'  },
	},
	inactive_sections = {
		lualine_a = {  },
		lualine_b = {  },
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {  },
		lualine_z = {   }
	},
}

------ Theme
function M.ThemeSwitch(...)
	local color = select(1, ...)

	if color == nil then
		-- set the opposite of the current theme
		if vim.o.background == 'dark' then
			color = 'light'
		else
			color = 'dark'
		end
	end

	if color == 'light' then
		vim.o.background = 'light'
		vim.cmd('colorscheme PaperColor')
		lualine.setup {options={theme='papercolor_light'}}
	else
		vim.o.background = 'dark'
		vim.cmd('colorscheme onedark')
		lualine.setup {options={theme='onedark'}}
	end
end

------ Options
vim.o.termguicolors = true
vim.o.showmode = false
vim.o.inccommand = 'nosplit'
vim.o.hlsearch = true
vim.o.incsearch = true

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
