--Ensuring Searchbox Is Working
local status,searchbox = pcall(require,'searchbox')
if (not status) then
	print("Searchbox Is Not Working")
	return
end

--Searchbox etup
searchbox.setup{}

--Keybinds
vim.keymap.set('n',';f',':SearchBoxIncSearch<CR>',{silent=true})
vim.keymap.set('n',';rp',':SearchBoxReplace<CR>',{silent=true})
