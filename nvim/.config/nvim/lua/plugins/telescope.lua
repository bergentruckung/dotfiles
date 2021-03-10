local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        mappings = {
            i = {
                ["<Down>"] = false,
                ["<Up>"] = false,
                ["<c-j>"] = actions.move_selection_next,
                ["<c-k>"] = actions.move_selection_previous,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')

local M = {}
M.search_dotfiles = function()
    require('telescope.builtin').find_files({
        prompt_title = ' Nvim configs ',
        cwd = '~/.config/nvim/',
        find_command = { 'fd', '--follow', '--hidden' },
    })
end

return M
