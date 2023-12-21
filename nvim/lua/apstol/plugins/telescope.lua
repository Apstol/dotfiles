return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build =
            'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        }
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-j>'] = actions.move_selection_next,
                    }
                }
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--ignore", "-L", "--hidden", "--files", "--glob", "!**/.git/*" }
                }
            }
        })

        telescope.load_extension('fzf');

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files in cwd' })
        vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Find files tracked by Git' })
        vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Find string in cwd'})
        vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = 'Find string under the cursor in cwd'})
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find recent files'})
    end,
}
