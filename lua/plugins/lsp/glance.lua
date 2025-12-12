return {
    'dnlhc/glance.nvim',
    keys = {
        { '<leader>gr', '<cmd>Glance references<cr>', desc = 'Glance references' },
        { '<leader>gd', '<cmd>Glance definitions<cr>', desc = 'Glance definitions' },
        { '<leader>gy', '<cmd>Glance type_definitions<cr>', desc = 'Glance type_definitions' },
        { '<leader>gm', '<cmd>Glance implementations<cr>', desc = 'Glance implementations' },
    },
    config = true,
}
