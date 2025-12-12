return {
    'Wansmer/treesj',
    keys = {
        { '<leader>m', desc = 'Toggle split/join block (TreeSJ)' },
    },
    rependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        require('treesj').setup {
            max_join_length = 1000,
        }
    end,
}
