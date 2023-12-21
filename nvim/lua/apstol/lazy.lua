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
    { import = 'apstol.plugins' }
}, {
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false
    }
})
