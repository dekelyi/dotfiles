vim.cmd [[packadd nvim-lspconfig]]

local lsp = require('nvim_lsp')

local function on_attach(client) 
	require'completion'.on_attach(client)
	require'diagnostic'.on_attach(client)
end

require('nlua.lsp.nvim').setup(lsp, {on_attach = on_attach})
lsp.vimls.setup({on_attach=on_attach})
