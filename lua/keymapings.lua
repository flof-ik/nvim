local u = require "utils"
local nmap, map, expr = u.nmap, u.map, u.expr
-- map("i", "jk", "<ESC>")
nmap("<C-s>", "<cmd>write!<cr>")
nmap("<leader>h", "<cmd>nohlsearch<cr>")
nmap("<leader>q", "<cmd>quit!<cr>")
nmap("<leader>w", "<cmd>write!<cr>")
nmap("<leader>e", "<cmd>NvimTreeToggle<cr>")
nmap("<leader>/", "<cmd>lua require[[Comment]].toggle()<cr>")
map("v", "<leader>/", "gc")
nmap("<leader>ps", "<cmd>PackerSync<cr>")

-- Windows
for _, k in ipairs { "h", "j", "k", "l" } do
  nmap(string.format("<C-%s>", k), string.format("<cmd>wincmd %s<cr>", k))
  map("t", string.format("<C-%s>", k), string.format("<C-\\><C-N><C-w>%s", k))
end

nmap("<C-Left>", "<cmd>vertical resize -2<cr>")
nmap("<C-Up", "<cmd>resize -1<cr>")
nmap("<C-Down>", "<cmd>resize +2<cr>")
nmap("<C-Right>", "<cmd>vertical resize +2<CR>")

-- Alternative up/down for arows
expr("i", "<C-j>", 'pumvisible() ? "\\<down>" : "\\<C-j>"')
expr("i", "<C-k>", 'pumvisible() ? "\\<up>" : "\\<C-k>"')
expr("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"')
expr("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"')

-- Move line
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "K", ":move '<-2<CR>gv-gv")
map("v", "J", ":move '>+1<CR>gv-gv")
nmap("<A-j>", ":m .+1<CR>==")
nmap("<A-k>", ":m .-2<CR>==")

-- Telescope
nmap("<leader>f", "<cmd>Telescope find_files<cr>")
nmap("<leader>st", "<cmd>Telescope live_grep<cr>")
nmap("<leader>sT", "<cmd>Telescope grep_string<cr>")
nmap("<leader>sp", "<cmd>Telescope projects<cr>")
nmap("<leader>sr", "<cmd>Telescope oldfiles<cr>")
nmap("<leader>sb", "<cmd>Telescope git_branches<cr>")

-- Ultest
nmap("<leader>tt", "<cmd>Ultest<cr>")
nmap("<leader>ts", "<cmd>UltestStop<cr>")
nmap("<leader>tc", "<cmd>UltestClear<cr>")
nmap("<leader>tn", "<cmd>UltestNearest<cr>")
nmap("<leader>to", "<cmd>UltestOutput<cr>")
nmap("<leader>tj", "<Plug>(ultest-next-fail)")
nmap("<leader>tk", "<Plug>(ultest-prev-fail)")

-- Buffer
nmap("<A-0>", "<cmd>BufferLast<cr>")
nmap("<C-w>", "<cmd>BufferClose<cr>")
nmap("<leader>c", "<cmd>BufferClose!<cr>")
for i = 1, 9 do
  nmap(string.format("<A-%d>", i), string.format("<cmd>BufferGoto %d<cr>", i))
end
