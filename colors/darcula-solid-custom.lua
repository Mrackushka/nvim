vim.opt.background = 'dark'
vim.g.colors_name = 'darcula-solid-custom'

local lush = require('lush')
local darcula_solid = require('lush_theme.darcula-solid')
local spec = lush.extends({ darcula_solid }).with(function()
    local bg = nil
    return {
        Normal { fg = darcula_solid.Normal.fg, bg = bg },
        NormalFloat { fg = darcula_solid.NormalFloat.fg, bg = bg },
        NormalNC { fg = darcula_solid.NormalFloat.fg, bg = bg },

        NonText { fg = bg },

        Cursor { fg = bg, bg = darcula_solid.Cursor.fg },
        TermCursor { fg = bg, bg = darcula_solid.TermCursor.fg },
        ColorColumn { bg = bg },
        CursorColumn { bg = bg },

        MatchParen { fg = darcula_solid.MatchParen.pop, bg = bg },

        VertSplit { fg = bg, bg = bg },
        Folded { fg = darcula_solid.Folded.comment, bg = bg },

        Pmenu { bg = bg },
        PmenuSel { bg = bg },

        StatusLine { bg = bg },
        StatusLineNC { fg = darcula_solid.faded, bg = bg },

        TabLine { bg = bg },
        TabLineFill { bg = bg },
        TabLineSel { bg = bg },

        Search { fg = bg, bg = darcula_solid.Search.yellow },

        --Visual { bg = bg },
        --VisualNOS { bg = bg },

        LspReferenceText { bg = bg },
        LspReferenceRead { bg = bg },
        LspReferenceWrite { bg = bg },

        NvimTreeNormal { bg = bg, fg = darcula_solid.NvimTreeNormal.fg },
    }
end)

lush(spec)
