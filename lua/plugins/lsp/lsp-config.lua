--  ╭──────────────────────────────────────────────────────────╮
--  │                    LSP CONFIGURATION                     │
--  ╰──────────────────────────────────────────────────────────╯
return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufReadPost', 'BufNewFile' },
    version = '*',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        require('mason').setup {
            registries = {
                'github:mason-org/mason-registry',
                'github:visimp/mason-registry',
            },
            ui = {
                icons = {
                    package_installed = ' ',
                    package_pending = ' ',
                    package_uninstalled = ' ',
                },
                border = 'single',
                height = 0.8,
            },
        }

        require('mason-lspconfig').setup {
            ensure_installed = {

                -- C/C++
                'clangd',

                -- Java
                'jdtls',

                -- Python
                'ruff',

                -- Lua
                'lua_ls',

                -- Rust
                'rust_analyzer',

                -- Kotlin
                'kotlin_language_server',

                -- Ruby
                'solargraph',
                'ruby_lsp',

                -- HTML
                'html',

                -- CSS
                'cssls',

                -- JSON
                'jsonls',

                -- Markdown
                'marksman',

                -- CMake
                'cmake',

                -- YAML
                'yamlls',

                -- LaTeX
                'texlab',
            },
            automatic_installation = true,
            automatic_setup = false,
            automatic_enable = {
                exclude = {
                    'clangd',
                },
            },
        }

        vim.g.lspconfig_legacy_interface = true
        local lspconfig = require 'lspconfig'

        local lsp_defaults = lspconfig.util.default_config
        -- lsp_defaults.capabilities =
        --     vim.tbl_deep_extend('force', lsp_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())
        -- lsp_defaults.capabilities = vim.tbl_deep_extend('force', lsp_defaults.capabilities, require('blink.cmp').get_lsp_capabilities())

        local navic = require 'nvim-navic'

        local opts = function(desc)
            return { noremap = true, silent = true, desc = desc }
        end

        vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts 'Open Diagnostic Window')
        vim.keymap.set('n', '<space><left>', function()
            vim.diagnostic.jump { count = -vim.v.count1 }
        end, opts 'Previous Diagnostic')
        vim.keymap.set('n', '<space><right>', function()
            vim.diagnostic.jump { count = vim.v.count1 }
        end, opts 'Next Diagnostic')
        vim.keymap.set('n', 'gK', function()
            local new_config = not vim.diagnostic.config().virtual_lines
            vim.diagnostic.config { virtual_lines = new_config }
        end, { desc = 'Toggle diagnostic virtual_lines' })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                local bufopts = function(desc)
                    return { buffer = ev.buf, desc = desc }
                end
                -- All lsp keymaps starts with gr expept K.
                -- Default lsp keymaps. Setting the keymaps again, only to change the description.
                vim.keymap.set('n', 'K', function()
                    vim.lsp.buf.hover { border = 'single' }
                end, bufopts 'Hover')
                vim.keymap.set({ 'n', 'v' }, 'gra', vim.lsp.buf.code_action, bufopts 'LSP Code Action')
                vim.keymap.set('n', 'rn', vim.lsp.buf.rename, bufopts 'LSP Rename')
                vim.keymap.set('n', 'grr', vim.lsp.buf.references, bufopts 'LSP References')
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts 'LSP Go to Definition')
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts 'LSP Go to Declaration')
                vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, bufopts 'LSP Go to Implementation')
                vim.keymap.set('n', 'grf', function()
                    vim.lsp.buf.format { async = true }
                end, bufopts 'LSP Formatting')
                vim.keymap.set('n', 'grk', function()
                    vim.lsp.buf.signature_help { border = 'single' }
                end, bufopts 'LSP Singature Help')
                vim.keymap.set('n', 'grs', vim.lsp.buf.document_symbol, bufopts 'LSP Document Symbols')
                vim.keymap.set('n', 'grt', vim.lsp.buf.type_definition, bufopts 'LSP Type Definition')

                -- Get client
                local client = vim.lsp.get_client_by_id(ev.data.client_id)

                if client and client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(false)
                else
                    vim.lsp.inlay_hint.enable(false)
                end

                -- if client and client.server_capabilities.documentSymbolProvider then
                --     vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
                --     navic.attach(client, ev.buf)
                -- end
            end,
        })

        -- ╭───────────────────╮
        -- │ DIAGNOSTIC CONFIG │
        -- ╰───────────────────╯
        vim.diagnostic.config {
            virtual_text = {
                current_line = true,
                prefix = '',
            },
            jump = {
                float = true,
            },
            float = { border = 'single' },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = ' ',
                    [vim.diagnostic.severity.WARN] = ' ',
                    [vim.diagnostic.severity.HINT] = '󰌶 ',
                    [vim.diagnostic.severity.INFO] = ' ',
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
                    [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
                    [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
                    [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
                },
            },
        }

        -- Custom server configs
        lspconfig.clangd.setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            cmd = {
                'clangd',
                '--background-index',
                '--clang-tidy',
                '--header-insertion=iwyu',
                '--completion-style=detailed',
                '--function-arg-placeholders',
                '--fallback-style=Google',
            },
            init_options = {
                clangdFileStatus = true,
                usePlaceholders = true,
                completeUnimported = true,
            },
        }
    end,
}
