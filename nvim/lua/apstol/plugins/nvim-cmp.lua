return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        { 'L3MON4D3/LuaSnip' },
        { 'hrsh7th/cmp-buffer' },
        { 'rafamadriz/friendly-snippets' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'onsails/lspkind.nvim' },
        { 'andersevenrud/cmp-tmux' },
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local lspkind = require('lspkind')

        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,preview,noinsert,noselect'
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
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
                { name = 'luasnip' },
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'nvim_lua' },
                { name = 'path' },
                { name = 'tmux' },
            },
        })
    end
}
