--Ensuring Nvim-CMP Is Working
local nvim_cmp_status,nvim_cmp = pcall(require,'cmp')
if (not nvim_cmp_status) then
	print("Nvim-CMP Is Not Working")
	return
end
--Ensuring LspKind Is Working
local lspkind_status,lspkind = pcall(require,'lspkind')
if (not lspkind_status) then
	print("CMP-Kind Is Not Working")
	return
end

--LspKind Setup
lspkind.init({
    mode = 'symbol_text',
    preset = 'codicons',
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})

--Nvim-CMP Setup
vim.opt.completeopt = "menu,menuone,noselect"
nvim_cmp.setup({
    completion = {
        --autocomplete = false,
        completeopt = 'menu,menuone,noinsert',
	},
	window = {
        --documentation = nvim_cmp.config.window.bordered(),
        --documentation = { border = { '▗', '▄', '▖', '▌', '▘', '▀', '▝', '▐' },
        --winhighlight = 'NormalFloat:NormalFloat,FloatBorder:VertSplit',

        documentation = nvim_cmp.config.window.bordered({border = { "☽", "-", "☾", "┋", "☾", "-", "☽", "┋"}}),
        --completion = nvim_cmp.config.window.bordered({border='rounded'})
        completion = nvim_cmp.config.window.bordered({border = { "☽", "-", "☾", "┋", "☾", "-", "☽", "┋"}}),
        --winhighlight= 'NormalFloat:NormalFloat,FloatBorder:VertSplit'})
    },
	snippet = {
		expand = function(args)
            --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            --require'snippy'.expand_snippet(args.body) -- For `snippy` users.
            --vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
	},
	mapping = nvim_cmp.mapping.preset.insert({
		["<C-p>"] = nvim_cmp.mapping.select_prev_item(), -- Previous Suggestion
		["<C-n>"] = nvim_cmp.mapping.select_next_item(), -- Next Suggestion
		["<C-k>"] = nvim_cmp.mapping.scroll_docs(-4), -- Scroll Docs Up
		["<C-j>"] = nvim_cmp.mapping.scroll_docs(4), -- Scroll Docs Down
		["<C-Space>"] = nvim_cmp.mapping.complete(), -- Show Completion Suggestions
		["<C-e>"] = nvim_cmp.mapping.abort(), -- Close Completion Window
		["<Tab>"] = nvim_cmp.mapping.confirm({
			behavior = nvim_cmp.ConfirmBehavior.Replace,
			select = true
		}),
	}),
	sources = nvim_cmp.config.sources({
		{name = "nvim_lsp"}, --LSP Source
        --{name = "vsnip"}, --For vsnip users
		--{name = "luasnip"}, --Lua Snippet Engine
        --{name = "snippy"}, --For snippy users
        --{name = "ultisnips"}, --For ultisnips users
		{name = "buffer"}, --Current Buffer Source
		{name = "path"} --Path Source
	}),
	formatting = {
		format = lspkind.cmp_format({
			with_text = false,
			maxWidht = 50
		})
	}
})

-- Set configuration for specific filetype.
nvim_cmp.setup.filetype('gitcommit', {
    sources = nvim_cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
nvim_cmp.setup.cmdline({ '/', '?' }, {
    mapping = nvim_cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

