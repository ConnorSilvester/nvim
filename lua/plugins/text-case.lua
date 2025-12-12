return {
    'johmsalas/text-case.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
        require('textcase').setup {}
        vim.keymap.set('n', '<leader>rn', function() require('textcase').current_word('to_upper_case') end, { desc = 'Current word to UPPER_CASE' })
        vim.keymap.set('n', '<leader>rl', function() require('textcase').current_word('to_lower_case') end, { desc = 'Current word to lower_case' })
        vim.keymap.set('n', '<leader>rs', function() require('textcase').current_word('to_snake_case') end, { desc = 'Current word to snake_case' })
        vim.keymap.set('n', '<leader>ru', function() require('textcase').current_word('to_constant_case') end, { desc = 'Current word to CONSTANT_CASE' })
        vim.keymap.set('n', '<leader>rc', function() require('textcase').current_word('to_camel_case') end, { desc = 'Current word to camelCase' })
        vim.keymap.set('n', '<leader>rp', function() require('textcase').current_word('to_pascal_case') end, { desc = 'Current word to PascalCase' })
        vim.keymap.set('n', '<leader>rt', function() require('textcase').current_word('to_title_case') end, { desc = 'Current word to Title Case' })
        vim.keymap.set('n', '<leader>rf', function() require('textcase').current_word('to_path_case') end, { desc = 'Current word to path/case' })

        vim.keymap.set('n', '<leader>rN', function() require('textcase').lsp_rename('to_upper_case') end, { desc = 'LSP rename to UPPER_CASE' })
        vim.keymap.set('n', '<leader>rL', function() require('textcase').lsp_rename('to_lower_case') end, { desc = 'LSP rename to lower_case' })
        vim.keymap.set('n', '<leader>rS', function() require('textcase').lsp_rename('to_snake_case') end, { desc = 'LSP rename to snake_case' })
        vim.keymap.set('n', '<leader>rU', function() require('textcase').lsp_rename('to_constant_case') end, { desc = 'LSP rename to CONSTANT_CASE' })
        vim.keymap.set('n', '<leader>rC', function() require('textcase').lsp_rename('to_camel_case') end, { desc = 'LSP rename to camelCase' })
        vim.keymap.set('n', '<leader>rP', function() require('textcase').lsp_rename('to_pascal_case') end, { desc = 'LSP rename to PascalCase' })
        vim.keymap.set('n', '<leader>rT', function() require('textcase').lsp_rename('to_title_case') end, { desc = 'LSP rename to Title Case' })
        vim.keymap.set('n', '<leader>rF', function() require('textcase').lsp_rename('to_path_case') end, { desc = 'LSP rename to path/case' })

        vim.keymap.set('v', '<leader>rn', function() require('textcase').operator('to_upper_case') end, { desc = 'Selection to UPPER_CASE' })
        vim.keymap.set('v', '<leader>rl', function() require('textcase').operator('to_lower_case') end, { desc = 'Selection to lower_case' })
        vim.keymap.set('v', '<leader>rs', function() require('textcase').operator('to_snake_case') end, { desc = 'Selection to snake_case' })
        vim.keymap.set('v', '<leader>ru', function() require('textcase').operator('to_constant_case') end, { desc = 'Selection to CONSTANT_CASE' })
        vim.keymap.set('v', '<leader>rc', function() require('textcase').operator('to_camel_case') end, { desc = 'Selection to camelCase' })
        vim.keymap.set('v', '<leader>rp', function() require('textcase').operator('to_pascal_case') end, { desc = 'Selection to PascalCase' })
        vim.keymap.set('v', '<leader>rt', function() require('textcase').operator('to_title_case') end, { desc = 'Selection to Title Case' })
        vim.keymap.set('v', '<leader>rf', function() require('textcase').operator('to_path_case') end, { desc = 'Selection to path/case' })
    end,
    lazy = false,
}
