local keymap = vim.keymap
--Opening Files
keymap.set('n', '<C-o>', ':edit . <Return>', { silent = true })
--Opening Files in VSPLIT
keymap.set('n', '<C-a>', ':vsplit . <Return>', { silent = true })
--Opening Files in SPLIT
keymap.set('n', '<C-s>', ':split . <Return>', { silent = true })
--Opening Files in TABS
keymap.set('n', '<S-t>', ':tabedit . <Return>', { silent = true })
--Switching To Next TAB
keymap.set('n', '<Tab>', ':tabnext <Return>', { silent = true })
--Switching To Previous TAB
keymap.set('n', '<S-Tab>', ':tabprevious <Return>', { silent = true })
--Getting Rid Of Search Highlighting
keymap.set('n', ';m', ':noh <Return>', { silent = true })
--Running Code With Code-Runner
keymap.set('n', ';q', ':RunCode <Return>', { silent = true })
--Changing The Home And End Key
keymap.set({ 'n', 'v' }, 'H', '^')
keymap.set({ 'n', 'v' }, 'L', '$')

-- Additional keymaps via Patiwat Nakara
local nvmap = vim.api.nvim_set_keymap
-- Toggle CursorLine
nvmap('n', 'tc', ':set cursorline!<CR>', { noremap = true })
-- Map Esc to jk
nvmap('i', 'jk', '<Esc>', { noremap = true })
-- Maps motion
nvmap('i', '<A-h>', '<Left>', { noremap = true })
nvmap('i', '<A-l>', '<Right>', { noremap = true })
nvmap('i', '<C-o>', '<Esc>A', { noremap = true })
nvmap('i', '<C-l>', '<Esc>lli', { noremap = true })
nvmap('i', '<A-9>', '<Esc>I', { noremap = true })
--nvmap('n','<C-t>',':NERDTreeTogle<CR>', {noremap = true})
-- Cellular - Automaton Keymap
vim.keymap.set("n", "fml", "<cmd>CellularAutomaton make_it_rain<CR>")
-- Twilight keymap
vim.keymap.set("n", ";tw", "<cmd>Twilight<CR>")
-- Zenmode
vim.keymap.set("n", "zm", "<cmd>ZenMode<CR>")
-- Map end line
nvmap('i', '<C-g>', '<Esc>Go', { noremap = true })

--Apply Base setup
local bind = vim.keymap.set
bind("n", "<leader>s", ":source $HOME/.config/nvim/lua/base.lua <CR>")
