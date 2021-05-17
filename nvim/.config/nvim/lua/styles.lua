vim.cmd("colorscheme hydrangea")
af = require('autofuncs')

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
