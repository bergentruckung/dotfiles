local Hydra = require('hydra')

-- Cargo-hydra
Hydra({
    name = "Cargo",
    hint = [[
  _b_: build    _c_: check    _r_: run  
  _t_: test
    ]],
    config = {
      color = "blue",
      invoke_on_body = true,
      hint = {
         position = 'bottom',
         border = 'rounded'
      },
    },
    mode = 'n',
    body = '<C-x>',
    heads = {
      { "b", ":Cargo build<cr>" },
      { "c", ":Cargo check<cr>" },
      { "r", ":Cargo run<cr>" },
      { "t", ":Cargo test<cr>" },
    },
})

-- LSP-hydra
Hydra({
    name = "LSP",
    hint = [[
  _d_: declaration       _D_: definition    _f_: format  
  _i_: implementation    _r_: references    _s_: signature_help  
    ]],
    config = {
      color = "blue",
      invoke_on_body = true,
      hint = {
         position = 'bottom',
         border = 'rounded'
      },
    },
    mode = 'n',
    body = '<leader>l',
    heads = {
      { "d", ":lua vim.lsp.buf.declaration()<cr>" },
      { "D", ":lua vim.lsp.buf.definition()<cr>" },
      { "f", ":lua vim.lsp.buf.format()<cr>" },
      { "i", ":lua vim.lsp.buf.implementation()<cr>" },
      { "r", ":lua vim.lsp.buf.references()<cr>" },
      { "s", ":lua vim.lsp.buf.signature_help()<cr>" },
    },
})

-- Packer-hydra
Hydra({
    name = "Packer",
    hint = [[
  _c_: clean    _i_: install    _l_: luafile_source    _t_: status    _u_: sync  
    ]],
    config = {
      color = "blue",
      invoke_on_body = true,
      hint = {
         position = 'bottom',
         border = 'rounded'
      },
    },
    mode = 'n',
    body = '<leader>p',
    heads = {
      { "c", ":PackerClean<cr>" },
      { "i", ":PackerInstall<cr>" },
      { "l", ":luafile %<cr>" },
      { "t", ":PackerStatus<cr>" },
      { "u", ":PackerSync<cr>" },
    },
})

-- AsyncTask-hydra
Hydra({
    name = "AsyncTask",
    hint = [[
  _<space>_: task    _b_: build    _e_: edit    _l_: list    _r_: run    _s_: sync   
    ]],
    color = "blue",
    config = {
      color = "blue",
      invoke_on_body = true,
      hint = {
         position = 'bottom',
         border = 'rounded'
      },
    },
    mode = 'n',
    body = '<leader>a',
    heads = {
      { " ", ":AsyncTask " },
      { "b", ":AsyncTask build<cr>" },
      { "e", ":AsyncTaskEdit<cr>" },
      { "l", ":AsyncTaskList<cr>" },
      { "r", ":AsyncTask run<cr>" },
      { "s", ":AsyncTask sync<cr>" },
    },
})
