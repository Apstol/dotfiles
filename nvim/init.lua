require('apstol')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
    print('Installing lazy.nvim....')
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
    print('Done.')
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'williamboman/mason.nvim'
    },
    {
        'williamboman/mason-lspconfig.nvim'
    },
    -- LSP Support
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
        }
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
            { 'hrsh7th/cmp-buffer' },
            { 'rafamadriz/friendly-snippets' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'onsails/lspkind.nvim' },
            { 'andersevenrud/cmp-tmux' },
        },
    },
    {
        'savq/melange-nvim'
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            local configs = require('nvim-treesitter.configs')

            configs.setup({
                ensure_installed = { "c", "cpp", "php", "lua", "vim", "vimdoc" },
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end
    },
    {
        'kylechui/nvim-surround',
        version = "*",
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup({
                --
            })
        end
    },
    {
        'nvim-gelescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({
                pickers = {
                    find_files = {
                        find_command = { "rg", "--ignore", "-L", "--hidden", "--files", "--glob", "!**/.git/*" }
                    }
                }
            })
        end,
    },
    {
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end
    },
    {
        "debugloop/telescope-undo.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        keys = {
            {
                "<leader>u",
                "<cmd>Telescope undo<cr>",
                desc = "undo history",
            },
        },
        opts = {
            extensions = {
                undo = {
                    --
                },
            },
        },
        config = function(_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("undo")
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup({
                options = { theme = 'gruvbox_dark' }
            })
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'tummetott/unimpaired.nvim',
        config = function()
            require('unimpaired').setup({
                --
            })
        end
    },
    {
        'cameron-wags/rainbow_csv.nvim',
        config = true,
        ft = {
            'csv',
            'tsv',
            'csv_semicolon',
            'csv_whitespace',
            'csv_pipe',
            'rfc_csv',
            'rfc_semicolon'
        },
        cmd = {
            'RainbowDelim',
            'RainbowDelimSimple',
            'RainbowDelimQuoted',
            'RainbowMultiDelim'
        }
    },
    {
        'simeji/winresizer', lazy = false
    },
    {
        'alexghergh/nvim-tmux-navigation',
        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')
            vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<C-n>", nvim_tmux_nav.NvimTmuxNavigateNext)
        end
    },
    {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {
                icons = false,
                fold_open = "v",
                fold_closed = ">",
                indent_lines = false,
                signs = {
                    error = "error",
                    warning = "warn",
                    hint = "hint",
                    information = "info"
                },
                use_diagnostic_signs = false
            }

            vim.keymap.set("n", "<leader>xx", function() require('trouble').toggle() end)
            vim.keymap.set("n", "<leader>xw", function() require('trouble').toggle("workspace_diagnostics") end)
            vim.keymap.set("n", "<leader>xd", function() require('trouble').toggle("document_diagnostics") end)
            vim.keymap.set("n", "<leader>xq", function() require('trouble').toggle("quickfix") end)
            vim.keymap.set("n", "<leader>xl", function() require('trouble').toggle("loclist") end)
            vim.keymap.set("n", "gR", function() require('trouble').toggle("lsp_references") end)
        end
    },
    {
        'ThePrimeagen/refactoring.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require("refactoring").setup()
        end,
    },
})

---
-- Set colorscheme
---
vim.cmd.colorscheme('melange')

---
-- LSP setup
---
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        lsp_zero.default_setup,
        bashls = function()
            require('lspconfig').bashls.setup({
                filetypes = { 'sh', 'zsh' }
            })
        end
    },
})

---
-- Autocompletion config
---
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local lspkind = require('lspkind')

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,         -- prevent the popup from showing more than provided characters
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
        })
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'tmux' },
    },
})
