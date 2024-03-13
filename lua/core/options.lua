require("core.diagnostic").setup()

vim.g.editorconfig = true

vim.opt.shell = "/bin/sh" -- fixex issues with fish shell

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- indenting
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

-- other cool stuff
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.mousemodel = "extend"
vim.o.completeopt = "menuone,noselect"
vim.o.clipboard = "unnamedplus"
vim.o.fileencoding = "utf-8"
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.pumheight = 8
vim.o.numberwidth = 4
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.signcolumn = "yes"
vim.o.hidden = true
vim.o.title = true
vim.o.linebreak = true
vim.o.wrap = false

-- listchars
vim.o.list = true
vim.opt.listchars:append {
  space = "·",
  trail = "~",
  tab = "│·",
}

-- swap files
vim.o.undofile = true
vim.o.swapfile = false
vim.o.writebackup = false

-- disable build-in modules
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
