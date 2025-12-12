return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        formatters_by_ft = {
            css = { 'prettier' },
            html = { 'prettier' },
            javascript = { 'prettier' },
            json = { 'prettier' },
            lua = { 'stylua' },
            markdown = { 'prettier' },
            python = { 'black' },
            rust = { 'rustfmt' },
            scss = { 'prettier' },
            jsx = { 'prettier' },
            yaml = { 'yamlfmt' },
            java = { 'google_java_format' },
            c = { 'clang_format' },
            cpp = { 'clang_format' },
            ruby = { 'standardrb' },
            eruby = { 'erb_format' },
            cmake = { 'cmake_format' },
            kotlin = { 'ktlint' },
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
            kotlin = {
                function(bufnr)
                    local filename = vim.api.nvim_buf_get_name(bufnr)
                    if not filename:match '^.conform%.' then
                        vim.cmd('!ktlint --format --relative ' .. vim.fn.shellescape(filename))
                    end
                end,
            },
        },
    },
}
