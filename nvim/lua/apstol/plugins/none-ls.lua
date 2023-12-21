return {
	'nvimtools/none-ls.nvim',
	lazy = true,
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'jay-babu/mason-null-ls.nvim',
	},
	config = function()
		local mason_null_ls = require('mason-null-ls')
		local null_ls = require('null-ls')
		local null_ls_utils = require('null-ls.utils')

		mason_null_ls.setup({
			ensure_installed = {
				'clang_format', -- cpp formatting
				'php_cs_fixer', -- php formatting
				'shfmt', -- bash formatting
				'stylua', -- lua formatting
				'cpplint', -- cpp linting
				'phpcs', -- php linting
				'shellcheck', -- bash linting
				'selene', -- lua linting
			},
		})

		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

		-- configure null_ls
		null_ls.setup({
			debug = true,
			root_dir = null_ls_utils.root_pattern('.null-ls-root', 'Makefile', '.git', 'package.json'),
			-- setup formatters & linters
			sources = {
				formatting.clang_format,
				formatting.phpcsfixer,
				formatting.shfmt,
				formatting.stylua,
				diagnostics.cpplint,
				diagnostics.phpcs,
				diagnostics.shellcheck,
				diagnostics.selene,
			},
			-- configure format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method('textDocument/formatting') then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd('BufWritePre', {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(client)
									return client.name == 'null-ls'
								end,
							})
						end,
					})
				end
			end,
		})
	end,
}
