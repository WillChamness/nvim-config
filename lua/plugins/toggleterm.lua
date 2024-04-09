return {
   "akinsho/toggleterm.nvim",
   version = "*",
   config = function()
      local Terminal = require("toggleterm.terminal").Terminal

      -- navigate around the windows
      function _G.SET_TERMINAL_KEYMAPS()
         local opts = { noremap = true }
         vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
         vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
         vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
         vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
      end

      vim.cmd("autocmd! TermOpen term://* lua SET_TERMINAL_KEYMAPS()")

      -- create terminal in horizontal layout
      local function toggle_horizontal()
         local terminal = Terminal:new({
            size = 10,
            hide_numbers = true,
            direction = "horizontal",
            close_on_exit = true,
            shell = vim.o.shell,
         })
         terminal:toggle()
      end

      -- create terminal in vertical layout
      local function toggle_vertical()
         local terminal = Terminal:new({
            size = 40,
            hide_numbers = true,
            direction = "vertical",
            close_on_exit = true,
            shell = vim.o.shell,
         })
         terminal:toggle()
      end

      -- open various terminal applications
      local function toggle_lazygit()
         local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
         lazygit:toggle()
      end

      local function toggle_python()
         local python = Terminal:new({ cmd = "python", hidden = true, direction = "float" })
         python:toggle()
      end

      local function toggle_node()
         local node = Terminal:new({ cmd = "node", hidden = true, direction = "float" })
         node:toggle()
      end

      local function toggle_frogmouth()
         local frogmouth = Terminal:new({ cmd = "frogmouth README.md", hidden = true, direction = "float" })
         frogmouth:toggle()
      end

      local function toggle_htop()
         local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })
         htop:toggle()
      end

      -- open terminal on keys
      vim.keymap.set("n", "<leader>th", toggle_horizontal)
      vim.keymap.set("n", "<leader>tv", toggle_vertical)
      vim.keymap.set("n", "<leader>tg", toggle_lazygit)
      vim.keymap.set("n", "<leader>tp", toggle_python)
      vim.keymap.set("n", "<leader>tn", toggle_node)
      vim.keymap.set("n", "<leader>tf", toggle_frogmouth)
      vim.keymap.set("n", "<leader>tH", toggle_htop)
   end,
}
