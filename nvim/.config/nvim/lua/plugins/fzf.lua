-- FZF config
function FloatingFZF()
    local col_resize = 0.4
    local line_resize = 0.3
    local cols = vim.o.columns
    local lines = vim.o.lines
    -- TODO: see if there's a better way to do this in Lua
    local width = vim.fn["float2nr"](cols * 0.4)
    local height = vim.fn["float2nr"](lines * 0.4)
    local opts = {
        relative = 'editor',
        row = (lines - height) / 2,
        col = (cols - width) / 2,
        width = width,
        height = height
    }
    vim.fn["nvim_open_win"](vim.fn["nvim_create_buf"](false, true), true, opts)
end

vim.g.fzf_preview_window = {
    right = '50%'
}

vim.g.fzf_layout = {
    window = 'call v:lua.FloatingFZF()'
}
