local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
	["<Down>"] = false,
	["<Up>"] = false,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
      },
    },
  }
}
