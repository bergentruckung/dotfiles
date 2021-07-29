local present, telescope = pcall(require, "telescope")
if not present then
    return
end
telescope.setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "flex",
    layout_config = {
      horizontal = {
	mirror = false,
      },
      vertical = {
	mirror = false,
      },
      preview_cutoff = 120,
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {
      "shorten",
      "absolute"
    },
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    mappings = {
      i = {
	["<c-j>"] = require'telescope.actions'.move_selection_next,
	["<c-k>"] = require'telescope.actions'.move_selection_previous,
	["<esc>"] = require("telescope.actions").close,
	["<c-c>"] = require("telescope.actions").close,
      },
      n = {
        ["<c-d>"] = require("telescope.actions").delete_buffer,
	["<esc>"] = require("telescope.actions").close,
	["<c-c>"] = require("telescope.actions").close,
      }
    },

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

local M = {}
M.find_nvim_dotfiles = function()
require('telescope.builtin').find_files({
    prompt_title = ' Nvim configs ',
    cwd = '~/.config/nvim/',
    find_command = { 'fd', '--follow', '--hidden' },
})
end

M.find_dotfiles = function()
require('telescope.builtin').find_files({
    prompt_title = ' Dotfiles ',
    cwd = '~/.dotfiles/',
    find_command = { 'fd', '--follow', '--hidden' },
})
end

return M
