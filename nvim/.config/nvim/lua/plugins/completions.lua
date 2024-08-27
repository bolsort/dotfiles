return {
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-nvim-lua'},
  {'hrsh7th/cmp-nvim-lsp-signature-help'},
  {'hrsh7th/cmp-vsnip'},     
  {'hrsh7th/cmp-path'},                            
  {'hrsh7th/cmp-buffer'},                            
  {'hrsh7th/cmp-cmdline'},
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = 'path' },                          -- file paths
          { name = 'nvim_lsp', keyword_length = 3 },  -- from language server
          { name = 'nvim_lsp_signature_help'},        -- display function signatures with current parameter emphasized
          { name = 'nvim_lua', keyword_length = 2},   -- complete neovim's Lua runtime API such vim.lsp.*
          { name = 'buffer', keyword_length = 2 },    -- source current buffer
          { name = 'vsnip', keyword_length = 2 },     -- nvim-cmp source for vim-vsnip 
          { name = 'calc'},                           -- source for math calculation
          { name = 'neorg'},                          -- source neorg
        },
        formatting = {
          fields = {'menu', 'abbr', 'kind'},
          format = function(entry, item)
            local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end,
  },
}
