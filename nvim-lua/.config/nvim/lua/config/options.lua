-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","
vim.opt.swapfile = false
vim.opt.wrap = true
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- VimWiki requirements
vim.opt.compatible = false
vim.cmd("filetype plugin on")
vim.cmd("syntax on")
vim.g.root_spec = { "cwd" }
