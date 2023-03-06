-- af = require('autofuncs')
-- vim.g.gruvbox_contrast_dark = "medium"
-- vim.g.gruvbox_bold = 1
-- vim.g.gruvbox_invert_selection = 0
-- vim.g.gruvbox_italic = 0
-- vim.g.gruvbox_italicize_comments = 0
-- vim.g.nord_cursor_line_number_background = 1
-- vim.g.nord_italic = 1
-- vim.g.nord_uniform_diff_background = 1
-- vim.g.nord_bold = 1
-- vim.g.nord_underline = 1
vim.cmd("colorscheme tokyonight-night")
-- vim.g.solarized_termcolors=256
-- vim.g.dracula_colorterm = 1 vim.g.dracula_bold = 1
-- vim.g.dracula_italic = 0
-- vim.g.dracula_underline = 1
-- vim.g.dracula_undercurl = 1
-- -- vim.g.seoul256_background = 236
-- vim.g.seoul256_srgb = 1
-- vim.g.jellybeans_use_gui_italics = 0
-- vim.g.jellybeans_use_lowcolor_black = 0
--
-- -- zenburn customizations
-- vim.g.zenburn_high_Contrast = 1
-- vim.g.zenburn_alternate_Visual = 1
-- vim.g.zenburn_alternate_Error = 1
-- vim.g.zenburn_alternate_Include = 1
-- vim.g.zenburn_unified_CursorColumn = 1
-- vim.g.zenburn_disable_bold_CursorBars = 1
-- vim.g.zenburn_subdued_LineNr = 1
-- vim.g.zenburn_transparent = 0
-- vim.g.zenburn_color_also_Ignore = 1
-- vim.g.zenburn_disable_Label_underline = 1
-- vim.g.zenburn_italic_Comment = 0
-- vim.cmd("colorscheme zenburn-bergen")

-- vim.g.ayucolor = "mirage"
-- vim.g.neobones = { italic_comments = false, solid_vert_split = false, lighten_comments = 65, lighten_non_text = 25, lighten_line_nr = 30 }
-- vim.g.rosebones = { lightness = "dim", darkness = "warm", solid_vert_split = false, lighten_comments = 45, lighten_non_text = 25, lighten_line_nr = 30 }
-- vim.g.seoulbones = { lightness = "dim", darkness = "warm", solid_vert_split = false, lighten_comments = 45, lighten_non_text = 25, lighten_line_nr = 30 }
-- vim.g.tokyobones = { lightness = "dim", darkness = "stark", solid_vert_split = false, lighten_comments = 45, lighten_non_text = 25, lighten_line_nr = 30 }
-- vim.g.forestbones = { lightness = "dim", darkness = "stark", solid_vert_split = false, lighten_comments = 45, lighten_non_text = 25, lighten_line_nr = 30 }
-- vim.g.zenbones = { solid_vert_split = false, lighten_comments = 45, lighten_non_text = 25, lighten_line_nr = 30 }
-- vim.g.zenburned = { lightness = "dim", darkness = "stark", solid_vert_split = false, lighten_comments = 45, lighten_non_text = 25, lighten_line_nr = 30 }
-- vim.g.zenwritten = { lightness = "dim",  solid_vert_split = false, lighten_comments = 45, lighten_non_text = 25, lighten_line_nr = 30 }
vim.cmd("sign define DiagnosticSignError text=! texthl=DiagnosticSignError linehl= numhl=")
vim.cmd("sign define DiagnosticSignWarn text=! texthl=DiagnosticSignWarn linehl= numhl=")
vim.cmd("sign define DiagnosticSignInfo text=! texthl=DiagnosticSignInfo linehl= numhl=")
vim.cmd("sign define DiagnosticSignHint text=! texthl=DiagnosticSignHint linehl= numhl=")

