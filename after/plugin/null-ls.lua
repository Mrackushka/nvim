local null_l_status_ok, null_ls = pcall(require, 'null-ls')
if not null_l_status_ok then
    return
end


local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics


null_ls.setup({
    debug = true,
    sources = {
        --formatting.yapf,
        formatting.black.with {
            --extra_args = {
            ----"--skip-string-normalization",
            --"--line-length=79"
            --}
        },
        diagnostics.flake8.with({
            extra_args = {
                "--extend-ignore=F401,F841",
                "--max-line-length=88"
            }
        }),

        formatting.beautysh,
        diagnostics.shellcheck,
        formatting.sql_formatter.with {
            extra_args = {
                "--config=/home/mrackushka/.config/nvim/after/plugin/sql_formatter.json"
            }
        },

        diagnostics.jsonlint,
        formatting.fixjson.with {
            extra_args = {
                "--indent=4"
            }
        },
        --formatting.prettier,
    },
})
