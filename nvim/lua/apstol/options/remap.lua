vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Remap leaving insert mode' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Merge line under the cursor with a current line' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Allows cursor to stay in the middle while paging down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Allows cursor to stay in the middle while paging up' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Allows search terms to stay in the middle' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Allows search terms to stay in the middle' })

vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Preserve pasted word in the buffer' })

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank into system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank into system clipboard' })

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete into void register' })

vim.keymap.set('n', 'Q', '<nop>', { desc = "Don't press Q" })
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format current buffer' })

vim.keymap.set(
	'n',
	'<leader>s',
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace the word you're on" }
)
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { desc = 'Make current file executable', silent = true })

vim.keymap.set('n', '<C-w>h', '<C-w>s', { desc = 'Remap window splitting to follow the tmux convention' })
