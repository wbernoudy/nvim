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
        cmp.select_prev_item()--{behavior = cmp.SelectBehavior.Select, select = true})
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
  format = require("lspkind").cmp_format({with_text = true, menu = ({
-- this does not seem to be working but I will keep it here for now in case they fix the problem upstream
      buffer = "[Buf]",
      path = "[Path]",
      nvim_lsp = "[Lsp]",
      nvim_lua = "[Lua]",
      latex_symbols = "[Tex]",
      vsnip = "[Vsnip]"
    })}),
},
}
-- this is a hack to fix until I can integrate this with gruvbox better
vim.cmd[[hi CmpItemMenu ctermfg=White]]




