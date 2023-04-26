--local colorscheme = 'darcula-solid-custom'
--local colorscheme = 'darcula-solid'
local colorscheme = 'gruvbox-baby'
--local colorscheme = 'tokyonight-night'
--local colorscheme = 'gruvbox'
--local colorscheme = 'catppuccin'
--local colorscheme = 'kanagawa-dragon'
--local colorscheme = 'moonfly'
--local colorscheme = 'melange'

local colorscheme_status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not colorscheme_status_ok then
    return
end
