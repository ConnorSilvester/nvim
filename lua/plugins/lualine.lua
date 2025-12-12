return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'olimorris/onedarkpro.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local colors = require('onedarkpro.helpers').get_colors()
        local icon = require 'lib.icons'

        local modes = {
            'mode',
            fmt = function(str)
                return str:sub(1, 1)
            end,
            separator = { left = '', right = '' },
        }

        local filename = {
            'filename',
            separator = { left = '', right = '' },
        }

        -- Git Branch
        local branch = {
            'branch',
            icon = '',
            color = { bg = colors.teal, fg = colors.base, gui = 'bold' },
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
        }

        -- Git Diff
        local diff = {
            'diff',
            color = { bg = colors.crust, fg = colors.green, gui = 'bold' },
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
            symbols = { added = icon.git.Add, modified = icon.git.Mod, removed = icon.git.Remove },
            diff_color = {
                added = { fg = colors.sky },
                modified = { fg = colors.yellow },
                removed = { fg = colors.red },
            },
        }

        -- Diagnostics
        local diagnostics = {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.yellow },
                info = { fg = colors.maroon },
                hint = { fg = colors.sapphire },
            },
            color = { bg = colors.crust, fg = colors.blue, gui = 'bold' },
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
        }

        -- LSP Status
        local lsp_status = {
            function()
                local buf_clients = vim.lsp.get_clients { bufnr = 0 }
                if next(buf_clients) == nil then
                    return ' No LSP'
                end
                local client_names = {}
                for _, client in pairs(buf_clients) do
                    table.insert(client_names, client.name)
                end
                return ' ' .. table.concat(client_names, ', ')
            end,
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
            color = { bg = colors.peach, fg = colors.base, gui = 'italic,bold' },
        }

        -- Formatters & Linters
        local formatters_linters = {
            function()
                local utils = require 'utils'
                return utils.get_formatters_linters()
            end,
            color = { bg = colors.crust, fg = colors.yellow, gui = 'italic,bold' },
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
        }

        -- ──────────────────────────────────────────────────────────────
        -- Final Setup
        -- ──────────────────────────────────────────────────────────────
        require('lualine').setup {
            options = {
                disabled_filetypes = {
                    statusline = {
                        'lazy',
                        'mason',
                        'checkhealth',
                        'dashboard',
                        'TelescopePrompt',
                        'snipe-menu',
                    },
                },
                icons_enabled = true,
                theme = 'auto', -- Automatically adapt to colorscheme
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                ignore_focus = {
                    'neo-tree',
                    'Outline',
                    'SymbolsSidebar',
                    'qf',
                    'trouble',
                },
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = { modes }, -- Simple mode indicator
                lualine_b = {}, -- Empty
                lualine_c = { filename }, -- Simple filename
                lualine_x = {}, -- Empty
                lualine_y = {}, -- Empty
                lualine_z = { -- Right-aligned components
                    branch,
                    diff,
                    diagnostics,
                    lsp_status,
                    formatters_linters,
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
        }
    end,
}
