local M = {}

function M.setup()
  local cmp = require "cmp"

  cmp.setup {
    -- snippet = {
      -- expand = function(args)
        -- require("luasnip").lsp_expand(args.body)
      -- end,
    -- },
    formatting = {
      format = function(entry, vim_item)
        vim_item.menu = ({
          nvim_lsp = "(L)",
          nvim_lua = "(N)",
          buffer = "(B)",
          luasnip = "(S)",
        })[entry.source.name]

        return vim_item
      end,
    },
    mapping = {
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      ["<Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          fallback()
        end
      end,
      ["<S-Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        else
          fallback()
        end
      end,
    },
    sources = {
      { name = "nvim_lua" },
      { name = "nvim_lsp", max_item_count = 10 },
      { name = "buffer", keyword_length = 5, max_item_count = 5 },
      { name = "luasnip", max_item_count = 4 },
    },
  }

  require("nvim-autopairs.completion.cmp").setup {}
end

return M
