local M = {}

function M.setup()
  require("toggleterm").setup {
    size = 20,
    open_mapping = [[<c-t>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = false,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 1,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  }
end

return M
