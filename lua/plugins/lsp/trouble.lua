return {
    'folke/trouble.nvim',
    keys = {
        { '<leader>tT', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
        { '<leader>tt', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
        { '<leader>ts', '<cmd>Trouble symbols toggle<cr>', desc = 'Symbols (Trouble)' },
        { '<leader>tl', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
        { '<leader>tq', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
    },
    opts = {
        focus = true,
    },
}
