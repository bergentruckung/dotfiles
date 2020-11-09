vim.g.space_before_virtual_text = 5
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_autopop_while_jump = 0

vim.cmd("call sign_define('LspDiagnosticsErrorSign', {'text': 'E', 'texthl': 'LspDiagnosticsError'})")
vim.cmd("call sign_define('LspDiagnosticsWarningSign', {'text': 'W', 'texthl': 'LspDiagnosticsWarning'})")
vim.cmd("call sign_define('LspDiagnosticsInformationSign', {'text': 'I', 'texthl': 'LspDiagnosticsInformation'})")
vim.cmd("call sign_define('LspDiagnosticsHintSign', {'text': 'H', 'texthl': 'LspDiagnosticsHint'})")
