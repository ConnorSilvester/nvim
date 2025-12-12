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
