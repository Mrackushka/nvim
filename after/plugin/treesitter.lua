local treesitter_status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not treesitter_status_ok then
    return
end


treesitter.setup({
    --ensure_installed = { 'lua', 'python', 'bash', 'javascript', 'typescript', 'c', 'rust' },
    ensure_installed = 'all',
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})
