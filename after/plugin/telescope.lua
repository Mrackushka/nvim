local open_in_nvim_tree = function(prompt_bufnr)

    local action_state_status_ok, action_state = pcall(require, 'telescope.actions.state')
    if not action_state_status_ok then
        return
    end

    local Path_status_ok, Path = pcall(require, 'plenary.path')
    if not Path_status_ok then
        return
    end

    local actions_status_ok, actions = pcall(require, 'telescope.actions')
    if not actions_status_ok then
        return
    end

    local entry = action_state.get_selected_entry()[1]
    local entry_path = Path:new(entry):parent():absolute()
    actions._close(prompt_bufnr, true)
    entry_path = Path:new(entry):parent():absolute()
    entry_path = entry_path:gsub("\\", "\\\\")

    vim.cmd("NvimTreeClose")
    vim.cmd("NvimTreeOpen " .. entry_path)

    local file_name = nil
    for s in string.gmatch(entry, "[^/]+") do
        file_name = s
    end

    vim.cmd("/" .. file_name)
end


local telescope_status_ok, telescope = pcall(require, 'telescope')
if not telescope_status_ok then
    return
end
telescope.setup {
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
