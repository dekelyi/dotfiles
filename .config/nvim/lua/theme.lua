require('nvim-treesitter.configs').setup {
	ensure_installed = "all",     -- one of "all", "language", or a list of languages
	highlight = {
		enable = true,              -- false will disable the whole extension
	},
}

local lightline = {
	-- colorscheme = 'onedark',
	component_function = {
		mode = "LightlineMode",
		fileformat = "LightlineFileformat",
		filetype = "LightlineFiletype",
	},
}

function ThemeSwitch(color)
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

	lightline.colorscheme = theme
	vim.cmd(string.format('colorscheme %s', theme))
	RedrawStatus()
end

function RedrawStatus()
	vim.g.lightline = lightline
	vim.fn["lightline#init"]()
	vim.fn["lightline#colorscheme"]()
	vim.fn["lightline#update"]()
end

vim.o.termguicolors = true
vim.o.showmode = false
vim.o.inccommand = 'nosplit'
vim.o.hlsearch = true
vim.o.incsearch = true

vim.g.indentLine_leadingSpaceEnabled = true

vim.cmd [[command! ThemeSwitch lua ThemeSwitch()]]
ThemeSwitch('dark')

