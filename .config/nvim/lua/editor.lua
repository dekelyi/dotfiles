local M = {}

------ Completion
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.completeopt='menuone,noinsert,noselect'

vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true})

------ Diagnistics
vim.g.diagnostic_enable_virtual_text = true

------ LSP
vim.cmd [[packadd nvim-lspconfig]]
local lsp = require('lspconfig')

local function on_attach(client)
	require'completion'.on_attach(client)
end

lsp.vimls.setup({on_attach=on_attach})
lsp.rust_analyzer.setup({on_attach=on_attach})
lsp.sumneko_lua.setup {
	cmd = {'lua-language-server'},
	on_attach=on_attach,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				globals = {'vim', 'vimp'},
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		},
	},
}

------ Format
function M.Format()
	vim.cmd [[:norm gg=G]]
	-- vim.lsp.buf.formatting_sync()
end

vim.cmd [[command! -nargs=0 Format lua require('editor').Format()]]
vim.cmd [[autocmd BufWritePre <buffer> silent! :Format]]

function M.FormatSelection()
	M.Format()
end

vim.api.nvim_set_keymap('', '<C-f>', [[:lua require('editor').FormatSelection()<CR>]], {})

return M
