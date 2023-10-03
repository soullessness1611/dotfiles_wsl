--Ensuring Mason Is Working
local mason_status,mason = pcall(require,"mason")
if (not mason_status) then
	print("Mason Is Not Working")
	return
end
--Ensuring Mason-LSP Is Working
local mason_lsp_status,mason_lsp = pcall(require,"mason-lspconfig")
if (not mason_lsp_status) then
	print("Mason-LSP-Config Is Not Working")
	return
end
--Ensuring LSP-Config Is Working
local lsp_config_status,lsp_config = pcall(require,"lspconfig")
if (not lsp_config_status) then
	print("LSP-Config Is Not Working")
	return
end

--Mason Setup
mason.setup({
	ui = {
		icons = {
			package_installed = "✓"
		}
	}
})

--Mason-LSP Setup
mason_lsp.setup({
	ensure_installed = {
		"lua_ls","clangd","cssls","jsonls","pyright","tsserver","eslint","html","rust_analyzer","yamlls",
	}
})

--Disabeling The Sign Column In Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  signs = false,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover,{border = 'rounded'})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help,{border = 'rounded'})

--LSP-Config Setup


--Capabilities With Nvim-CMP
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

--Lua Setup
lsp_config.lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
--C/C++ Setup
lsp_config.clangd.setup{
	on_attach = on_attach,
	capabilities = capabilities
}
--CSS Setup
lsp_config.cssls.setup{
	on_attach = on_attach,
	capabilities = capabilities
}
--JSON Setup
lsp_config.jsonls.setup{
	on_attach = on_attach,
	capabilities = capabilities
}
--Python Setup
--lsp_config.pyright.setup{
--	on_attach = on_attach,
--	capabilities = capabilities

lsp_config.pyright.setup {
	on_attach = on_attach,
	settings = {
        pyright = {
            autoImportCompletion = true,
        },
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'openFilesOnly',
                useLibraryCodeForTypes = true,
                typeCheckingMode = 'off'
            }
        }
    }
}

--Javascript/Typescript Setup
lsp_config.tsserver.setup{
	on_attach = on_attach,
	capabilities = capabilities
}
--ESLINT Setup
lsp_config.eslint.setup{
	on_attach = on_attach,
	capabilities = capabilities
}
--HTML Setup
lsp_config.html.setup{
	on_attach = on_attach,
	capabilities = capabilities
}
--RUST Setup
lsp_config.rust_analyzer.setup{
	on_attach = on_attach,
	capabilities = capabilities
}
--Ruff Setup
--lsp_config.ruff_lsp.setup{
--	on_attach = on_attach,
--	capabilities = capabilities
--}
--YAML Setup
lsp_config.yamlls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes={'yaml','yml'},
    settings={
        yaml={
            hover=true,
            format={
                enable=true,
                singleQuote=true,
            },
            completion=true,
            validate=true,
            customTags={'!Ref','!ImportValue'},
            schemas={
                'https://raw.githubusercontent.com/awslabs/goformation/v4.19.5/schema/cloudformation.schema.json:"/*"',
                --kubernetes = "globPattern",
                --kubernetes = "*.yaml",
                kubernetes = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.28.2-standalone/all.json',
                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
                ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
                ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
            },
            schemaStore={
                enable=true,
            },
        },
    }
})
