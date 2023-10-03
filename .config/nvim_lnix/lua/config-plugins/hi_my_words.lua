-- Ensuring Hi-MY-Words it's working
local status, hi_my_words = pcall(require, 'hi-my-words')
if (not status) then
	print('Hi-My-Words not working')
	return
end

-- Hi-My-Words Setup
hi_my_words.setup()

-- Keymap
vim.api.nvim_set_keymap("n", "<Space>m", ":HiMyWordsToggle<CR>", { noremap = true })
