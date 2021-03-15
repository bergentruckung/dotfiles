vim.cmd("colorscheme iceberg")
af = require('autofuncs')

-- Statusline
-- local status = require('statusline')
-- af('BufEnter', '*', function() vim.wo.statusline = status.Active() end)
-- af('WinEnter', '*', function() vim.wo.statusline = status.Active() end)
-- af('BufLeave', '*', function() vim.wo.statusline = status.Inactive() end)
-- af('WinLeave', '*', function() vim.wo.statusline = status.Inactive() end)

-- Highlight yanked region
local highlight_yank = {}
highlight_yank["higroup"] = "IncSearch"
highlight_yank["timeout"] = 500
af('TextYankPost', '*', function() vim.highlight.on_yank(highlight_yank) end)

-- Additional highlighting (for plugins)
vim.cmd("highlight link LspDiagnosticsWarning WarningMsg")
vim.cmd("highlight link LspDiagnosticsError ErrorMsg")
vim.cmd("highlight link FloatermBorder FoldColumn")

-- Highlights for statusline
vim.cmd("highlight link StatusLineMiddleGroup Directory")
vim.cmd("highlight link StatusLineLeftGroup Constant")
vim.cmd("highlight link StatusLineGit Operator")
vim.cmd("highlight link StatusLineInactive SignColumn")
