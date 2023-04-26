local npairs_status_ok, npairs = pcall(require, 'nvim-autopairs')
if not npairs_status_ok then
    return
end


npairs.setup({
    check_ts = true,
    ts_config = {
        lua = { 'string' }, -- it will not add a pair on that treesitter node
        javascript = { 'template_string' },
        java = false,       -- don't check treesitter on java
    },
    enable_check_bracket_line = false
})


local Rule = require('nvim-autopairs.rule')
local ts_conds = require('nvim-autopairs.ts-conds')


-- press % => %% only while inside a comment or string
npairs.add_rules({
    Rule('%', '%', 'lua')
        :with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
    Rule('$', '$', 'lua')
        :with_pair(ts_conds.is_not_ts_node({ 'function' }))
})
