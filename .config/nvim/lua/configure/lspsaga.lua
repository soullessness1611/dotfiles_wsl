local status, saga = pcall(require, "lspsaga")
if (not status) then
    print('LspSaga not working')
    return
end

--LspSaga Setup
saga.init_lsp_saga{
    server_filetype_map = {
        typescript = 'typescript'
    }
}

--For NvimDev LspSaga
--saga.setup({
--  ui = {
--    border = 'rounded',
--  },
--  symbol_in_winbar = {
--    enable = false
--  },
--  lightbulb = {
--    enable = false
--  },
--  outline = {
--    layout = 'float'
--  }
--})

local opts = { noremap = true, silent = true, buffer = bufnr }
vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
vim.keymap.set("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opts) -- see definition and make edits in window
vim.keymap.set("n", ";D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
vim.keymap.set("n", ";d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
vim.keymap.set("n", ";.", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
