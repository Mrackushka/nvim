return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim' }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                                       -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },   -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },   -- Required
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                          , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'akinsho/bufferline.nvim', tag = "v3.*",
        requires = { { 'nvim-tree/nvim-web-devicons' } }
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'jackMort/ChatGPT.nvim',
        requires = { { 'MunifTanjim/nui.nvim' } }
    }

    use { 'doums/darcula' }
    use { 'https://github.com/ap/vim-css-color' }
    use { 'preservim/nerdcommenter' }
    use { 'mattn/emmet-vim' }
    use { 'https://github.com/preservim/tagbar' }
    use { 'https://github.com/Pocco81/auto-save.nvim.git' }
    use { 'mg979/vim-visual-multi', branch = 'master' }
    use { 'nvim-tree/nvim-tree.lua' }
    use { 'sbdchd/neoformat' }
    use { 'ThePrimeagen/vim-be-good' }
    use { 'eandrju/cellular-automaton.nvim' }
    use { 'nvim-treesitter/nvim-treesitter-context' }

    --use {{
    --'folke/trouble.nvim',
    --config = function{}
    --require{'trouble'}.setup {
    --icons = false,
    ---- your configuration comes here
    ---- or leave it empty to use the default settings
    ---- refer to the configuration section below
    --}
    --end
    --}}

    --use{'tpope/vim-fugitive'}
end)
