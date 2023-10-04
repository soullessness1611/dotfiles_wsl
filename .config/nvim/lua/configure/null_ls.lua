local status, null_ls = pcall(require, 'null-ls')
if (not status) then
    print('null-ls not working')
    return
end

null_ls.setup({
    sources = {
        --Formatting
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.formatting.black,
        --Additional formatting
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.isort,
        --Code action refatoring
        null_ls.builtins.code_actions.refatoring,
        --Diagnostics
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff
    }
})
