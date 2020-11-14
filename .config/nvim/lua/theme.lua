require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",     -- one of "all", "language", or a list of languages
	highlight = {
		enable = true,              -- false will disable the whole extension
	},
}

vim.g.lightline = {
	-- 'component_function' = {
	-- 	'mode' = 'LightlineMode',
	-- 	'fileformat' = 'LightlineFileformat',
	-- 	'filetype' = 'LightlineFiletype',
	-- },
}


function ThemeSwitch()
	theme = ''
	if vim.o.background == 'dark' then
		theme = 'PaperColor'
	vim.o.background = 'light'
	else
		theme = 'onedark'
	vim.o.background = 'dark'
	end
	vim.g.lightline.colorscheme = theme
	vim.cmd(string.format('colorscheme %s', theme))
end
