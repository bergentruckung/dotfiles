af = require('autofuncs')
vim.g.dracula_colorterm = 1
vim.g.dracula_bold = 1
vim.g.dracula_italic = 0
vim.g.dracula_underline = 1
vim.g.dracula_undercurl = 1
vim.g.nord_italic = 1
vim.g.nord_uniform_diff_background = 0
vim.g.nord_bold = 1
vim.g.nord_underline = 0
vim.cmd[[colorscheme nord]]

-- Highlight yanked region
local highlight_yank = {}
highlight_yank["higroup"] = "IncSearch"
highlight_yank["timeout"] = 500
af('TextYankPost', '*', function() vim.highlight.on_yank(highlight_yank) end)

-- Additional highlighting (for plugins)
vim.cmd("highlight link LspDiagnosticsWarning WarningMsg")
vim.cmd("highlight link LspDiagnosticsError ErrorMsg")
vim.cmd("highlight link LspDiagnosticsDefaultInformation InformationMsg")
vim.cmd("highlight link LspDiagnosticsDefaultHint HintMsg")
-- vim.cmd("highlight! link FloatBorder NonText")
-- vim.cmd("highlight! FloatermBorder guifg=#444b71 guibg=#1e2132")
vim.cmd([[
    syntax on
    filetype on
    filetype plugin indent on
]])
