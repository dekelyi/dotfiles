-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use 'nvim-treesitter/nvim-treesitter'
	use 'sainnhe/gruvbox-material'
	use 'joshdick/onedark.vim'
	use 'NLKNguyen/papercolor-theme'
	use 'itchyny/lightline.vim'

	use 'neovim/nvim-lspconfig'
	use 'nvim-lua/completion-nvim'
	use 'nvim-lua/diagnostic-nvim'
	use 'tjdevries/nlua.nvim'

	use 'tpope/vim-commentary'
	use 'Yggdroot/indentLine'
	use {'liuchengxu/vista.vim', { type='opt' }}

	use 'voldikss/vim-floaterm'
	use {'nvim-lua/telescope.nvim', {
		'nvim-lua/popup.nvim',
		'nvim-lua/plenary.nvim'
	}}

	-- use {'ms-jpq/chadtree', branch='chad'}
	use {'kyazdani42/nvim-tree.lua', {'kyazdani42/nvim-web-devicons'}}

	use 'svermeulen/vimpeccable'
	use 'rafcamlet/nvim-luapad'
end)
