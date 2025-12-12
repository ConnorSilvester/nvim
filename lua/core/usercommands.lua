vim.cmd 'highlight clear SpellBad'
vim.cmd 'highlight SpellBad guifg=Blue gui=undercurl'
vim.cmd 'highlight SpellCap guifg=Blue gui=undercurl'
vim.cmd 'highlight SpellRare guifg=Blue gui=undercurl'
vim.cmd 'highlight SpellLocal guifg=Blue gui=undercurl'

function _G.create_note()
    local title = vim.fn.input 'Enter note title: '
    local note_dir = '/home/connor/MainFiles/Obsidian/Main/inbox'
    local file_name = title:gsub(' ', '_')
    local formatted_file_name = os.date '%d-%m-%Y' .. '_' .. file_name .. '.md'
    local note_filename = note_dir .. '/' .. formatted_file_name
    local file = io.open(note_filename, 'w')
    if file then
        file:close()
        vim.cmd('cd ' .. note_dir)
        vim.cmd('edit ' .. note_filename)
    else
        print('Error creating note: ' .. note_filename)
    end
end

function _G.enter_terminal_mode()
    vim.cmd 'startinsert'
end

local util = vim.lsp.util
local original_open_floating_preview = util.open_floating_preview
function util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}

    opts.border = opts.border or 'single'
    local max_width = opts.max_width or 80
    local max_height = opts.max_height or 25

    if type(contents) == 'string' then
        contents = { contents }
    end

    local content_width = 0
    for _, line in ipairs(contents) do
        if type(line) == 'string' then
            content_width = math.max(content_width, #line)
        end
    end

    opts.width = math.min(content_width + 1, max_width)
    opts.height = math.min(#contents, max_height)

    opts.width = math.max(1, math.floor(opts.width))
    opts.height = math.max(1, math.floor(opts.height))

    return original_open_floating_preview(contents, syntax, opts, ...)
end
