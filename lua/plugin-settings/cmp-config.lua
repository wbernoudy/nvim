local cmp = require 'cmp'
local lspkind = require('lspkind')

cmp.setup {
  -- load vsnip
  snippet = {
    expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
    end
  },
  -- define k-mappings for completion
  mapping = {
  ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace,select = false}),
  ['BS'] = cmp.mapping.abort(),
  ['<TAB>'] = cmp.mapping.select_next_item(),
  ['<S-TAB>'] = cmp.mapping.select_prev_item()
  },
  -- add ons for cmp
  -- https://github.com/topics/nvim-cmp
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'calc' },
    { name = 'latex_symbols' },
--    spell really slows down the completion
--    { name = 'spell' },
  },
  formatting = {
    -- formatting of the names in the completion menu
    format = lspkind.cmp_format({with_text = true, menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      nvim_lua = "[Lua]",
      latex_symbols = "[Latex]"
    })}),
  },
}
