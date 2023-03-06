local neofs = require('neofs')

neofs.setup {
  devicons = true,
}

vim.keymap.set("n", "<leader>`", function()
  require("neofs").open()
end, {noremap = true})

vim.keymap.set("n", "<leader>~", function()
  require("neofs").open("~/.config/nvim/")
end, {noremap = true})
