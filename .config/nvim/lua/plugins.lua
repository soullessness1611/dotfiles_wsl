-- Ensuring Packer is installed
local status, packer = pcall(require,'packer')
if (not status) then
    print('Packer is not installed')
    return
end

-- Adding Packer
vim.cmd [[packadd packer.nvim]]

-- Packer Config for Floating Installing Window
packer.init{
    display = {
        open_fn = function()
            return require('packer.util').float{border = 'rounded'}
        end,
    },
}

-- Plugins Lists For Install
packer.startup(function(use)
    -- Packer Itself
    use 'wbthomason/packer.nvim'

    -- Colorschemes
    use {
        'svrana/neosolarized.nvim',
        requires = {
            'tjdevries/colorbuddy.nvim'
        }
    }
    use 'folke/tokyonight.nvim'

    -- Plenary Includes Usefull Function for Plugins
    use 'nvim-lua/plenary.nvim'

    -- UI Component Library For Neovim
    use 'MunifTanjim/nui.nvim'

    -- Web Dev Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Colorizer for Color Code Highlight
    use 'norcalli/nvim-colorizer.lua'

    -- Auto Pairs
    use 'windwp/nvim-autopairs'

    -- Auto tags close <div> </div>
    use 'windwp/nvim-ts-autotag'

    -- Better Search and Replace
    use 'VonHeikemen/searchbox.nvim'

    -- Lualine As the StatusLibe
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }

    -- Neovim Tree for Files Explorer and Telescope
    use {
        'nvim-tree/nvim-tree.lua',
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
    }

    -- BufferLine for Tabs
    use 'akinsho/bufferline.nvim'

    -- Treesitter For Syntax Highkight
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- CodeRunner for Compling and Running Code
    use 'CRAG666/code_runner.nvim'

    -- Git related and Version control
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup{}
        end
    }
    use {'tpope/vim-fugitive'} -- Git version control tool

    -- Indent Blankline
    use {
        'lukas-reineke/indent-blankline.nvim',
        requires = {
            'HiPhish/rainbow-delimiters.nvim'
        }
    }

    -- Surround
    use ({
        'kylechui/nvim-surround',
        tag = '*',
        config = function()
            require('nvim-surround').setup({})
        end
    })

    -- Multiple Cursors like Notepad++ feature
    use 'terryma/vim-multiple-cursors'

    -- Sneak, Easy and Quickly Search
    use 'justinmk/vim-sneak'

    -- Rainbow Bracket and Indent Rainbow
    use 'p00f/nvim-ts-rainbow'

    -- Troubleshooting LSP Popup
    use 'folke/trouble.nvim'

    -- Notify Popup
    use 'rcarriga/nvim-notify'

    -- Docs and Completions
    use 'folke/neodev.nvim'

    -- Popup and UI
--    use ({
--        'folke/noice/nivm',
--        config = function()
--            require('noice').setup({})
--        end,
--        requires = {
--            'MunifTanjim/nui.nvim',
--            'rcarriga/nvim-notify'
--        }
--    })

    -- Battery Monitoring conbination with Lualine
    use {
        'justinhj/battery.nvim',
        requires = {
            {'kyazdani42/nvim-web-devicons'},
            {'nvim-lua/plenary.nvim'}
        }
    }

    -- Batter Comment
    use 'Djancyp/better-comments.nvim'

    -- Colortils selection and preview Colors UI
    use {
        'max397574/colortils.nvim',
        cmd = 'Colortils',
        config = function()
            require('colortils').setup()
        end
    }

    -- Cellular Automaton (Text Animation)
    use 'eandrju/cellular-automaton.nvim'

    -- Highlight many instance words
    use 'dvoytik/hi-my-words.nvim'

    -- Zen Mode
    use {
        'folke/zen-mode.nvim',
        config = function()
            require('zen-mode').setup{}
        end
    }

    -- Twilight Section Show
    use {
        'folke/twilight.nvim',
        config = function()
            require('twilight').setup{}
        end
    }

    -- LSP Progressing
    use {
        'linrongbin16/lsp-progress.nvim',
        event = { 'VimEnter' },
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('lsp-progress').setup()
        end
    }

    -- Ripgrep Plugin (Treesitter required)
    use 'duane9/nvim-rg'

    -- Comments Line (gcc,gcb)
    use {
        'numToStr/Comment.nvim',
        requires = {
            'JoosepAlviste/nvim-ts-context-commentstring'
        }
    }

    -- Markdown Preview
    use ({
        'iamcco/markdown-preview.nvim',
        run = function()
            vim.fn['mkdp#util#install']()
        end
    })

    -- LSP Servers
    use {
        'williamboman/mason.nvim', --Mason UI Instaaler Manager
        'williamboman/mason-lspconfig.nvim', --Mason Configuration
        'neovim/nvim-lspconfig', --LSP Configuration
        'kkharji/lspsaga.nvim', --LSP Saga
        'mfussenegger/nvim-jdtls', --JSTLS For Java
        'jose-elias-alvarez/null-ls.nvim' --Use Neovim as a language server to inject LSP diagnotics, code action and more via Lua
    }

    -- AutoCompletion
    use {
        'hrsh7th/nvim-cmp', --Code Completion Plugin
        'hrsh7th/cmp-nvim-lsp', --LSP Snippets
        'onsails/lspkind.nvim', --VSCODE Like Pictograms
        'hrsh7th/cmp-buffer', --Current Buffer Sources
        'hrsh7th/cmp-path', --Path Completion
    }

    -- Snipppet
    use {
        'L3MON4D3/LuaSnip',
--        'honza/vim-snippets',
--        'rafamadriz/friendly-snippets',
--        config = function()
--            require'luasnip'.filetype_extend('ruby', {'rails'})
--        end
    }
--    use {
--        'SirVer/ultisnips',
--        'quangnguyen30192/cmp-nvim-ultisnips'
--    }
end)
