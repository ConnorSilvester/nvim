---@diagnostic disable: missing-fields
return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = 'VimEnter',
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter-textobjects' },
            { 'mfussenegger/nvim-treehopper' },
            { 'nvim-treesitter/nvim-treesitter-context',
                opts = {},
            },
        },

        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    'bash',
                    'bibtex',
                    'comment',
                    'c',
                    'cpp',
                    'css',
                    'csv',
                    'html',
                    'http',
                    'java',
                    'javascript',
                    'jsdoc',
                    'json',
                    'json5',
                    'latex',
                    'lua',
                    'markdown',
                    'markdown_inline',
                    'make',
                    'cmake',
                    'php',
                    'python',
                    'query',
                    'regex',
                    'rust',
                    'ruby',
                    'scss',
                    'sql',
                    'toml',
                    'typescript',
                    'typst',
                    'vim',
                    'vimdoc',
                    'vue',
                    'yaml',
                    'kotlin',
                    'glsl',
                    'latex',
                },
                highlight = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ['af'] = { query = '@function.outer', desc = 'outer function' },
                            ['if'] = { query = '@function.inner', desc = 'inner function' },
                            ['ac'] = { query = '@conditional.outer', desc = 'outer conditional' },
                            ['ic'] = { query = '@conditional.inner', desc = 'inner conditional' },
                            ['al'] = { query = '@loop.outer', desc = 'outer loop' },
                            ['il'] = { query = '@loop.inner', desc = 'inner loop' },
                            ['am'] = { query = '@statement.outer', desc = 'outer statement' },
                            ['ix'] = { query = '@comment.outer', desc = 'comment' },
                        },
                        include_surrounding_whitespace = false,
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ['<space>8'] = { query = '@parameter.inner', desc = 'Swap next parameters' },
                        },
                        swap_previous = {
                            ['<space>*'] = { query = '@parameter.inner', desc = 'Swap previous parameters' },
                        },
                    },
                },
            }
        end,
    },

    {
        'windwp/nvim-ts-autotag',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {},
    },
    {
        'ckolkey/ts-node-action',
        keys = {
            { '+', '<cmd>NodeAction<cr>', desc = 'Trigger Node Action' },
        },
        opts = {},
    },
}
