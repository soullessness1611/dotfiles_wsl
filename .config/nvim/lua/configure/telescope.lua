--Ensuring Telescope Is Working
local status,telescope = pcall(require,'telescope')
if (not status) then
	print("Telescope Is Not Working")
	return
end

--Telescope Setup
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

telescope.setup{
    defaults = {
        mappings = {
            n = {
                ['q'] = actions.close
            }
        }
    }
}

--Telescope Keymaps
vim.keymap.set('n', ';z',
  function()
    builtin.find_files()
end)
