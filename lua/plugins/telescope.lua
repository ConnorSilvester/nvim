return {
    'nvim-telescope/telescope.nvim',
    cmd = { 'Telescope' },
    keys = {
        { '<leader><leader>', '<cmd>Telescope buffers<cr>', desc = 'Find Buffers' },
        { '<leader>sc', ":lua require'telescope.builtin'.commands{}<cr>", desc = 'List Commands' },
        { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = 'Find Diagnostics' },
        { '<leader>se', '<cmd>Telescope file_browser<cr>', desc = 'File Browser' },
        { '<leader>sf', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
        { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = 'Find Word' },
        { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = 'Find Help' },
        { '<leader>si', '<cmd>Telescope import<cr>', desc = 'Find Imports' },
        { '<leader>sj', '<cmd>Telescope emoji<cr>', desc = 'Find emoji' },
        { '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = 'Find Keymaps' },
        { '<leader>sl', '<cmd>Telescope highlights<cr>', desc = 'Find Highlights' },
        { '<leader>sm', '<cmd>Telescope heading<cr>', desc = 'Find Heading' },
        {
            '<leader>so',
            function()
                require('telescope.builtin').find_files {
                    cwd = '/home/connor/MainFiles/Obsidian/Main/notes',
                    hidden = true,
                    no_ignore = true,
                }
            end,
            desc = 'Search Obsidian Vault',
        },
        { '<leader>sp', '<cmd>Telescope spell_suggest<cr>', desc = 'Find Spell Suggest' },
        { '<leader>sq', '<cmd>Telescope quickfix<cr>', desc = 'Find Quickix' },
        { '<leader>sr', '<cmd>Telescope grep_string<cr>', desc = 'Find Word Under Cursor' },
        { '<leader>ss', '<cmd>Telescope symbols<cr>', desc = 'Find Symbols' },
        { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Search in current buffer' },
        {
            '<leader>sn',
            function()
                require('telescope.builtin').find_files { prompt_title = 'Search Neovim Config', cwd = vim.fn.stdpath 'config' }
            end,
            desc = 'Search Neovim Config',
        },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-symbols.nvim',
        'xiyaowong/telescope-emoji.nvim',
        'debugloop/telescope-undo.nvim',
        'jvgrootveld/telescope-zoxide',
        'piersolenski/telescope-import.nvim',
        'crispgm/telescope-heading.nvim',
    },
    config = function()
        local actions = require 'telescope.actions'
        local action_layout = require 'telescope.actions.layout'
        local fb_actions = require('telescope').extensions.file_browser.actions
        local open_with_trouble = require('trouble.sources.telescope').open

        require('telescope').setup {
            defaults = {
                prompt_prefix = '   ',
                selection_caret = '▎ ',
                multi_icon = ' │ ',
                winblend = 0,
                borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
                mappings = {
                    i = {
                        ['<c-t>'] = open_with_trouble,
                        ['<M-p>'] = action_layout.toggle_preview,
                        ['<S-down>'] = actions.preview_scrolling_down,
                        ['<S-up>'] = actions.preview_scrolling_up,
                    },
                    n = {
                        ['<c-t>'] = open_with_trouble,
                        ['q'] = require('telescope.actions').close,
                        ['<M-p>'] = action_layout.toggle_preview,
                        ['<S-down>'] = actions.preview_scrolling_down,
                        ['<S-up>'] = actions.preview_scrolling_up,
                    },
                },
                -- preview = {
                --     hide_on_startup = true,
                -- },
                file_ignore_patterns = {
                    'node_modules',
                },
            },
            pickers = {
                buffers = {
                    previewer = false,
                    theme = 'dropdown',
                    mappings = {
                        n = {
                            ['<C-e>'] = 'delete_buffer',
                            ['l'] = 'select_default',
                        },
                    },
                    initial_mode = 'normal',
                },
                find_files = {
                    -- theme = 'ivy', -- 'ivy', 'dropdown', 'cursor'
                    -- layout_strategy = 'vertical',
                    -- layout_config = { height = 0.9 },
                    -- previewer = false,
                    path_display = { 'smart' },
                    layout_config = {
                        prompt_position = 'top',
                        preview_width = 0.5,
                        -- width = 0.7,
                    },
                    sorting_strategy = 'ascending',
                },
                help_tags = {
                    theme = 'ivy',
                },
                symbols = {
                    theme = 'dropdown',
                },
                registers = {
                    theme = 'ivy',
                },
                grep_string = {
                    initial_mode = 'normal',
                    theme = 'ivy',
                },
                live_grep = {
                    theme = 'ivy',
                },
            },
            extensions = {
                file_browser = {
                    dir_icon = '',
                    prompt_path = true,
                    grouped = true,
                    theme = 'dropdown',
                    initial_mode = 'normal',
                    previewer = false,
                    mappings = {
                        n = {
                            ['o'] = 'select_default',
                            ['H'] = fb_actions.toggle_hidden,
                            ['h'] = fb_actions.goto_parent_dir,
                            ['l'] = 'select_default',
                        },
                    },
                },
                undo = {
                    initial_mode = 'normal',
                    use_delta = true,
                    side_by_side = true,
                    layout_strategy = 'vertical',
                    layout_config = {
                        preview_height = 0.8,
                    },
                },
                heading = {
                    treesitter = true,
                },
            },
        }

        -- Extensions
        require('telescope').load_extension 'emoji'
        require('telescope').load_extension 'file_browser'
        require('telescope').load_extension 'undo'
        require('telescope').load_extension 'zoxide'
        require('telescope').load_extension 'import'
        require('telescope').load_extension 'heading'
    end,
}
