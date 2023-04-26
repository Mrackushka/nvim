local g = vim.g
local o = vim.o
local opt = vim.opt


--Test options
--vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
--vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
--vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
--vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
--vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
--vim.opt.pumheight = 10                          -- pop up menu height
--vim.opt.showtabline = 2                         -- always show tabs
--vim.opt.smartindent = true                      -- make indenting smarter again
--vim.opt.shortmess:append "c"
--vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
--vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
--o.path = o.path + '**' --???


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


--vim.cmd.colorscheme('darcula')
--vim.api.nvim_set_hl(0, 'Normal', { ctermbg=nil, bg=nil })
--vim.api.nvim_set_hl(0, 'StatusLine', { ctermbg=nil, bg=nil })
--vim.api.nvim_set_hl(0, 'StatusLineNc', { ctermbg=nil, bg=nil })
--vim.api.nvim_set_hl(0, 'CursorLine', { ctermbg=nil, bg=nil })
--vim.api.nvim_set_hl(0, 'CursorLineNr', { ctermbg=nil, bg=nil })
--vim.api.nvim_set_hl(0, 'LineNr', { ctermbg=nil, bg=nil })
--vim.api.nvim_set_hl(0, 'SignColumn', { ctermbg=nil, bg=nil })
--vim.api.nvim_set_hl(0, 'Pmenu', { ctermbg=nil, bg=nil })
--vim.api.nvim_set_hl(0, 'VertSplit', { ctermbg=nil, bg=nil })



-- Better editing experience
o.autochdir = true
o.autoindent = true
o.cindent = true
o.encoding = 'utf-8'
o.expandtab = true
o.list = true --???
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂" --???
o.scrolloff = 8
o.sidescrolloff = 8
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
--o.updatetime = 300 --(400 default)


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
o.splitright = true
o.splitbelow = true


--Map <leader> to coma
g.mapleader = ','
g.maplocalleader = ','

