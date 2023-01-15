local map = require("core.utils").map

vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

-- some maps
map("n", "<leader>;t", "<cmd>PlenaryBustedFile %<cr>")
map("n", "<leader>;s", function()
  vim.cmd.source "%"
end)
