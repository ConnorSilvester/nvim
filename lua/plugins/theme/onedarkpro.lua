return {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    config = function()
        require('onedarkpro').setup {
            options = {
                treesitter = true,
            },

            -- Custom Colours
            -- highlights = {
            --     -- C/Cpp
            --     ['@parameter'] = { link = '@variable' },
            --     ['@parameter.c'] = { link = '@variable' },
            --     ['@lsp.type.parameter'] = { link = '@variable' },
            -- },
        }

        vim.cmd.colorscheme 'onedark_dark'
    end,
}
