return {
    'f-person/git-blame.nvim',
    event = 'VeryLazy',
    opts = {
        enabled = true,
        message_template = ' <summary> • <date> • <author> • <<sha>>',
        date_format = '%m-%d-%Y %H:%M:%S',
        virtual_text_column = 1,
    },
    keys = {
        { '<leader>gb', '<cmd>GitBlameToggle<cr>', desc = 'Toggle Git Blame' },
        { '<leader>go', '<cmd>GitBlameOpenFileURL<cr>', desc = 'Open Git URL' },
        { '<leader>gy', '<cmd>GitBlameCopyCommitURL<cr>', desc = 'Copy Git URL' },
    },
}
