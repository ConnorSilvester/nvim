return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    enabled = true,
    opts = {
        preset = 'helix',
        expand = 0,
        spec = {
            {
                mode = { 'n', 'v' },
                { 'gr', group = '+LSP Functions' },
                { '<leader>s', group = '[S]earch' },
                { '<leader>g', group = '[G]lance' },
                { '<leader>e', group = '[E]xplorer' },
                { '<leader>w', group = '[W]ork Space' },
                { '<leader>t', group = '[T]oggleTerm' },
                { '<leader>r', group = '[R]ename' },
                { '<leader>n', group = '[N]oice' },
            },
        },
        win = {
            border = 'single',
            no_overlap = false,
            title_pos = 'center',
        },
        sort = { 'manual', 'group', 'lower' },
    },
}
