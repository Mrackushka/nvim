local bufferline_status_ok, bufferline = pcall(require, 'bufferline')
if not bufferline_status_ok then
    return
end


bufferline.setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree",
            }
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_buffer_default_icon = false,
        separator_style = "slope", -- or "slant"
        always_show_bufferline = false,
        sort_by = 'insert_at_end',
    }
}
