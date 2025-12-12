return {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        workspaces = {
            {
                name = 'main',
                path = '/home/connor/MainFiles/Obsidian',
            },
        },
        mappings = {
            ['gf'] = {
                action = function()
                    return require('obsidian').util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
        },
        new_notes_location = 'inbox',
        disable_frontmatter = true,
        disable_syntax = true,
        templates = {
            folder = 'Main/templates',
            date_format = '%d-%m-%Y',
            time_format = '%H:%M',
        },
        attachments = {
            img_folder = '/home/connor/MainFiles/Obsidian/Main/assets/imgs',
            img_text_func = function(client, path)
                return string.format('![%s](%s)', path.name, path)
            end,
        },

        ui = {
            enable = false,
        },
    },
}
