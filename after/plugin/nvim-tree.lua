vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", { silent = true, noremap = true })

local function open_silent(node)
    local nt_api = require("nvim-tree.api")
    nt_api.node.open.edit(node)
    nt_api.tree.focus()
end

require("nvim-tree").setup({
    diagnostics = {
        enable = true,
    },
    filters = {
        custom = { "^__pycache__$" },
        dotfiles = true
    },
    view = {
        mappings = {
            list = {
                { key = "O", action = "open_silent", action_cb = open_silent },
            },
        }
    }
})

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        -- Only 1 window with nvim-tree left: we probably closed a file buffer
        if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
            local api = require('nvim-tree.api')
            -- Required to let the close event complete. An error is thrown without this.
            vim.defer_fn(function()
                -- close nvim-tree: will go to the last hidden buffer used before closing
                api.tree.toggle({ find_file = true, focus = true })
                -- re-open nivm-tree
                api.tree.toggle({ find_file = true, focus = true })
                -- nvim-tree is still the active window. Go to the previous window.
                vim.cmd("wincmd p")
            end, 0)
        end
    end
})
