-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Font
vim.g.have_nerd_font = true

-- Lines
vim.opt.foldenable = false
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.signcolumn = 'yes'
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.cursorline = true
vim.opt.conceallevel = 0
vim.g.syntax_conceal = 0
vim.g.tex_conceal = ''
vim.opt.colorcolumn = '100'

-- Line indents
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Spell checking
vim.opt.spell = true
vim.opt.spelllang = 'en_us'
vim.opt.spellcapcheck = ''
vim.opt.spelloptions:append 'camel'
vim.opt.spellfile = vim.fn.stdpath 'config' .. '/spell/en.utf-8.add'

-- General
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.guicursor = 'n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50'
vim.opt.clipboard = 'unnamedplus'
