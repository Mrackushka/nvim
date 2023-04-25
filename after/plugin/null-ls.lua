local null_ls = require("null-ls")


local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics


null_ls.setup({
    sources = {
        --formatting.yapf,
        formatting.black,
        --formatting.black.with {
            --extra_args = {
                --"--skip-string-normalization"
            --}
        --},
        diagnostics.flake8.with({
            extra_args = {
                "--extend-ignore=F401"
            }
        }),
    },
})
