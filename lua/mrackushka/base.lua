local g = vim.g
local o = vim.o
local opt = vim.opt


-- Better editor UI
o.cursorline = true
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = "yes"
o.showmode = false
o.ruler = false
o.laststatus = -1
o.showcmd = false
opt.termguicolors = true
opt.fillchars = {
    vert = "▕", -- alternatives │
    fold = " ",
    eob = " ", -- suppress ~ at EndOfBuffer
    diff = "╱", -- alternatives = ⣿ ░ ─
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸",
}


--Colorscheme
vim.cmd.colorscheme('darcula')
vim.api.nvim_set_hl(0, 'Normal', { ctermbg=nil, bg=nil })
vim.api.nvim_set_hl(0, 'StatusLine', { ctermbg=nil, bg=nil })
vim.api.nvim_set_hl(0, 'CursorLine', { ctermbg=nil, bg=nil })
vim.api.nvim_set_hl(0, 'CursorLineNr', { ctermbg=nil, bg=nil })
vim.api.nvim_set_hl(0, 'LineNr', { ctermbg=nil, bg=nil })
vim.api.nvim_set_hl(0, 'SignColumn', { ctermbg=nil, bg=nil })
vim.api.nvim_set_hl(0, 'Pmenu', { ctermbg=nil, bg=nil })


-- Better editing experience
o.autoindent = true
o.cindent = true
o.encoding = 'utf-8'
o.expandtab = true
o.list = true --???
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂" --???
o.scrolloff = 7
o.shellcmdflag = '-ic'
o.shiftwidth = 4
o.smarttab = true
o.softtabstop = -1 --If negative, shiftwidth value is used
--o.spell = true
--o.spelllang = 'en_us,uk'
o.tabstop = 4
o.textwidth = 79
o.wrap = false
--opt.mouse = 'a'


-- Decrease update time
--o.timeoutlen = 500
--o.updatetime = 200


--Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'


--Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true


--Undo and backup options
o.backup = false
o.swapfile = false
o.undofile = false
o.writebackup = false
--o.backupdir = '/tmp/'
--o.directory = '/tmp/'
--o.undodir = '/tmp/'


--Remember 50 items in commandline history
o.history = 50


--Better buffer splitting
o.splitright = true --???
o.splitbelow = true --???


--Map <leader> to coma
g.mapleader = ','
g.maplocalleader = ','


--o.completeopt = o.completeopt - 'preview' --???
--o.path = o.path + '**' --???
