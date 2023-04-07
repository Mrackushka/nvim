local open_in_nvim_tree = function(prompt_bufnr)
    local action_state = require "telescope.actions.state"
    local Path = require "plenary.path"
    local actions = require "telescope.actions"

    local entry = action_state.get_selected_entry()[1]
    local entry_path = Path:new(entry):parent():absolute()
    actions._close(prompt_bufnr, true)
    entry_path = Path:new(entry):parent():absolute()
    entry_path = entry_path:gsub("\\", "\\\\")

    vim.cmd("NvimTreeClose")
    vim.cmd("NvimTreeOpen " .. entry_path)

    file_name = nil
    for s in string.gmatch(entry, "[^/]+") do
        file_name = s
    end

    vim.cmd("/" .. file_name)
end


require("telescope").setup{
    defaults = {
        mappings = {
            i = {
                ["<C-o>"] = open_in_nvim_tree,
            },
            n = {
                ["<C-o>"] = open_in_nvim_tree,
            },
        },
    },
}
