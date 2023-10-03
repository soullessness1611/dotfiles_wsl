local status, zm = pcall(require,"zen-mode")
if (not status) then
    print('Zen-mode not working')
    return
end
