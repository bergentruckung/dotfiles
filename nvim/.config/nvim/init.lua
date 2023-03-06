vim.g.mapleader = " "
vim.cmd[[filetype on]]

vim.g.python_host_skip_check = 1
vim.g.python3_host_skip_check = 1
vim.g.loaded_python3_provider = 1
vim.g.loaded_python_provider = 1
vim.g.loaded_perl_provider = 1
vim.g.loaded_node_provider = 1
vim.g.did_load_filetypes = 1

-- Disable certain unwanted builtins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "man",
   "netrw",
   "netrwFileHandlers",
   "netrwPlugin",
   "netrwSettings",
   "rrhelper",
   "shada_plugin",
   "spellfile_plugin",
   "tar",
   "tarPlugin",
   "tutor_mode_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

require("options")
require("plugins_list")
require("bindings")
require("styles")
-- Autofunctions
-- require("autofuncs")
-- Custom autofuncs
-- require("custom_autofuncs")
-- require("colemak")
-- require("plugins.my_nvim-cmp")
