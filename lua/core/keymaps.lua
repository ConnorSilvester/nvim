vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', 'qq', '<Esc>')
vim.keymap.set('v', 'qq', '<Esc>')
vim.keymap.set('x', 'qq', '<Esc>')

-- Disable arrow keys
vim.keymap.set('n', '<left>', '')
vim.keymap.set('n', '<right>', '')
vim.keymap.set('n', '<up>', '')
vim.keymap.set('n', '<down>', '')

-- Change focus
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- Workspace
vim.keymap.set('n', '<leader>ws', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>wc', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>wr', '<C-w>=', { desc = 'Resize window back to equal' })
vim.keymap.set('n', '<leader>we', '<cmd>close<CR>', { desc = 'Close current split' })

vim.keymap.set('n', '<leader>wt', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>wq', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>wn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>wp', '<cmd>tabp<CR>', { desc = 'Go to prev tab' })
vim.keymap.set('n', '<leader>ww', 'g<C-g>', { desc = 'File Info Word Count' })

-- Restart Java LSP
vim.keymap.set('n', '<leader>wj', ':LspRestart jdtls<CR>', { noremap = true, silent = true })

-- Save quit
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':wq<CR>', { desc = 'Quit and save' })
vim.keymap.set('n', '<leader>Q', ':q!<CR>', { desc = 'Quit without saving' })

-- Search and replace word under the cursor
vim.keymap.set('n', '<leader>rR', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { desc = 'Search and replace word under the cursor' })

-- Insert Tabs and New Lines
vim.keymap.set('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })
vim.keymap.set('x', '<Tab>', '>gv', { noremap = true, silent = true })
vim.keymap.set('x', '<S-Tab>', '<gv', { noremap = true, silent = true })

-- Spell check remaps
vim.keymap.set('n', '<leader>ga', 'zg', { noremap = true, silent = true, desc = 'Add word to spell list' })
vim.keymap.set('n', '<leader>gA', 'zug', { noremap = true, silent = true, desc = 'Remove word from spell list' })
vim.keymap.set('n', '<leader>gg', 'z=', { noremap = true, silent = true, desc = 'Replace spelling mistake' })
vim.keymap.set('n', '<leader>gG', ':spellr<CR>', { noremap = true, silent = true, desc = 'Replace spelling mistake' })
vim.keymap.set('n', '<leader>gn', ']sz=', { noremap = true, silent = true, desc = 'Next spelling error' })
vim.keymap.set('n', '<leader>gN', '[sz=', { noremap = true, silent = true, desc = 'Previous spelling error' })
vim.keymap.set('n', '<leader>gt', ':set spell!<CR>', { noremap = true, silent = true, desc = 'Toggle spell checking' })

-- Obsidian Keybindings
vim.keymap.set('n', '<leader>oo', ':cd /home/connor/MainFiles/Obsidian/Main<CR>', { noremap = true, silent = true, desc = 'Obsidian: CD to vault' })
vim.keymap.set('n', '<leader>on', ':lua create_note()<CR>', { noremap = true, silent = true, desc = 'Obsidian: New Note' })
vim.keymap.set('n', '<leader>ol', ':ObsidianBacklinks<CR>', { noremap = true, silent = true, desc = 'Obsidian: Backlinks' })
vim.keymap.set('n', '<leader>ot', ':ObsidianTemplate new_note_template.md<CR>', { noremap = true, silent = true, desc = 'Obsidian: Add not template' })
vim.keymap.set('n', '<leader>of', ':s/\\(# \\)[^_]*_/\\1/ | s/_/ /g | nohlsearch<CR>', { noremap = true, silent = true, desc = 'Obsidian: Format title' })
vim.keymap.set('n', '<leader>op', ':ObsidianPasteImg<CR>', { noremap = true, silent = true, desc = 'Obsidian: Paste Image' })
vim.keymap.set('n', '<leader>od', ':lua RemoveBeforePipe()<CR>', { noremap = true, silent = true, desc = 'Obsidian: RemoveBeforePipe' })

-- Normal Vim remaps
vim.keymap.set('n', 'dc', 'd$', { desc = 'Delete to end of line' })
vim.keymap.set('n', '<C-b>', '0', { desc = 'Go to start of line' })

vim.keymap.set('n', '<C-d>', '<C-d>', { desc = 'Center after jump down' })
vim.keymap.set('n', '<C-u>', '<C-u>', { desc = 'Center after jump up' })

vim.keymap.set({ 'n', 'v' }, '<C-k>', '{', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-j>', '}', { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>h', '<C-o>', { noremap = true, silent = true, desc = 'Next Jump' })
vim.keymap.set('n', '<Leader>l', '<C-i>', { noremap = true, silent = true, desc = 'Prev Jump' })

vim.keymap.set('n', '<Tab>', '%', { noremap = true, silent = true, desc = 'Next Buffer' })

-- toggle-term
vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR><cmd>lua vim.defer_fn(enter_terminal_mode, 50)<CR>', { noremap = true, silent = true, desc = 'Toggle Floating Terminal' })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n><cmd>ToggleTerm<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-q>', [[<C-\><C-n><cmd>ToggleTerm<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-d>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-u>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- markdown-preview.nvim
vim.keymap.set('n', '<leader>tg', ':MarkdownPreview<CR>', { noremap = true, silent = true, desc = 'Markdown Preview Online' })

-- nvim-tree
vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle find file' })
vim.keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })
vim.keymap.set('n', '<leader>e=', '<cmd>NvimTreeResize +10<CR>', { desc = 'Extend' })
vim.keymap.set('n', '<leader>e-', '<cmd>NvimTreeResize -10<CR>', { desc = 'Shrink' })

-- noice.nvim
vim.keymap.set('n', '<leader>nn', '<cmd>Noice<cr>', { desc = 'Noice Messages' })
vim.keymap.set('n', '<leader>na', '<cmd>NoiceAll<cr>', { desc = 'Noice All Messages' })
vim.keymap.set('n', '<leader>nl', '<cmd>NoiceLast<cr>', { desc = 'Noice Last' })
vim.keymap.set('n', '<leader>nt', '<cmd>NoiceTelescope<cr>', { desc = 'Noice Telescope' })
vim.keymap.set('n', '<leader>ne', '<cmd>NoiceErrors<cr>', { desc = 'Noice Errors' })

-- conform
vim.keymap.set('n', '<leader>f', '<cmd>lua require("conform").format()<cr>', { noremap = true, silent = true, desc = '[F]ormat Buffer' })

-- random
vim.keymap.set('n', '<BS>', 'o<ESC>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b', [[^i- <Esc>l]], { noremap = true, silent = true })
vim.keymap.set('n', '<C-x>', [[^i- [ ] <Esc>l]], { noremap = true, silent = true })
