return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local lazy_status = require('lazy.status')
        local gruvbox_theme = require('lualine.themes.gruvbox')

        require('lualine').setup({
            options = {
                theme = gruvbox_theme
            },
            sections = {
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = gruvbox_theme.replace.a.bg }, -- highlight red
                    },
                    { 'encoding' },
                    { 'fileformat' },
                    { 'filetype' },
                }
            },
        })
    end,
}
