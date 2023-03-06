local map = require("utils").map

-- General
---- disable arrow keys
-- map('n', '<Up>', '<nop>') map('n', '<Down>', '<nop>')
-- map('n', '<Left>', '<nop>')
-- map('n', '<Right>', '<nop>')
-- map('i', '<Up>', '<nop>')
-- map('i', '<Down>', '<nop>')
-- map('i', '<Left>', '<nop>')
-- map('i', '<Right>', '<nop>')
-- map('c', '<c-h>', '<left>')
-- map('c', '<c-j>', '<down>')
-- map('c', '<c-k>', '<up>')
-- map('c', '<c-l>', '<right>')

-- Terminal
map('t', '<leader>[', '<c-\\><c-n>')
map('n', "<leader>'", ':call v:lua.open_vert_terminal()<cr>', { silent = true })

-- Source lua current lua file
map('n', '<F4>', ':luafile %<cr>', { silent = true })

-- map('n', '<Leader>q', 'q', { silent = true })
map('n', '<m-q>', ':quit<cr>', { silent = true })

-- Sort selected lines
map('v', '<Leader>s', ':sort<cr>')

map('n', '<c-r>', ':redo<cr>')

-- Location list
-- map('n', '``', ':lopen<cr>')

-- Buffers
-- map('n', '<Tab>', ':bnext<cr>', { silent = true })
-- map('n', '<S-Tab>', ':bprev<cr>', { silent = true })
---- save buffer
map('n', '<C-s>', ':w<cr>')

-- Splits
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-W>l')
map('n', '<C-h>', '<C-w>h')

-- Macros
map('n', '<leader>l', ':norm @l<cr>')
-- map('n', '<leader>am', ':lua Set_modeline()<cr>')

-- Plugins
---- Packer
-- map('n', '<leader>pi', ':PackerInstall<cr>', { silent = true })
-- map('n', '<leader>pc', ':PackerClean<cr>', { silent = true })
-- map('n', '<leader>ps', ':PackerSync<cr>', { silent = true })

--- Zoom/restore
map('n', '<c-w>z', ':call v:lua.Zoom_toggle()<cr>', { silent = true })

--- Telescope.nvim
map('n', '<leader>fb', ':Telescope buffers<cr>', { silent = true })
map('n', '<leader>ff', ':Telescope find_files<cr>', { silent = true })
map('n', '<leader>/', ':Telescope live_grep<cr>', { silent = true })
-- map('n', '<leader>p', ':Telescope oldfiles<cr>', { silent = true })
map('n', '<F3>', ':lua require("plugins.my_telescope").find_nvim_dotfiles()<cr>', { silent = true })
map('n', '<F5>', ':lua require("plugins.my_telescope").find_dotfiles()<cr>', { silent = true })
map('n', '<leader>gc', ':Telescope git_commits<cr>', { silent = true })
map('n', '<leader>tt', ':TodoTelescope<cr>', { silent = true })
map('n', '<leader>ls', ':Telescope lsp_document_symbols<cr>', { silent = true })
map('n', '<leader>lr', ':Telescope lsp_references<cr>', { silent = true })
map('n', ';;', ':Telescope spell_suggest<cr>', { silent = true })
-- map('n', '<leader>fb', ':Telescope file_browser<cr>', { silent = true })

--- FzfFunky
-- map('n', '<leader>f', ':FzfFunky<cr>', { silent = true })

--- FzfLua
-- map('n', '<c-t>', ':FzfLua files<cr>', { silent = true })
-- map('n', '<c-p>', ':FzfLua buffers<cr>', { silent = true })
-- map('n', '<leader>f', ':FzfLua live_grep_native<cr>', { silent = true })
-- map('n', '<leader>/', ':FzfLua grep_cWORD<cr>', { silent = true })
-- map('v', '<leader>/', ':FzfLua grep_visual<cr>', { silent = true })
-- map('n', '<F3>', ":lua require'fzf-lua'.fzf_exec('fd --type f . ~/.config/nvim/', { actions = require'fzf-lua'.defaults.actions.files })<cr>", { silent = true })

