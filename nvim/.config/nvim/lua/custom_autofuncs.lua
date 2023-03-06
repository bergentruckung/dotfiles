vim.cmd("autocmd BufWritePost *.Xresources echo 'Please run: xrdb -merge ~/.Xdefaults for changes to take effect'")

-- vim.cmd("autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)")
vim.cmd("autocmd BufEnter */tmp/odin_model_* set filetype=yaml")
vim.cmd("autocmd BufEnter *.pp set filetype=puppet")
vim.cmd("autocmd BufEnter *.pda set shiftwidth=4")
-- vim.cmd("autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()")
-- vim.cmd("autocmd BufWritePost * lua print('Last saved on ' .. os.date())")
vim.cmd("autocmd BufEnter *.tmux setlocal filetype=tmux")
-- vim.cmd("autocmd BufEnter * silent! lcd %:p:h")
vim.cmd[[autocmd QuickFixCmdPost [^l]* nested cwindow]]
vim.cmd[[autocmd QuickFixCmdPost    l* nested lwindow]]
vim.cmd[[autocmd TextYankPost * :lua vim.highlight.on_yank(highlight_yank)]]
vim.cmd[[autocmd BufRead,BufNewFile *.src set filetype=m4]]
vim.cmd[[autocmd BufRead,BufNewFile *.m4 set filetype=m4]]
