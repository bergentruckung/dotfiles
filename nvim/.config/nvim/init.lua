vim.cmd[[set runtimepath=~/.config/nvim/plugin/,~/.config/nvim/,$VIMRUNTIME]]
vim.cmd[[set packpath=~/.local/share/nvim/site/]]
vim.g.mapleader = " "

vim.g.python_host_skip_check=1
vim.g.python3_host_skip_check=1
vim.g.loaded_python3_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

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

vim.g.loaded_python_provider = 0

-- Nvim options
require("options")
-- Nvim plugins
require("plugins")
-- require("plugin_configs.my_expressline")
-- Keybindings
require("bindings")
-- UI-related styles
require("styles")
-- Autofunctions
-- require("autofuncs")
-- Custom autofuncs
-- require("custom_autofuncs")
--   require("colemak")
