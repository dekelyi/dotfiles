------ Completion
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.completeopt='menuone,noinsert,noselect'

vimp.inoremap({'expr'}, '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
vimp.inoremap({'expr'}, '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

------ LSP
vim.cmd [[packadd nvim-lspconfig]]
local lsp = require('nvim_lsp')

local function on_attach(client) 
	require'completion'.on_attach(client)
	require'diagnostic'.on_attach(client)
end

require('nlua.lsp.nvim').setup(lsp, {on_attach = on_attach})
lsp.vimls.setup({on_attach=on_attach})

------ Commands
vimp.map_command('Format', function()
	vim.cmd [[:norm gg=G]]
	-- vim.lsp.buf.formatting_sync()
end)
vim.cmd [[autocmd BufWritePre <buffer> silent! :Format]]
