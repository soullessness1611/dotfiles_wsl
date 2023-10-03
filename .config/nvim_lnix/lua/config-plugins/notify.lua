-- Ensuring Notify it's working
local status, notify = pcall(require, 'notify')
if (not status) then
    print('Notify not working')
    return
end

notify.setup({
    background_colour = 'nil',
    fps = 30,
    icons = {
        DEBUG = '',
        ERROR = '',
        INFO = '',
        TRACE = '✎',
        WARN = '',
    },
    level = 2,
    minimum_width = 50,
    render = 'default',
    stages = 'fade_in_slide_out',
    timeout = 2000,
    top_down = false,
})

vim.notify = notify

-- Highlights
vim.cmd [[
    highlight NotifyERRORBorder guifg=#8A1F1F
    highlight NotifyWARNBorder guifg=#79491D
    highlight NotifyINFOBorder guifg=#4F6752
    highlight NotifyDEBUGBorder guifg=#8B8B8B
    highlight NotifyTRACEBorder guifg=#4F3552
    highlight NotifyERRORIcon guifg=#F70067
    highlight NotifyWARNIcon guifg=#F79000
    highlight NotifyINFOIcon guifg=#A9FF68
    highlight NotifyDEBUGIcon guifg=#8B8B8B
    highlight NotifyTRACEIcon guifg=#D484FF
    highlight NotifyERRORTitle  guifg=#F70067
    highlight NotifyWARNTitle guifg=#F79000
    highlight NotifyINFOTitle guifg=#A9FF68
    highlight NotifyDEBUGTitle  guifg=#8B8B8B
    highlight NotifyTRACETitle  guifg=#D484FF
    highlight link NotifyERRORBody Normal
    highlight link NotifyWARNBody Normal
    highlight link NotifyINFOBody Normal
    highlight link NotifyDEBUGBody Normal
    highlight link NotifyTRACEBody Normal
]]
