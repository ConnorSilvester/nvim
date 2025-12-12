return {
    'echasnovski/mini.move',
    version = '*',
    config = function()
        require('mini.move').setup {
        mappings = {
            line_left = '<M-h>',
            line_right = '<M-l>',
                line_up = '<M-k>',
                line_down = '<M-j>',
            },
        }
    end,
}
