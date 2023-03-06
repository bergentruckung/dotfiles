local cmp = require 'cmp'
local lspkind = require('lspkind')

cmp.setup({
  -- snippet = {
  --   expand = function(args)
  --     require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  --   end,
  -- },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 50,
      menu = {
    buffer = "[buf]",
    path = "[path]",
    nvim_lsp = "[lsp]",
    -- nvim_lua = "[api]",
    -- luasnip = "[snip]"
      }
    })
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    ['<C-c>'] = cmp.mapping.complete(),
  },
  sources = cmp.config.sources({
    -- { name = 'luasnip' },
    { name = 'nvim_lsp', max_item_count = 1 },
  }, {
    { name = 'buffer', keyword_length = 4 },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path', keyword_length = 4 }
  }, {
    { name = 'cmdline', keyword_length = 3  }
  })
})

-- Setup lspconfig.
if vim.g.lsp_loaded then
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  servers = {'elm-language-server', 'gopls', 'pyright', 'pyright-langserver', 'rust-analyzer'}
  for _, lspsrv in ipairs(servers) do
    require('nvim-lspconfig')[lspsrv].setup {
      capabilities = capabilities
    }
  end
end
