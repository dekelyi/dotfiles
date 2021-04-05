-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use 'nvim-treesitter/nvim-treesitter'
	use 'sainnhe/gruvbox-material'
	use 'joshdick/onedark.vim'
	use 'NLKNguyen/papercolor-theme'
	-- use 'itchyny/lightline.vim'

	use 'neovim/nvim-lspconfig'
	use 'nvim-lua/completion-nvim'
	use 'tjdevries/nlua.nvim'

	use 'tpope/vim-commentary'
	use {'lukas-reineke/indent-blankline.nvim', branch='lua'}
	use {'liuchengxu/vista.vim', opt = true}

	use 'voldikss/vim-floaterm'
	use {'nvim-lua/telescope.nvim', requires = {
		'nvim-lua/popup.nvim',
		'nvim-lua/plenary.nvim'
	}}

	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('gitsigns').setup()
		end
	}

	use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}

	use 'svermeulen/vimpeccable'
	use 'rafcamlet/nvim-luapad'

	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function()
			require('lualine').setup{
				options = {
					theme = 'onedark',
					section_separators = {'', ''},
					component_separators = {'', ''},
					icons_enabled = true,
				},
				sections = {
					lualine_a = { {'mode', upper = true} },
					lualine_b = { {'branch', icon = ''} },
					lualine_c = { {'filename', file_status = true} },
					lualine_x = { 'encoding', 'fileformat', 'filetype' },
					lualine_y = { 'progress' },
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
				extensions = { 'fzf' }
			}
		end
	}
end)
