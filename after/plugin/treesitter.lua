require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'python', 'bash', 'javascript', 'typescript', 'c', 'rust' },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})
