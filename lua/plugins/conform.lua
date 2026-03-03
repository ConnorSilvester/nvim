return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        formatters_by_ft = {

            -- Web Formatters
            html = { 'prettier' },
            css = { 'prettier' },
            javascript = { 'prettier' },
            markdown = { 'prettier' },
            json = { 'prettier' },
            scss = { 'prettier' },
            jsx = { 'prettier' },

            c = { 'clang_format' },
            cpp = { 'clang_format' },
            python = { 'black' },
            lua = { 'stylua' },
            rust = { 'rustfmt' },
            java = { 'google_java_format' },
            cmake = { 'cmake_format' },
            make = { 'mbake' },
        },
        format_on_save = function(_)
            return false
        end,
        formatters = {
            google_java_format = {
                command = 'google-java-format',
                args = { '-' },
                stdin = true,
            },

            mbake = {
                command = 'mbake',
                args = { '-' },
                stdin = true,
            },
        },
    },
}
