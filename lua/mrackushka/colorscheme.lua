--local colorscheme = 'darcula-solid-custom'
--local colorscheme = 'darcula-solid'
local colorscheme = 'gruvbox-baby'
--local colorscheme = 'tokyonight-night'
--local colorscheme = 'gruvbox'
--local colorscheme = 'catppuccin'
--local colorscheme = 'kanagawa-dragon'
--local colorscheme = 'moonfly'
--local colorscheme = 'melange'

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
    vim.notify('Colorscheme ' .. colorscheme .. ' not found!')
    return
end
