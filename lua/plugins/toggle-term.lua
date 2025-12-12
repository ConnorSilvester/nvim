return {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
        direction = 'float',
        on_open = function(term)
            vim.cmd 'startinsert!'
        end,
    },
}
