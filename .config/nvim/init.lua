vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_enable_italic = true
      vim.cmd.colorscheme('everforest')
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { 
      "nvim-telescope/telescope.nvim", 
      "nvim-lua/plenary.nvim" 
    },
    config = function ()
      vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({ 
        ensure_installed = { "lua" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }, 
  {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = function()
      local configs = require('nvim-web-devicons')
      configs.setup({
        color_icons = true,
        default = true,
        strict = true 
      })
    end
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
