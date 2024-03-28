-- set the <leader> key to space
vim.g.mapleader = " "
-- use spaces instead of tab characters
vim.cmd("set expandtab")
vim.cmd("set tabstop=3") -- use 3 spaces
vim.cmd("set softtabstop=3")
vim.cmd("set shiftwidth=3") -- use 3 spaces when shift+tab
vim.cmd("set smarttab")

-- automatically indent when pressing enter
vim.cmd("set autoindent")
vim.cmd("set smartindent")

-- use relative line numbering
vim.cmd("set relativenumber")

-- if the line is too long, don't wrap to the next line
vim.cmd("set nowrap")

-- set default terminal to bash instead of my default terminal (zsh)
vim.cmd("set shell=/bin/bash")
