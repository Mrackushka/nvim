local zen_mode_status_ok, zen_mode = pcall(require, 'zen-mode')
if not zen_mode_status_ok then
    return
end


zen_mode.setup {
    window = {
        backdrop = 1,
        --width = 0.62,
        width = 98,
        options = {
            number = false,
            relativenumber = false,
        }
    },
}
