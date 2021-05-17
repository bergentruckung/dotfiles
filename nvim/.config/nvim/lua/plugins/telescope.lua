local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local action_mt = require('telescope.actions.mt')
local sorters = require('telescope.sorters')
local themes = require('telescope.themes')

require('telescope').setup {
    defaults = {
	winblend = 0,
	preview_cutoff = 120,

	layout_strategy = 'horizontal',
	layout_defaults = {
		horizontal = {
			width_padding = 0.1,
			height_padding = 0.1,
			preview_width = 0.6,
		},
		vertical = {
			width_padding = 0.05,
			height_padding = 1,
			preview_height = 0.5,
		}
	},

	selection_strategy = "reset",
	prompt_position = "top",
	sorting_strategy = "descending",
	scroll_strategy = "cycle",
	vimgrep_arguments = {
	    'rg',
	    '--color=never',
	    '--no-heading',
	    '--with-filename',
	    '--line-number',
	    '--column',
	    '--smart-case'
        },
        file_sorter = sorters.get_fzy_sorter,
        mappings = {
            i = {
                ["<Down>"] = false,
                ["<Up>"] = false,
                ["<c-j>"] = actions.move_selection_next,
                ["<c-k>"] = actions.move_selection_previous,
            },
        },
	color_devicons = true,
	prompt_prefix = "❯ ",
	selection_caret = "❯ ",
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },
        fzf_writer = {
            minimum_grep_characters = 6,
            use_highlighter = false,
        }
    }
}
require('telescope').load_extension('fzy_native')

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
