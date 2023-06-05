local toggleterm_status_ok, toggleterm = pcall(require, 'toggleterm')
if not toggleterm_status_ok then
    return
end


toggleterm.setup {
    open_mapping = [[<leader>t]],
    autochdir = false,
    direction = 'float',
    float_opts = {
        border = 'curved',
        width = vim.opt.columns:get() - 19, -- 146 - 19 == 127
        height = vim.opt.lines:get() - 8    -- 35 - 8 == 27
    },
}


local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })
function _HTOP_TOGGLE()
    htop:toggle()
end

local python = Terminal:new({ cmd = "ipy", hidden = true })
function _PYTHON_TOGGLE()
    python:toggle()
end
