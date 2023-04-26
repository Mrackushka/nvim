local bufferline_status_ok, bufferline = pcall(require, 'bufferline')
if not bufferline_status_ok then
    return
end

bufferline.setup {
    options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        always_show_bufferline = false,
    }
}
