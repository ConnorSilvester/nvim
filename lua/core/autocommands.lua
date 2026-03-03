vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank {
            higroup = 'IncSearch',
            timeout = 100,
        }
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        if vim.tbl_contains({ 'lua', 'terminal' }, vim.bo.filetype) then
            vim.opt.spell = false
        end
    end,
})

-- Treesitter fix to force connection
vim.treesitter.language.register('c', 'h')
vim.treesitter.language.register('cpp', { 'hpp', 'hxx', 'hh', 'h++' })

local force_treesitter_langs = { 'python', 'c', 'cpp', 'h', 'hpp', 'cmake', 'make' }
vim.api.nvim_create_autocmd('FileType', {
    pattern = force_treesitter_langs,
    callback = function(ev)
        local lang = vim.bo[ev.buf].filetype
        vim.defer_fn(function()
            local ok, parser = pcall(vim.treesitter.get_parser, ev.buf, lang)
            if ok and parser then
                vim.treesitter.start(ev.buf, lang)
                vim.b[ev.buf].ts_highlight = true
                vim.bo[ev.buf].syntax = 'off'
            else
                local filename = vim.fn.expand '%:e'
                if filename == 'h' then
                    vim.treesitter.start(ev.buf, 'c')
                elseif filename == 'hpp' or filename == 'hxx' then
                    vim.treesitter.start(ev.buf, 'cpp')
                end
            end
        end, 50)
    end,
})
