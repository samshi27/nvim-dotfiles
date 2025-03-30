vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
local api = vim.api

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
api.nvim_exec([[
  let &t_SI = "\e[2 q"   " Block cursor in insert mode
  let &t_SR = "\e[2 q"   " Block cursor in replace mode
  let &t_EI = "\e[2 q"   " Block cursor in normal mode
]], false)

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
