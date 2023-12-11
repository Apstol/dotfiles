vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Enter explore mode
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")            -- allows cursor to stay in the middle while paging down
vim.keymap.set("n", "<C-u>", "<C-u>zz")            -- allows cursor to stay in the middle while paging up
vim.keymap.set("n", "n", "nzzzv")                  -- allows search terms to stay in the middle
vim.keymap.set("n", "N", "Nzzzv")                  -- allows search terms to stay in the middle

vim.keymap.set("x", "<leader>p", [["_dP]])         -- preserve pasted word in the buffer

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- yank into system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])          -- yank into system clipboard

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete into void register

vim.keymap.set("n", "Q", "<nop>")                  -- don't press Q
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace the word you're on
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })              -- make current file executable

vim.keymap.set("n", "<C-w>h", "<C-w>s")                                                  -- remap window splitting to follow the tmux convention
