local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer not installed")
    return
end

--Adding Packer
vim.cmd [[packadd packer.nvim]]

--Packer Config for Floating Install Window
packer.init{
    display = {
        open_fn = function()
            return require("packer.util").float{
                border = "rounded"
            }
        end
    }
}

--Plugins Installing
packer.startup(function(use)
    --Packer Itself
    use 'wbthomason/packer.nvim'

    --ColorSchemes
    use {
        'svrana/neosolarized.nvim', --NoeSolarized Theme
        requires = {
            'tjdevries/colorbuddy.nvim' --NeoSolarized required
        }
    }
    use 'folke/tokyonight.nvim' --Tokyonight Theme

    --Plenary Includes Usefull Functions for Plugin
    use 'nvim-lua/plenary.nvim'

    --UI Component Library For Neovim
    use 'MunifTanjim/nui.nvim'

    --Status Line (Lualine)
    use { 
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }
    use {
        'justinhj/battery.nvim',
        requires = {
            {
                'kyazdani42/nvim-web-devicons'
            },
            {
                'nvim-lua/plenary.nvim'
            }
        }
    }

    --Telescope and Neovim Tree File Explorer
    use {'nvim-tree/nvim-tree.lua'}
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use 'nvim-telescope/telescope-file-browser.nvim'
    
    --Buffer Line
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    
    --Treesitter Highlight
    use {
    	'nvim-treesitter/nvim-treesitter',
    	run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    --Ripgrep Plugins (Treesitter requried)
    use 'duane9/nvim-rg'

    --Code Runner
    use 'CRAG666/code_runner.nvim'

    --Autopairs
    use 'windwp/nvim-autopairs'

    --Color code Hightlight
    use 'norcalli/nvim-colorizer.lua'

    --Git Version Control Plugin
    use {
        'tpope/vim-fugitive',
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup{}
        end
    }

    --Searchbox Better Search and Replace
    use {
        'VonHeikemen/searchbox.nvim',
        requires = {
            {'MunifTanjim/nui.nvim'}
        }
    }

    --Indent Blankline
    use 'lukas-reineke/indent-blankline.nvim'

    --Surrounding
    use {
        'kylechui/nvim-surround',
        tag = "*",
        config = function()
            require("nvim-surround").setup({})
        end
    }

    --Multiple Cursor Selection like notpad++
    use 'terryma/vim-multiple-cursors'

    --Sneak Easy and quickly search
    use 'justinmk/vim-sneak'

    --Rainbow bracker and Rainbow Indent Line
    use 'p00f/nvim-ts-rainbow'

    --Colortils view and adcvance selection corlors
    use {
        'max397574/colortils.nvim',
        cmd ="colortils",
        config = function()
            require('colortils').setup()
        end
    }

    --Text Animation
    use 'eandrju/cellular-automaton.nvim'

    --Hi-my-words Highlight instant words
    use 'dvoytik/hi-my-words.nvim'

    --Zen Mode
    use {
        'folke/zen-mode.nvim',
        config = function()
            require('zen-mode').setup {}
        end
        }

    --Twilight Mode (combination with Zen Mode)
    use {
        'folke/twilight.nvim',
        opts = {
            -- your configuration comes here
            -- or leavve it empty to use the default settins
            -- refer to cinfiguration section below
        },
	config = function()
		require("twilight").setup{}
	end
    }

    -- LSP Progressing combinding with Lualine
    use {
        'linrongbin16/lsp-progress.nvim',
        event = { 'VimEnter' },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lsp-progress').setup()
        end
    }

    --AutoTag Close <div> </div>
    use 'windwp/nvim-ts-autotag'

    --LSP Server
    use {
        'williamboman/mason.nvim', --Mason Installer Manager
        'williamboman/mason-lspconfig.nvim', --Mason Configuration
        'neovim/nvim-lspconfig', --Neovim LSP Configuration
        'kkharji/lspsaga.nvim', --LSP Saga
        'mfussenegger/nvim-jdtls', --JDTLS for Java
        'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    }

    --AutoCompletion Code
    use {
        'hrsh7th/nvim-cmp', --Code Completion Plugin
        'hrsh7th/cmp-nvim-lsp', --LSP Autocompletion
        'hrsh7th/cmp-buffer', --Cmp curent buffer source
        'hrsh7th/cmp-path', --Path Cmp
        'onsails/lspkind.nvim', --VSCODE like Pictograme (LSP icons)
    }
    use {
        'folke/neodev.nvim', --Docs Completion and Signature help
        requires = {
            "MunifTanjim/nui.nvim",
        }
    }

    --Snippet
    use {--For Luasnip user.
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip'
    }
    use {--For vsnip users.
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip'
    }
    use {--For Snippy users.
        'dcampos/nvim-snippy',
        'dcampos/cmp-snippy'
    }
--    use {--For Ultisnips users.
--        'SirVer/ultisnips',
--        'quangnguyen30192/cmp-nvim-ultisnips'
--    }
    use {--Other Snippets.
	'honza/vim-snippets',
	'rafamadriz/friendly-snippets',
	config = function()
		require'luasnip'.filetype_extend("ruby",{"rails"})
	end,
     }

     --Comment Line
     use {
         'numToStr/Comment.nvim',
         requires = {
             'JoosepAlviste/nvim-ts-context-commentstring'
         }
     }

     --Markdown Preview
     use({
         'iamcco/markdown-preview.nvim',
         run = function()
             vim.fn["mkdp#util#install"]()
         end,
     })

	-- UIs Popup and Notify Error including Activity Logs
    use {
        "folke/noice.nvim",
        event = {"VimEnter"},
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    }
end)
