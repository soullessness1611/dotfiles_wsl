--vim.cmd('autocmd!')
vim.wo.number = true         --Numbers on the side
vim.wo.relativenumber = true --Relative number ob the side
vim.opt.hidden = true
vim.opt.autoindent = true
vim.opt.clipboard = 'unnamedplus' --Clipboard Connection For Copy|Paste
vim.opt.backup = false            --Turning Off Creation Of Random Backup Files
vim.opt.showcmd = true            --Showing CMD Bar
vim.opt.cmdheight = 1             --CMD Bar Height
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ai = true        --Auto Indent
vim.opt.si = true        --Smart Indent
vim.opt.wrap = true      --Disabling Wrap
vim.opt.smartcase = false
vim.opt.swapfile = false --Disabling Creation Of SwapFiles
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
-- Optional
vim.opt.expandtab = true
vim.opt.encoding = 'utf-8'
vim.g.softabstop = 4
vim.opt.fileencoding = 'utf8'
vim.opt.whichwrap = '<>hl'
vim.opt.ruler = true
vim.opt.iskeyword:append('-')
vim.opt.backup = false
vim.opt.timeoutlen = 500
vim.opt.ignorecase = true
vim.opt.complete:append('kspell', 'menu', 'menoone', 'longest')
vim.opt.autochdir = true
vim.opt.list = true
--vim.opt.listchars:append{eol='↴',tab='>·',trail='-',extends='>',precedes='<',space='␣'}
vim.cmd("autocmd! BufWritePost $MYVIMRC source%")
--vim.cmd("autocmd! bufwritepost $HOME/.config/nvim/lua/base.vim source %")

-- Sneak enable
vim.cmd [[let g:sneak#label = 1]]

-- Pmenu bg
vim.cmd("highlight Pmenu guibg=NONE")

--vim.cmd [[ hi! MatchParen cterm=NONE,bold gui=NONE,bold  guibg=#ffffff guifg=NONE ]]

-- Auto remove hightlight when enter insert mode or leave insert mode
vim.cmd('autocmd InsertEnter * highlight CursorLine term=NONE cterm=NONE ctermbg=0 ctermfg=NONE')
vim.cmd('autocmd InsertLeave * highlight CursorLine term=NONE cterm=bold ctermbg=236 ctermfg=NONE')

-- Highlight diagnostics in Neovim LSP colorshemes
vim.cmd [[highlight DiagnosticVirtualTextError ctermfg=8]]
vim.cmd [[highlight DiagnosticVirtualTextInfo ctermfg=8]]
vim.cmd [[highlight DiagnosticVirtualTextWarn ctermfg=8]]
vim.cmd [[highlight DiagnosticVirtualTextHint ctermfg=8]]

-- Hilight CursorLine and CursorLine Number
vim.cmd [[highlight CursorLine term=NONE cterm=NONE ctermbg=236 ctermfg=NONE]]
vim.cmd [[hi CursorLineNr cterm=NONE ctermbg=236 ctermfg=7]]

-- toggle cursorline
--vim.api.nvim_set_keymap('n','tc',':set cursorline!<CR>', {noremap = true})

-- How to hightlight markdown heading
vim.cmd [[hi markdownH1 cterm=bold ctermbg=NONE ctermfg=DarkMagenta]]
vim.cmd [[hi markdownH2 cterm=bold ctermbg=NONE ctermfg=DarkMagenta]]
vim.cmd [[hi markdownH3 ctermbg=NONE ctermfg=Magenta]]
vim.cmd [[hi link markdownH4 markdownH3]]
vim.cmd [[hi link markdownH5 markdownH3]]
vim.cmd [[hi link markdownH6 markdownH3]]
vim.cmd [[hi markdownCode ctermbg=8 ctermfg=NONE]]
vim.cmd [[hi markdownCodeBlock ctermbg=8 ctermfg=NONE]]

-- Highlight spellings
vim.cmd [[hi SpellBad ctermbg=NONE ctermfg=NONE cterm=underline]]
vim.cmd [[hi SpellCap ctermbg=NONE ctermfg=NONE cterm=underline]]
vim.cmd [[hi SpellLocal ctermbg=NONE ctermfg=NONE cterm=underline]]
vim.cmd [[hi spellrare ctermbg=none ctermfg=none cterm=underline]]


-- Highlight the completion popup menu in Neovim
vim.cmd [[highlight CmpItemAbbrDeprecated ctermfg=08]]
vim.cmd [[highlight CmpItemAbbrMatch ctermfg=75]]
vim.cmd [[highlight CmpItemAbbrMatchFuzzy ctermfg=75]]
vim.cmd [[highlight CmpItemKindVariable ctermfg=117]]
vim.cmd [[highlight CmpItemKindInterface ctermfg=117]]
vim.cmd [[highlight CmpItemKindText ctermfg=117]]
vim.cmd [[highlight CmpItemKindFunction ctermfg=176]]
vim.cmd [[highlight CmpItemKindMethod ctermfg=176]]
vim.cmd [[highlight CmpItemKindKeyword ctermfg=187]]
vim.cmd [[highlight CmpItemKindProperty ctermfg=187]]
vim.cmd [[highlight CmpItemKindUnit ctermfg=187]]

-- LineNumber Customization
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#B66DFF' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#fc7608' })

-- With context indent highlighted by treesitte
vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "eol:↴"

-- Trigger configuration
--vim.g['UltiSnipsExpandTrigger'] = '<space><space>'
--vim.g['UltiSnipsJumpForwardTrigger'] = '<c-b>'
--vim.g['UltiSnipsJumpBackwardTrigger'] = '<c-z>'

--If you want :UltiSnipsEdit to split your window.
--vim.g['UltiSnipsEditSplit'] = "vertical"

-- Comment and uncomment Toggle button design
vim.cmd [[
function! Comment()
        let ft = &filetype
        if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
                silent s/^/\#/
        elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
                silent s:^:\/\/:g
        elseif ft == 'tex'
                silent s:^:%:g
        elseif ft == 'vim'
                silent s:^:\":g
        endif
endfunction

function! Uncomment()
        let ft = &filetype
        if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
                silent s/^\#//
        elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
                silent s:^\/\/::g
        elseif ft == 'tex'
                silent s:^%::g
        elseif ft == 'vim'
                silent s:^\"::g
        endif
endfunction

function! Toggle()
        try
                call Uncomment()
        catch
                call Comment()
        endtry
endfunction

map <C-x> :call Toggle()<CR>
]]
