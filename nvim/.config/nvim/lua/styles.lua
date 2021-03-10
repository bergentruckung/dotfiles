vim.cmd("colorscheme iceberg")
af = require('autofuncs')

-- Statusline
local status = require('statusline')
af('BufEnter', '*', function() vim.o.statusline = status.Create() end)

-- Highlight yanked region
local highlight_yank = {}
highlight_yank["higroup"] = "IncSearch"
highlight_yank["timeout"] = 500
af('TextYankPost', '*', function() vim.highlight.on_yank(highlight_yank) end)

-- Additional highlighting (for plugins)
vim.cmd("highlight link LspDiagnosticsWarning WarningMsg")
vim.cmd("highlight link LspDiagnosticsError ErrorMsg")
vim.cmd("highlight link FloatermBorder FoldColumn")
