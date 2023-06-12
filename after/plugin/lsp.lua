local lsp_status_ok, lsp = pcall(require, 'lsp-zero')
if not lsp_status_ok then
    return
end

lsp.preset({})
lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set('n', '<c-k>', vim.lsp.buf.hover)
end)


-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.ensure_installed({
    'lua_ls',
    'pyright',
})

local mason_null_l_status_ok, mason_null_ls = pcall(require, 'mason-null-ls')
if not mason_null_l_status_ok then
    return
end

mason_null_ls.setup({
    ensure_installed = {
        'black',
        'flake8',
        'beautysh',
        'fixjson',
        'html-lsp',
        'jsonlint',
        'shellcheck',
        'sql-formatter',
        'css-lsp',
    }
})

lsp.setup()


local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    return
end

local cmp_action = lsp.cmp_action()


local vscode_status_ok, vscode = pcall(require, 'luasnip.loaders.from_vscode')
if not vscode_status_ok then
    return
end
vscode.lazy_load()

cmp.setup({
    --completion = {
    --autocomplete = false
    --},
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'luasnip' },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        -- changing the order of fields so the icon is the first
        fields = { 'menu', 'abbr', 'kind' },
        -- here is where the change happens
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
                nvim_lua = 'Π',
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})