--- Fern
-- map('n', '<leader>`', ':Fern -drawer -reveal=% -toggle %:h<cr>', { silent = true })
-- map('n', '<leader>~', ':Fern -drawer -reveal=% -toggle %:h ', { silent = true })

--- Completion
---- Use <Tab> and <S-Tab> to navigate through popup menu
-- map('i', '<expr><Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"')
-- map('i', '<expr><S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"')
-- map('n', '<Tab>', '<Plug>(completion_smart_tab)')
-- map('n', '<-stab>', '<Plug>(completion_smart_s_tab)')

--- Tabulous
-- map('n', '<m-;>', ':tabnew<cr>')
-- map('n', '<m-\'>', ':TabulousRename ')

--- vim-floaterm
-- map('n', '<leader><leader>', ':FloatermToggle<CR>', { silent = true })
-- map('t', '<leader><leader>', '<C-\\><C-n>:FloatermToggle<CR>', { silent = true })

--- vim-wiki
-- map('n', '<leader>ww', ':lua Open_databank()<cr>', { silent = true })

--- nvim-workbench
-- map('n', '<leader>\'', '<Plug>ToggleProjectWorkbench', { silent = true })
-- -- " <Plug>WorkbenchAddCheckbox allows you to easily turned a list in markdown to a checkbox
-- -- " - testing -> - [ ] testing
-- -- " * testing -> * [ ] testing
-- -- " testing -> [ ] testing	# noqa
-- map('n', '<leader>a', '<Plug>WorkbenchAddCheckbox', { silent = true })

-- -- " <Plug>WorkbenchToggleCheckbox allows you to toggle the checkbox
-- -- " - [ ] testing -> - [x] testing
-- -- " - [x] testing -> - [ ] testing
-- map('n', '<leader><cr>', '<Plug>WorkbenchToggleCheckbox', { silent = true })
--- nvim-tree
-- map('n', '<leader>`', ':NvimTreeToggle<cr>', { silent = true })

--- lspsaga
--[[ map('n', 'gh', ':Lspsaga lsp_finder<cr>', { silent = true })
map('n', '<leader>ca', ':Lspsaga code_action<cr>', { silent = true })
map('v', '<leader>ca', ':<C-U>Lspsaga range_code_action<cr>', { silent = true })
map('n', 'K', ':Lspsaga hover_doc<cr>', { silent = true })
map('n', '<C-f>', ':lua require("lspsaga.action").smart_scroll_with_saga(1)<cr>', { silent = true })
map('n', '<C-b>', ':lua require("lspsaga.action").smart_scroll_with_saga(-1)<cr>', { silent = true })
map('n', 'gs', ':Lspsaga signature_help<cr>', { silent = true })
map('n', 'gr', ':Lspsaga rename<cr>', { silent = true })
map('n', 'gd', ':Lspsaga preview_definition<cr>', { silent = true })
map('n', 'gl', ':Lspsaga show_line_diagnostics<cr>', { silent = true }) ]]

-- LazyGit
-- map('n', '<Leader>G', ':LazyGit<cr>', { silent = true })

-- hardmode
-- map('n', '<Leader>h', ':call ToggleHardMode()<CR>', { silent = true })

-- async
map('n', '<leader>at', ':AsyncTask ')
map('n', '<leader><leader>', ':AsyncTask build<cr>')
map('n', '<leader>al', ':AsyncTaskList<cr>')
map('n', '<leader>ae', ':AsyncTaskEdit<cr>')
-- map('n', '<leader>r', ':AsyncTask run<cr>')
-- map('n', '<leader>s', ':AsyncTask sync<cr>')

-- completion.nvim
--[[ map('i', '<tab>', '<Plug>(completion_smart_tab)')
map('i', '<s-tab>', '<Plug>(completion_smart_s_tab)') ]]

