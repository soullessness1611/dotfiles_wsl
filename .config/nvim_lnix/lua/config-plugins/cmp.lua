local status, nvim_cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'

local function formatForTailwindCSS(entry, vim_item)
  if vim_item.kind == 'Color' and entry.completion_item.documentation then
    local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
    if r then
      local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
      local group = 'Tw_' .. color
      if vim.fn.hlID(group) < 1 then
        vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
      end
      vim_item.kind = "●"
      vim_item.kind_hl_group = group
      return vim_item
    end
  end
  vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
  return vim_item
end

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
    }
})

--Cmp Setup
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
            --require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            --require'snippy'.expand_snippet(args.body) -- For `snippy` users.
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
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
        {name = "ultisnips"}, --For ultisnips users
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

