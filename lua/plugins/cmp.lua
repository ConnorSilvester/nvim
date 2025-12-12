return {
    'hrsh7th/nvim-cmp',
    enabled = true,
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
        'ray-x/cmp-treesitter',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'octaltree/cmp-look',
        'uga-rosa/cmp-dictionary',
    },
    config = function()
        require('luasnip/loaders/from_lua').load { paths = { '~/.config/nvim/snippets/' } }
        require('luasnip/loaders/from_vscode').lazy_load()

        require('cmp_dictionary').setup {
            dic = {
                ['*'] = { '/usr/share/dict/words' },
            },
            filetypes = {
                markdown = true,
                text = true,
                gitcommit = true,
            },
            exact_length = 2,
            async = true,
            max_number_items = 10,
            min_chars = 2,
        }

        vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

        local kind_icons = {
            Class = ' ',
            Color = ' ',
            Comment = '//',
            Constant = ' ',
            Constructor = ' ',
            Enum = ' ',
            EnumMember = ' ',
            Event = '',
            Field = '󰄶 ',
            File = ' ',
            Folder = ' ',
            Function = 'ƒ ',
            Interface = ' ',
            Keyword = '󰌆 ',
            Method = ' ',
            Module = '󰏗 ',
            Operator = '󰆕 ',
            Property = ' ',
            Reference = ' ',
            Snippet = ' ',
            String = '󱌯 ',
            Struct = ' ',
            Text = ' ',
            TypeParameter = '󰅲 ',
            Unit = ' ',
            Value = '󰎠 ',
            Variable = '󰀫',
        }

        local luasnip = require 'luasnip'

        local cmp = require 'cmp'

        cmp.setup {
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                completion = {
                    border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
                    winhighlight = 'Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
                },
                documentation = {
                    border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
                    winhighlight = 'Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
                },
            },
            view = {
                entries = {
                    name = 'custom',
                    selection_order = 'near_cursor',
                    follow_cursor = true,
                },
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-s>'] = cmp.mapping.confirm { select = true },
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<C-l>'] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { 'i', 's' }),
                ['<C-h>'] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { 'i', 's' }),
            },
            sources = cmp.config.sources {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
                { name = 'nvim_lua' },
                { name = 'treesitter' },
                {
                    name = 'look',
                    keyword_length = 3,
                    option = {
                        convert_case = true,
                        loud = true,
                    },
                    max_item_count = 5,
                },
                {
                    name = 'dictionary',
                    keyword_length = 2,
                    option = {
                        filetypes = { 'markdown', 'text' },
                    },
                },
            },
            formatting = {
                fields = { 'abbr', 'kind', 'menu' },
                format = function(entry, vim_item)
                    -- Kind icons
                    -- This concatonates the icons with the name of the item kind
                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                    -- Trim text function
                    function trim(text)
                        local max = 40
                        if text and text:len(1, max) > max then
                            text = text:sub(1, max) .. '...'
                        end
                        return text
                    end
                    vim_item.abbr = trim(vim_item.abbr)
                    vim_item.menu = ({
                        nvim_lsp = '( LSP )',
                        nvim_lsp_signature_help = '( Signature )',
                        luasnip = '( LuaSnip )',
                        buffer = '( Buffer )',
                        path = '( Path )',
                        nvim_lua = '( Lua )',
                        treesitter = '( Treesitter )',
                        look = '( Look )',
                        cmdline = '(CMDLine)',
                    })[entry.source.name]
                    return vim_item
                end,
            },
            sorting = {
                comparators = {
                    cmp.config.compare.score,
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.length,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.order,
                },
                priority_weight = 100,
            },
            experimental = {
                ghost_text = true,
            },
        }

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
            },
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources {
                { name = 'path', group_index = 1 },
                { name = 'cmdline', group_index = 2 },
            },
            matching = {
                disallow_symbol_nonprefix_matching = false,
                disallow_fuzzy_matching = false,
                disallow_fullfuzzy_matching = false,
                disallow_partial_matching = false,
                disallow_partial_fuzzy_matching = false,
                disallow_prefix_unmatching = false,
            },
        })

        local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        local ts_utils = require 'nvim-treesitter.ts_utils'

        local ts_node_func_parens_disabled = {
            named_imports = true,
            use_declaration = true,
        }

        local default_handler = cmp_autopairs.filetypes['*']['('].handler
        cmp_autopairs.filetypes['*']['('].handler = function(char, item, bufnr, rules, commit_character)
            local node_type = ts_utils.get_node_at_cursor():type()
            if ts_node_func_parens_disabled[node_type] then
                if item.data then
                    item.data.funcParensDisabled = true
                else
                    char = ''
                end
            end
            default_handler(char, item, bufnr, rules, commit_character)
        end

        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
}
