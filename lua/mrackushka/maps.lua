--Function for easy mappings
local function map(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = true })
end


--Mappings
map('n', '<leader><space>', ':nohlsearch<cr>')
map('n', 'q:', '<nop>')
map('n', 'Q', '<nop>')
map({ 'n', 'i', 'v' }, '<f1>', '<nop>')
map('v', '<s-j>', '<nop>')
map('v', '<s-k>', '<nop>')
map('n', '<leader>gg', ':!google ')
map('n', 'K', ':bnext<cr>')
map('n', 'J', ':bprevious<cr>')
map('n', '<leader>bd', ':bdelete!<cr>')
map('n', 'H', ':wincmd h<cr>')
map('n', 'L', ':wincmd l<cr>')
map('n', '<C-Up>', ':resize +2<cr>')
map('n', '<C-Down>', ':resize -2<cr>')
map('n', '<C-Left>', ':vertical resize -2<cr>')
map('n', '<C-Right>', ':vertical resize +2<cr>')
map('n', '0', '0zz')
map("i", "jk", "<esc>")
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "p", '"_dP')


--Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fh', '<cmd>Telescope find_files hidden=true<cr>')
map('n', '<leader>gh',
    ":lua require'telescope.builtin'.live_grep{" ..
    "vimgrep_arguments = {" ..
    "'rg'," ..
    "'--color=never'," ..
    "'--no-heading'," ..
    "'--with-filename'," ..
    "'--line-number'," ..
    "'--column'," ..
    "'--smart-case'," ..
    "'-u'," ..
    "'--hidden'" ..
    "}" ..
    "}<cr>"
)


--MarkdownPrewiev
vim.api.nvim_create_autocmd(
    'FileType', {
        pattern = 'markdown',
        callback = function()
            vim.api.nvim_buf_set_keymap(0, 'n', '<leader>md', ':MarkdownPreviewToggle<cr>', { silent = true })
        end
    }
)


--Command message hider
vim.api.nvim_create_autocmd(
    'CursorHold', {
        pattern = '*',
        command = ':echo'
    }
)


-- BufferLine
map('n', '<leader>bb', ':BufferLinePick<cr>')
map('n', '<leader>bD', ':BufferLinePickClose<cr>')
map('n', '<leader>bp', ':BufferLineTogglePin<cr>')


-- LoggleTerm
map('n', '<leader>lg', ':lua _LAZYGIT_TOGGLE()<cr>')
map('n', '<leader>ht', ':lua _HTOP_TOGGLE()<cr>')
map('n', '<leader>py', ':lua _PYTHON_TOGGLE()<cr>')


--CelluarAutomation
map('n', '<leader>mir', ':CellularAutomaton make_it_rain<cr>')
map('n', '<leader>gol', ':CellularAutomaton game_of_life<cr>')


--ChatGPT
map('n', 'gpt', ':ChatGPT<cr>')
map('v', 'gpt', '<esc>:ChatGPTEditWithInstructions<cr>')


--Packer
map('n', '<leader>ps', ':so<cr>:PackerSync<cr>')


--NvimTree
map('n', '<leader>e', ':NvimTreeFindFileToggle<cr>')


--Tagbar
map('n', '<f8>', ':TagbarToggle<cr>')


-- Zen-mode
map('n', '<f1>', ':ZenMode<cr>')


--Function for easy compiler mappings
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


--Compiler mappings
map_compiler('python', 'n', '<f9>', ':w<cr>:term clear; py %<cr>:startinsert<cr>')
map_compiler('python', 'n', '<f10>', ':w<cr>:term clear; /mnt/d/Apps/Python3.11/python.exe %<cr>:startinsert<cr>')
map_compiler('cs', 'n', '<f9>', ':w<cr>:term clear; dotnet run --project %<cr>:startinsert<cr>')
map_compiler('html', 'n', '<f9>', ':w<cr>:!explorer $(wslpath -w %)<cr><cr>')
map_compiler('sh', 'n', '<f9>', ':w<cr>:term clear; bash %<cr>:startinsert<cr>')