if vim.g.colors_name == "dracula" then
   vim.cmd("highlight! link DiagnosticError Error")
   vim.cmd("highlight! link DiagnosticHint PmenuSel")
   -- vim.cmd("highlight! NeogitHunkHeader ctermbg=235 ctermfg=4")
   -- vim.cmd("highlight! NeogitHunkHeaderHighlight ctermbg=235 ctermfg=4")
   vim.cmd("highlight! WinSeparator ctermbg=None")
   vim.cmd("highlight! VertSplit guibg=NONE ctermbg=NONE")
   vim.cmd("highlight! Keyword ctermbg=NONE ctermfg=110 cterm=bold guibg=NONE guifg=#87afd7 gui=NONE")
end

if vim.g.colors_name == "apprentice" then
   vim.cmd("highlight! link DiagnosticError Error")
   vim.cmd("highlight! link DiagnosticHint PmenuSel")
   vim.cmd("highlight! NeogitHunkHeader ctermbg=235 ctermfg=4")
   vim.cmd("highlight! NeogitHunkHeaderHighlight ctermbg=235 ctermfg=4")
   vim.cmd("highlight! WinSeparator ctermbg=None")
   vim.cmd("highlight! VertSplit guibg=NONE ctermbg=NONE")
   -- vim.cmd("highlight! Comment ctermbg=NONE ctermfg=240 cterm=italic guibg=NONE guifg=#585858 gui=NONE")
   -- vim.cmd("highlight! SpecialComment ctermbg=NONE ctermfg=65 cterm=italic guibg=NONE guifg=#5f875f gui=NONE")
   vim.cmd("highlight! Keyword ctermbg=NONE ctermfg=110 cterm=bold guibg=NONE guifg=#87afd7 gui=NONE")
end

if vim.g.colors_name == "zenburn" then
   vim.cmd("highlight! link DiagnosticError Error")
   vim.cmd("highlight! link DiagnosticHint PmenuSel")
   vim.cmd("highlight! DiffAdd ctermfg=71 ctermbg=234")
   vim.cmd("highlight! DiffDelete ctermfg=167 ctermbg=234")
   vim.cmd("highlight! NeogitHunkHeader ctermbg=234 ctermfg=4")
   vim.cmd("highlight! NeogitHunkHeaderHighlight ctermbg=234 ctermfg=4")
   -- vim.cmd("highlight! NeogitDiffContextHighlight ctermbg=234 ctermfg=231")
end

if vim.g.colors_name == "rustbones" then
   vim.cmd("highlight! link DiagnosticError Error")
   vim.cmd("highlight! link DiagnosticHint PmenuSel")
   vim.cmd("highlight! DiffAdd ctermfg=71 ctermbg=234")
   vim.cmd("highlight! DiffDelete ctermfg=167 ctermbg=234")
   vim.cmd("highlight! NeogitHunkHeader ctermbg=234 ctermfg=4")
   vim.cmd("highlight! NeogitHunkHeaderHighlight ctermbg=234 ctermfg=4")
end

if vim.g.colors_name == "ayu" then
   vim.cmd("highlight vertsplit guifg=#687a9e")
end

if vim.g.colors_name == "jellybeans" then
   -- The default pemnu highlights are awful
   vim.cmd("highlight Pmenu guibg=#343434")
end

if vim.g.colors_name == "habamax" then
   vim.cmd("highlight! diffChanged guibg=#1c1c1c guifg=#5f87af")
   vim.cmd("highlight! VertSplit guibg=#1c1c1c guifg=#767676")
end

if vim.g.colors_name == "tokyonight" then
   vim.cmd("highlight! link rustcommentlinedoc rustcommentline")
end

-- Highlight yanked region
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100 }
  end,
})

-- Additional highlighting (for plugins)
-- vim.cmd("highlight link LspDiagnosticsWarning WarningMsg")
-- vim.cmd("highlight link LspDiagnosticsError ErrorMsg")
-- vim.cmd("highlight link LspDiagnosticsDefaultInformation InformationMsg")
-- vim.cmd("highlight link LspDiagnosticsDefaultHint HintMsg")
-- vim.cmd("highlight! link FloatBorder NonText")
-- vim.cmd("highlight! FloatermBorder guifg=#444b71 guibg=#1e2132")
vim.cmd([[
    syntax on
    filetype plugin indent on
]])
