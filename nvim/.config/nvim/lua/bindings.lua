bind = require("helpers")
require("custom_funcs")
-- General
---- disable arrow keys
bind('n', '<Up>', '<nop>', 'noremap')
bind('n', '<Down>', '<nop>', 'noremap')
bind('n', '<Left>', '<nop>', 'noremap')
bind('n', '<Right>', '<nop>', 'noremap')
bind('i', '<Up>', '<nop>', 'noremap')
bind('i', '<Down>', '<nop>', 'noremap')
bind('i', '<Left>', '<nop>', 'noremap')
bind('i', '<Right>', '<nop>', 'noremap')
bind('c', '<c-h>', '<left>', 'noremap')
bind('c', '<c-j>', '<down>', 'noremap')
bind('c', '<c-k>', '<up>', 'noremap')
bind('c', '<c-l>', '<right>', 'noremap')

-- Source lua current lua file
bind('n', '<F4>', ':luafile %<cr>', 'noremap', 'silent')

-- Location list
bind('n', '``', ':lopen<cr>', 'noremap')

-- Buffers
bind('n', '<Tab>', ':bnext<cr>', 'noremap', 'silent')
bind('n', '<S-Tab>', ':bprev<cr>', 'noremap', 'silent')
---- save buffer
bind('n', 'ss', ':w<cr>', 'noremap')

-- Splits
bind('n', '<C-j>', '<C-w>j', 'noremap')
bind('n', '<C-k>', '<C-w>k', 'noremap')
bind('n', '<C-l>', '<C-W>l', 'noremap')
bind('n', '<C-h>', '<C-w>h', 'noremap')

-- Macros
bind('n', '<leader>l', ':norm @l<cr>', 'noremap')
bind('n', '<leader>am', ':lua Set_modeline()<cr>')

-- Plugins
---- Packer
bind('n', '<F1>', ':PackerInstall<cr>', 'noremap', 'silent')
bind('n', '<F2>', ':PackerClean<cr>', 'noremap', 'silent')

--- Zoom/restore
bind('n', '<c-a>', ':call v:lua.Zoom_toggle()<cr>', 'silent')

--- Telescope.nvim
bind('n', '<c-p>', ':Telescope buffers<cr>', 'noremap', 'silent')
bind('n', '<c-t>', ':Telescope find_files<cr>', 'noremap', 'silent')
bind('n', '<leader>/', ':Telescope live_grep<cr>', 'noremap', 'silent')
bind('n', '<leader>p', ':Telescope oldfiles<cr>', 'noremap', 'silent')
bind('n', '<F3>', ':lua require("plugins.telescope").find_nvim_dotfiles()<cr>', 'noremap', 'silent')
bind('n', '<F8>', ':lua require("plugins.telescope").find_dotfiles()<cr>', 'noremap', 'silent')
bind('n', '<leader><leader>', ':Telescope builtin<cr>', 'noremap', 'silent')

--- FzfFunky
-- bind('n', '<leader>f', ':FzfFunky<cr>', 'noremap', 'silent')

--- Fern
bind('n', '<leader>`', ':Fern -drawer -reveal=% -toggle %:h<cr>', 'noremap', 'silent')
bind('n', '<leader>~', ':Fern -drawer -reveal=% -toggle %:h ', 'noremap', 'silent')

--- Completion
---- Use <Tab> and <S-Tab> to navigate through popup menu
-- bind('i', '<expr><Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', 'noremap')
-- bind('i', '<expr><S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', 'noremap')
bind('n', '<Tab>', '<Plug>(completion_smart_tab)', 'noremap')
bind('n', '<-stab>', '<Plug>(completion_smart_s_tab)', 'noremap')

--- Tabulous
bind('n', '<leader>t', ':tabnew<cr>', 'noremap')
bind('n', '<leader>T', ':TabulousRename ', 'noremap')

--- vim-floaterm
bind('n', '<leader>;', ':FloatermToggle<CR>', 'silent')
bind('t', '<leader>;', '<C-\\><C-n>:FloatermToggle<CR>', 'silent')

--- vim-wiki
-- bind('n', '<leader><space>', ':VimwikiToggleListItem<CR>', 'silent')

--- nvim-workbench
-- bind('n', '<leader>\'', '<Plug>ToggleProjectWorkbench', 'silent')
-- -- " <Plug>WorkbenchAddCheckbox allows you to easily turned a list in markdown to a checkbox
-- -- " - testing -> - [ ] testing
-- -- " * testing -> * [ ] testing
-- -- " testing -> [ ] testing	# noqa
-- bind('n', '<leader>a', '<Plug>WorkbenchAddCheckbox', 'silent')

-- -- " <Plug>WorkbenchToggleCheckbox allows you to toggle the checkbox
-- -- " - [ ] testing -> - [x] testing
-- -- " - [x] testing -> - [ ] testing
-- bind('n', '<leader><cr>', '<Plug>WorkbenchToggleCheckbox', 'silent')
