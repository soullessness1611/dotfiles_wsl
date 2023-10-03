-- Ensuring nvim-ts-autotag it's working
local status, autotag = pcall(require, 'nvim-ts-autotag')
if (not status) then
	print('nvim-ts-autotag not working')
	return
end

autotag.setup({})
