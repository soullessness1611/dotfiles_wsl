-- Ensuring Noice is working
local status, noice = pcall(require, 'noice')
if (not status) then
    print('Noice is not working')
    return
end

-- Noice Setup
noice.setup({
    -- Override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
    },
    -- you can enable a preset for easier configuration
    preset = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
    },
})

vim.keymap.set("n", "<leader>nl", function()
    require("noice").cmd("last")
end)

vim.keymap.set("n", "<leader>nh", function()
    require("noice").cmd("history")
end)

vim.keymap.set({"n", "i", "s"}, "<C-j>", function()
    if not require("noice.lsp").scroll(4) then
        return "<C-j>"
    end
end,{ silent = true, expr = true })

vim.keymap.set({"n", "i", "s"}, "<C-k>", function()
    if not require("noice.lsp").scroll(-4) then
        return "<C-k>"
    end
end, { silent = true, expr = true })
