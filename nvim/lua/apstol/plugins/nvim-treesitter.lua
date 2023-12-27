return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	config = function()
		local configs = require('nvim-treesitter.configs')

		configs.setup({
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				'c',
				'cpp',
				'php',
				'lua',
				'sql',
				'json',
				'vim',
				'vimdoc',
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = 'gnn',
					node_incremental = 'grn',
					scope_incremental = 'grc',
					node_decremental = 'grm',
				},
			},
		})
	end,
}
