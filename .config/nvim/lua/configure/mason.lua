local status, mason = pcall(require, "mason")
if (not status) then
    print('Mason not working')
    return
end

local mason_lsp_status, mason_lsp = pcall(require, "mason-lspconfig")
if (not mason_lsp_status) then
    print('Mason-lspconfig not working')
    return
end

--Mason Setup
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

--Mason-lspconfig Setup
mason_lsp.setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "cssls",
        "jsonls",
        "pyright",
        "tsserver",
        "eslint",
        "html",
        "rust_analyzer",
        "yamlls"
    },
    automatic_installation = true
})