-- vgit
-- map('n', '``', ':VGit<cr>', { silent = true })

-- dirbuf
-- map('n', '<leader>`', ':call v:lua.Dirbuf_new_tab()<cr>', { silent = true })
--
-- map('n', '<F2>', ':call v:lua.ToggleKeymap()<cr>', { silent = true })

-- neogen
-- map('n', '<leader>gf', ':Neogen func<cr>', { silent = true })
-- map('n', '<leader>gc', ':Neogen class<cr>', { silent = true })
-- map('n', '<leader>gt', ':Neogen type<cr>', { silent = true })

-- mkdx
map('n', '``', ':call v:lua.enable_mkdx()<cr>', { silent = true })

-- venn
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>V', ":lua Toggle_venn()<CR>", { noremap = true})
vim.api.nvim_buf_set_keymap(0, 'v', '<leader>v', ":VBox<cr>", { noremap = true })

-- neogit
map('n', '<leader>gg', ':Neogit<cr>', { silent = true })

-- diffview
map('n', '<leader>dv', ':call v:lua.DiffviewToggle()<cr>', { silent = true })
-- map('n', '<leader>dc', ':DiffviewClose<cr>', { silent = true })

-- makeprg
-- map('n', '--', ':make build<cr>', { silent = true })

-- colemak
-- map('n', '<c-s>', '<c-d>', { silent = true })
-- map('n', '<c-l>', '<c-u>', { silent = true })
-- map('n', '<c-f>', '<c-e>', { silent = true })
-- map('n', '<c-o>', '<c-o>', { silent = true })
-- map('n', '<c-u>', '<c-u>', { silent = true })
-- map('n', '<c-d>', '<c-g>', { silent = true })

-- FZF.vim
-- map('n', '<c-t>', ':Files<cr>', { silent = true })
-- map('n', '<leader>l', ':Lines<cr>', { silent = true })
-- map('n', '<leader>t', ':Buffers<cr>', { silent = true })
-- map('n', '<leader>/', ':Rg<cr>', { silent = true })
-- map('n', '<leader>*', ':Rg <c-r><c-w><cr>', { silent = true })
-- map('n', '<F3>', ':Files ~/.config/nvim/<cr>', { silent = true })
-- map('n', '<F5>', ':Files ~/.dotfiles/<cr>', { silent = true })
-- map('n', '<leader>fd', ':Files ~/.dotfiles/<cr>', { silent = true })
--
-- map('n', '`/', '/<c-r>"<cr>', { silent = true })
-- map('n', '<leader>gr', ':References<cr>', { silent = true })
-- map('n', '<leader>g/', ':DocumentSymbols<cr>', { silent = true })
-- map('n', '<leader>g?', ':WorkspaceSymbols<cr>', { silent = true })
-- map('n', '<leader>ga', ':CodeActions<cr>', { silent = true })
-- map('n', '<leader>gam', ':CodeActionMenu<cr>', { silent = true })
-- map('n', '<leader>f', ':Files<cr>', { silent = true })
-- map('n', '<leader>b', ':Buffers<cr>', { silent = true })
-- map('n', '<leader>/', ':Rg<cr>', { silent = true })


-- gitblame
map('n', '<leader>gb', ':GitBlameToggle<cr>', { silent = true })

-- lazy
map('n', '<leader>L', ':Lazy<cr>', { silent = true })

-- zenmode
map('n', '<leader>z', ':ZenMode<cr>', { silent = true })

-- fnr
map('n', '<leader>r', '<Plug>(FNR)', { silent = true })
map('x', '<leader>r', '<Plug>(FNR)', { silent = true })
map('n', '<leader>R', '<Plug>(FNR%)', { silent = true })
map('x', '<leader>R', '<Plug>(FNR%)', { silent = true })

-- oil
map('n', '<leader>`', ':Oil ')
map('n', '<leader>-', ':lua require("oil").open()<cr>', { silent = true })

-- neorg
map('n', '<leader>ni', ':Neorg index<cr>')
