-- vim.g.space_before_virtual_text = 5
-- vim.g.diagnostic_enable_virtual_text = 1
-- vim.g.diagnostic_autopop_while_jump = 0

vim.cmd("call sign_define('LspDiagnosticsSignError', {'text': '»', 'texthl': 'LspDiagnosticsError'})")
vim.cmd("call sign_define('LspDiagnosticsSignError', {'text': '»', 'texthl': 'LspDiagnosticsWarning'})")
vim.cmd("call sign_define('LspDiagnosticsSignInformation', {'text': '»', 'texthl': 'LspDiagnosticsInformation'})")
vim.cmd("call sign_define('LspDiagnosticsSignHint', {'text': '»', 'texthl': 'LspDiagnosticsHint'})")
