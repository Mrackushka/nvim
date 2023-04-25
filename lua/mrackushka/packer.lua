local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer... Close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

-- Plugins
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
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
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

    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }

    --use { 'doums/darcula' }
    use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }
    use { "ellisonleao/gruvbox.nvim" }
    use { 'folke/tokyonight.nvim' }
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "rebelot/kanagawa.nvim" }
    use { "bluz71/vim-moonfly-colors", as = "moonfly" }
    use { "savq/melange-nvim" }
    use { 'luisiacc/gruvbox-baby', branch = 'main' }
    use { 'https://github.com/ap/vim-css-color' }
    use { 'preservim/nerdcommenter' }
    use { 'mattn/emmet-vim' }
    use { 'https://github.com/preservim/tagbar' }
    use { 'https://github.com/Pocco81/auto-save.nvim.git' }
    use { 'mg979/vim-visual-multi', branch = 'master' }
    use { 'nvim-tree/nvim-tree.lua' }
    use { 'ThePrimeagen/vim-be-good' }
    use { 'eandrju/cellular-automaton.nvim' }
    use { 'nvim-treesitter/nvim-treesitter-context' }
    use { 'tpope/vim-fugitive' }
    use { 'jose-elias-alvarez/null-ls.nvim' }
    use { 'rafamadriz/friendly-snippets' }

    --use { 'xiyaowong/transparent.nvim' }
    --use {
    --"folke/trouble.nvim",
    --requires = "nvim-tree/nvim-web-devicons",
    --config = function()
    --require("trouble").setup {
    ---- your configuration comes here
    ---- or leave it empty to use the default settings
    ---- refer to the configuration section below
    --}
    --end
    --}

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
