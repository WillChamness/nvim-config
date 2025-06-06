require("vim-options")
require("vim-keybinds")

-- auto indent when going to the next line
-- vim.cmd("set autoindent")
-- vim.cmd("set smartindent")

-- install lazy.nvim package manager (if it doesn't exist)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- install and setup plugins
require("lazy").setup("plugins")

require("after-lazy-options")
