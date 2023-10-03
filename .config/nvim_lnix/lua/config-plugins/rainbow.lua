-- Ensuring nvim-treesitter.configs it's working
local status, nvim_treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if (not status) then
    print('nvim-treesitter.configs not working')
    return
end

-- Rainbow bracket  setup
nvim_treesitter_configs.setup {
  highlight = {
      -- ...
  },
  -- ...
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
