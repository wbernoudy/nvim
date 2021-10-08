local cmp = require 'cmp'
local lspkind = require('lspkind')

--vim.cmd[[set completeopt=menu,menuone,noselect]]
cmp.setup {
  -- load vsnip
  snippet = {
    expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
    end
  },
  -- define mappings for completion
  mapping = {
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()--{behavior = cmp.SelectBehavior.Select, select = true})
      else
        fallback()
      end
    end,
    ['<Down>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()--{behavior = cmp.SelectBehavior.Select, select = true})
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()--{behavior = cmp.SelectBehavior.Select, select = true})
      else
        fallback()
      end
    end,
    ['<Up>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()--{behavior = cmp.SelectBehavior.Select, select = true})
      else
        fallback()
      end
    end,
   ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = false}),
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
    format = lspkind.cmp_format({with_text = true, maxwidth = 50}),
      buffer = "[Buf]",
      nvim_lsp = "[Lsp]",
      nvim_lua = "[Lua]",
      latex_symbols = "[Tex]",
      vsnip = "[Snip]"
  },
}

