local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end


--Mappings
map('n', '<leader><space>', ':nohlsearch<cr>')
map('n', 'q:', '<nop>')
map('n', 'Q', '<nop>')
map('n', '<leader>gg', ':!google ')
map('n', 'K', ':bnext<cr>')
map('n', 'J', ':bprevious<cr>')
map('n', ',gd', ':bdelete!<cr>')
map('n', 'H', ':wincmd h<cr>')
map('n', 'L', ':wincmd l<cr>')


--Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fh', '<cmd>Telescope find_files hidden=true<cr>')
map('n', '<leader>gh',
    ":lua require'telescope.builtin'.live_grep{"..
        "vimgrep_arguments = {"..
            "'rg',"..
            "'--color=never',"..
            "'--no-heading',"..
            "'--with-filename',"..
            "'--line-number',"..
            "'--column',"..
            "'--smart-case',"..
            "'-u',"..
            "'--hidden'"..
        "}"..
    "}<cr>"
)


--ChatGPT
map('n', 'gpt', ':ChatGPT<cr>')
map('v', 'gpt', '<esc>:ChatGPTEditWithInstructions<cr>')


--NvimTree
map('n', '<leader>e', ':NvimTreeToggle<cr>')


--Neoformat
map('n', '<f3>', ':Neoformat<cr>')


--Tagbar
map('n', '<f8>', ':TagbarToggle<cr>')


--Command message hider
vim.api.nvim_create_autocmd(
    'CursorHold', {
        pattern = '*',
        command = ':echo'
    }
)

--CelluarAutomation
map('n', '<leader>mir', ':CellularAutomaton make_it_rain<cr>')
map('n', '<leader>gol', ':CellularAutomaton game_of_life<cr>')


local function map_compiler(ft, m, k, v)
    vim.api.nvim_create_autocmd(
        'FileType', {
            pattern = ft,
            callback = function()
                vim.api.nvim_buf_set_keymap(0, m, k, v, { silent = true })
            end
        }
    )
end


map_compiler('python', 'n', '<f9>', ':w<cr>:term clear; py %<cr>:startinsert<cr>')
map_compiler('python', 'n', '<f10>', ':w<cr>:term clear; /mnt/d/Apps/Python3.11/python.exe %<cr>:startinsert<cr>')
map_compiler('cs', 'n', '<f9>', ':w<cr>:term clear; dotnet run --project %<cr>:startinsert<cr>')
map_compiler('html', 'n', '<f9>', ':w<cr>!explorer %<cr><cr>')
map_compiler('sh', 'n', '<f9>', ':w<cr>:term clear; bash %<cr>:startinsert<cr>')

