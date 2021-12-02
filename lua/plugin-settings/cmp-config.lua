local cmp = require 'cmp'
--local lspkind = require('lspkind')

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
  -- put the sources in preferred order
  sources = cmp.config.sources({
    { name = 'buffer', option = {max_item_count = 5, keyword_length = 6} },
    { name = 'vsnip'},
    { name = 'nvim_lsp', option = {max_item_count = 5, keyword_length = 2}},
    { name = 'latex_symbols', option = {max_item_count = 5, keyword_length = 3}},
  }),
  formatting = {
    format = require("lspkind").cmp_format({with_text = true, menu = ({
        buffer = "[Buf]",
        nvim_lsp = "[Lsp]",
        latex_symbols = "[Tex]",
        vsnip = "[Vsnip]"
      })}),
  },
--  experimental = {
--      native_menu = true,
--  --    ghost_text = false
--  }
}

-- this is a hack to fix until I can integrate this with gruvbox better
--vim.cmd[[hi CmpItemMenu ctermfg=White]]



