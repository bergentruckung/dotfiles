compiler cargo
setlocal textwidth=80
setlocal colorcolumn=+1
setlocal omnifunc=v:lua.vim.lsp.omnifunc
setlocal number
setlocal relativenumber
setlocal nolist
" setlocal spell

let g:lsp_auto_enable = 0
let g:lsp_preview_keep_focus = 0
let g:lsp_preview_float = 0
let g:lsp_preview_autoclose = 0
let g:lsp_insert_text_enabled = 0
let g:lsp_text_edit_enabled = 0
let g:lsp_completion_documentation_enabled = 0
let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_diagnostics_signs_insert_mode_enabled = 0
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_document_highlight_enabled = 0
let g:lsp_signature_help_enabled = 0
let g:lsp_show_message_request_enabled = 0
let g:lsp_preview_doubletap = 0
let g:lsp_document_code_action_signs_enabled = 0

" PackerLoad nvim-cmp
" PackerLoad nvim-lspconfig
" PackerLoad nvim-treesitter
" PackerLoad nvim-treesitter-context

" LspStart
" autocmd BufWritePre *.rs lua vim.lsp.buf.format()

" Debugging
packadd termdebug
let g:termdebug_wide = 1
let g:TermDebugging = 0
au User TermdebugStartPre let g:TermDebugging = 1
au User TermdebugStopPost let g:TermDebugging = 0

nmap <C-c> :Compile<CR>
nmap <Leader>x :Cargo run<CR>
nmap <S-k> :lua vim.lsp.buf.hover()<CR>
nmap <Leader>F :lua vim.lsp.buf.format<CR>
nmap gd <Plug>(rust-def)
nmap gv <Plug>(rust-def-vertical)
nmap <leader>] :cnext<CR>
nmap <leader>[ :cprev<CR>
nmap <leader>d :DebugMain<CR>
nmap <leader>b :DebugAndBreak<CR>
nmap <leader>; :Step<CR>
nmap <leader>rt :RustTest<CR>
nmap <leader>tt :DebugTest<CR>
nmap ; :Over<CR>

nnoremap -- :copen<cr>
