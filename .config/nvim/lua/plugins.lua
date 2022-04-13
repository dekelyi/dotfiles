-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'nvim-treesitter/nvim-treesitter'
	use 'joshdick/onedark.vim'
	use 'NLKNguyen/papercolor-theme'

	use 'neovim/nvim-lspconfig'
	use 'nvim-lua/completion-nvim'

	use 'tpope/vim-commentary'
	use 'lukas-reineke/indent-blankline.nvim'
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
	}
end)
